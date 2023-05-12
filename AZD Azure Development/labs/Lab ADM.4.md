## Zeit: 30 min

## Ziele: 
- Verständnis für die Verwendung von Application Registrations und Service Principals zur sicheren 
	Authentifizierung eigener Apps
	

## Aufgabe

- Erstellen sie einen neue "App Registration" in Azure AD
- Erstellen sie ein neues Client Secret unter "Certificates & Secrets" (Expiration: 3 Monate)
- Kopieren sie die TenantID, ApplicationID und das Client Secret
- Mit Visual Studio Code
- Erstellen sie eine Consolenanwendung welche sich über die App Registrierung authentifiziert
- [OPTIONAL: Listen sie alle Storage Accounts auf mit Azure Resource Graph]


## HINWEISE
- Benötigte DotNet Packages
```
dotnet add package Microsoft.Azure.Services.AppAuthentication; //Alt (ADAL)
dotnet add package Microsoft.Identity.Client; //Neu (MSAL)
dotnet add package Microsoft.Azure.Management.ResourceGraph;
dotnet add package Microsoft.IdentityModel.Clients.ActiveDirectory;
```

- Authority
https://login.microsoftonline.com/(tenantID)
- Parameter Ressource für Token
 https://graph.microsoft.com/v1.0/
	
- Service Principal benötigt "READ" Rechte auf User Graph (!)