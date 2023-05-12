#New-MsolFederatedDomain
# Mehrere AD mit einer AAD domain verbinden
Convert-MsolDomaintoFederated -DomainName azuretraining23.onmicrosoft.com -SupportMultipleDomain
Update-MsolFederatedDomain -DomainName azuretraining23.onmicrosoft.com -SupportMultipleDomain