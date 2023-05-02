# Lab ADM.1 - Verwaltung von AAD Benutzern und Applikationen
Zeit: 30 min

## Ziele: 
- Verständnis für die Grundlagen der AAD Verwaltung
- Verständnis für die Integration von Enterprise Applikationen und SSO
--- 
## Aufgabe A

#### Im Azure Portal
- Erstellen sie einen Benutzer als Member - Werte frei
#### Mit PowerShell:
- Verbinden sie sich zu Azure AD
- Rufen sie das, im Portal, erzeugte Benuterobjekt ab
- Legen sie einen neuen Benutzer an
- Erstellen sie eine AD Group
- Rufen sie alle registrierten Enterprise Applikationen ab

## Aufgabe  B 
### Einrichten einer Enterprise Applikation mit Single Sign On via SAML
	
- Erstellen sie einen neue Entrprise Application -> Vorlage Azure AD SAML Toolkit
- Weisen ihren aktuellen Benutzer der Applikation zu um dem Nutzer den Zugriff zu erlauben
- Richten sie SSO ein mit der externen Anwendung ein
- Unter Punkt 1 Basic SAML Configuration: Geben sie Werte an wie in den HINWEISEN unten angeführt
- Kopieren sie unter Punkt 4 im Dialog SAML based Sign On die Werte Login URL, Azure AD Identifier, and Logout URL für die spätere Verwendung
- Laden sie unter Punkt 3 das Zertifikat (Raw) herunter
#### Unter [SAML Toolkit](https://samltoolkit.azurewebsites.net)
- Klicken sie rechts oben auf Register und verwenden sie die E-Mail Adresse des Nutzers welchen sie angelegt haben in Azure AD (Passwort nach Wahl)
- Melden sie sich mit dem neu erstellten nutzer in der Awendung an [SAML Toolkit](https://samltoolkit.azurewebsites.net)
- Unter SAML Configuration (links oben) klicken sie erstellen - geben sie die Werte aus ihrer Enterprise App an für die Authentifizierung
- Laden sie das Zertifikat hoch
- Kopieren sie die Werte SP Initiated Login URL and the Assertion Consumer Service (ACS) URL 
#### Zurück im Azure Portal in der Enterprise Application unter SAML Configuration
- Geben sie die kopierten Werte an aus der Enterprise Application
- Reply URL (Assertion Consumer Service URL)
-  Sign on URL, (SP Initiated Login URL)
- Unter Test Single Sign On waehlen sie Test um die SSO Anmeldung zu testen

## HINWEISE

- AzureAD PowerShell
```
Find-Module AzureAD | Install-Module -Scope CurrentUser
Connect-AzureAd
```
- Erstellung des Password Profile für cmdlet New-AzureADUser
```
$passwordProfile = "" | Select-Object Password,ForceChangePasswordNextLogin
$passwordProfile.ForceChangePasswordNextLogin = $true
$passwordProfile.Password = 'Pa55w.rd1234'
```

SSO

	[SignOn URL](https://samltoolkit.azurewebsites.net/)
	[Reply URL](https://samltoolkit.azurewebsites.net/SAML/Consume)

