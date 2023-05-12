#Connect with SP
# Use the application ID as the username, and the secret as password

$secret= ConvertTo-SecureString "xK18Q~z01idjv.Yl-UMelTef0EDaZ2y8ruK9gdax" -AsPlainText -Force
$ApplicationId = "74d15ac7-85ad-41aa-ab0c-9db229c61e1d"
$TenantId="307fb92d-5a63-4bbe-919f-632d7bfeca89"

$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $ApplicationId, $secret 

Connect-AzAccount -ServicePrincipal -TenantId $TenantId -Credential $Credential

# Assign RBAC to principal
New-AzRoleAssignment -ApplicationId <service principal application ID> -RoleDefinitionName 'Reader'

# Logout
Disconnect-AzAccount

