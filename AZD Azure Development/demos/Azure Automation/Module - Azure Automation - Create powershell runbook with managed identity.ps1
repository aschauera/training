#Install required module
Install-Module -Name Az.ManagedServiceIdentity
# Sign in to your Azure subscription
$sub = Get-AzSubscription -ErrorAction SilentlyContinue
if(-not($sub))
{
    Connect-AzAccount
}
$sub = Get-AzSubscription -SubscriptionName "MSDN Platforms Subscription" |  Set-AzContext
Get-AzContext
# If you have multiple subscriptions, set the one to use
# Select-AzSubscription -SubscriptionId <SUBSCRIPTIONID>
$resourceGroup = "training01"

# These values are used in this tutorial
$automationAccount = "trainingautomation01"
$userAssignedManagedIdentity = "automation01identity"

#Add correct role definitions for user and system managed identity to enable the rights to run the workbook later
$role1 = "DevTest Labs User"

$SAMI = (Get-AzAutomationAccount -ResourceGroupName $resourceGroup -Name $automationAccount).Identity.PrincipalId
New-AzRoleAssignment `
    -ObjectId $SAMI `
    -ResourceGroupName $resourceGroup `
    -RoleDefinitionName $role1
    
$UAMI = (Get-AzUserAssignedIdentity -ResourceGroupName $resourceGroup -Name $userAssignedManagedIdentity).PrincipalId
New-AzRoleAssignment `
    -ObjectId $UAMI `
    -ResourceGroupName $resourceGroup `
    -RoleDefinitionName $role1

$role2 = "Reader"
New-AzRoleAssignment `
    -ObjectId $SAMI `
    -ResourceGroupName $resourceGroup `
    -RoleDefinitionName $role2