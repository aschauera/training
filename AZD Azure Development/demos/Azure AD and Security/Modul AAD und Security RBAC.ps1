###################
#Azure AD 
##################
Find-Module AzureAD | Install-Module -Scope CurrentUser

#Connect to AZ to get TenantId
Connect-AzAccount
$subscription = Get-AzSubscription -SubscriptionId "41896939-6760-4fbc-aa50-c5dde7e96f05" | Set-AzContext
#Ausgabe der ID
$sub = Select-AzSubscription -Subscription "41896939-6760-4fbc-aa50-c5dde7e96f05"

$tenantId = $sub.Tenant.Id

#Connect
#Training tenant (aaschauer.onmicrosoft.com)
#Connect-AzureAD -TenantId $tenantId
#Tenant aaschaueroutlook.com.onmicrosoft.com
Connect-AzureAD -TenantId 307fb92d-5a63-4bbe-919f-632d7bfeca89
#Alle eigenschaften des User Objects abrufen
Get-AzureADUser | Get-Member
#Ausgabe als Tabelle
get-azureaduser | format-table -Property UserPrincipalName,UserType
#Alle GUEST User abrufen
Get-AzureADUser | Where {$PSItem.UserType -eq "Guest"} 

#Get user by search
Get-AzureADUser -SearchString UPN@DOMAIN.COM | Set-AzureADUser -UserType member

#Create User
$passwordProfile = "" | Select-Object Password,ForceChangePasswordNextLogin
$passwordProfile.ForceChangePasswordNextLogin = $true
$passwordProfile.Password = 'Pa55w.rd1234'

$user = New-AzureADUser -UserPrincipalName 'psTestUser01@aaschaueroutlook.onmicrosoft.com'`
                -DisplayName 'PS Test User 01' `
                -GivenName 'Test' `
                -Surname 'User' `
                -PasswordProfile $passwordProfile `
                -AccountEnabled $true `
                -MailNickName 'pstestuser01'

$user
#create a security group
$sGroup = New-AzureADGroup -Description 'Training Azure Team Users 01' `
                 -DisplayName 'Azure Team' `
                 -MailEnabled $false `
                 -MailNickName 'AzureTeam' `
                 -SecurityEnabled $true
$sGroup
#Add new user to new group
Add-AzureADGroupMember -ObjectId $sGroup.ObjectId -RefObjectId $user.ObjectId
#Add roles for new group
New-AzRoleAssignment -ObjectId $sGroup.ObjectId -Scope "<resource>" -RoleDefinitionName "Reader"

#clean up
Remove-AzureADUser -ObjectId $user.ObjectId
Remove-AzureADGroup -ObjectId $sGroup.ObjectId

#get all enterprise apps
Get-AzureADApplication

#get all registered devices
Get-AzureADDevice –All $true | Get-AzureADDeviceRegisteredUser


#PIM
Install-Module -Name Microsoft.Azure.ActiveDirectory.PIM.PSModule 
Connect-PimService -TenantName 307fb92d-5a63-4bbe-919f-632d7bfeca89 #tenant ID siehe oben
Disconnect-PimService

Disconnect-AzureAD

############### 
#AZ RBAC 
###############
#Connect to ARM to get TenantId
Connect-AzAccount
Get-AzSubscription -SubscriptionName "MSDN Platforms Subscription" | Set-AzContext
$subscription = Select-AzSubscription "MSDN Platforms Subscription"
#Ausgabe der ID
$tenantId = $subscription.Tenant.Id
#TenantID
$tenantId

$rd = Get-AzRoleDefinition | ? {$_.IsCustom -eq $true} | FT Id, Name, IsCustom

Get-AzProviderOperation "Microsoft.Compute/virtualMachines/*" | FT OperationName, Operation,  Description -AutoSize
 (Get-AzRoleDefinition "Contributor").Actions

#Create custom "VM OPerator role"
New-AzRoleDefinition  "C:\Users\anaschau\OneDrive\Training\Azure Development\Demos\vmoperator.json" 
$vmOpRole = Get-AzRoleDefinition | ? {$_.Name -eq "Training Virtual Machine Operator"} | FT Id, Name, IsCustom

#Create role assignment for new role

$rg = Get-AzResourceGroup | ? {$_.ResourceGroupName -eq "training03"}

New-AzRoleAssignment -ObjectId $sGroup.ObjectId -Scope $rg.ResourceId -RoleDefinitionName "Training Virtual Machine Operator"

#Export custom roles to json
Get-AzRoleDefinition "Virtual Machine Contributor" | ConvertTo-Json | Out-File roledefinition.json

#remove
Remove-AzRoleDefinition -Name "Training Virtual Machine Operator"

####################
###Azure Ad
###################
#Connect
Connect-AzureAD -TenantId $subscription.Subscription.TenantId
#Alle eigenschaften des User Objects abrufen
Get-AzureADUser | Get-Member
#Alle GUEST User abrufen
get-azureaduser | format-table -Property DisplayName, UserType
Get-AzureADUser | Where {$PSItem.UserType -eq "Guest"} 

# Create a new user
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "!!fromscript#21"

$newUser = New-AzureADUser -AccountEnabled $true -DisplayName "Training Account" -PasswordProfile $passwordProfile -UserPrincipalName training@aaschaueroutlook.onmicrosoft.com -MailNickName "Training01"
# Remove user
Remove-AzureADUser -ObjectId training@aaschaueroutlook.onmicrosoft.com
# Get all enterprise applications
Get-AzureADApplication


#get resource group and role assignments
$rg = Get-AzResourceGroup | ? {$_.ResourceGroupName -eq "training01"}
Get-AzRoleAssignment -Scope $rg.ResourceId
New-AzRoleAssignment -ObjectId $user.ObjectId -Scope $rg.ResourceId -RoleDefinitionName "Reader"
