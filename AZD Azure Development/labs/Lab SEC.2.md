MARKDOWN

## Zeit: 30 min

## Ziele: 
- Verständnis für die Grundlagen der granularen Berechtigungsvergabe mit Role based access control (RBAC)
	
---
## Aufgabe

- Mit PowerShell: Rufen sie die Rollendefinition für die Rolle "Reader" ab 
- Optional: Verwenden sie die Azure CLI
- Rufen sie die bestehenden Rollenzuordnungen der Resourcengruppe "AzureTraining" ab
	
Die Azure AD Gruppe soll nun eine Rolle und somit Rechte auf einer Azure Resource erlangen

- HINWEIS: Verwenden sie den Benutzer aus dem Lab - "ADM.1 - Verwaltung von Azure AD"
	
- Erstellen sie eine neue Rollenzuordnung zwischen ihrer erstellten Gruppe und der Ressourcengruppe "AzureTraining", sodass der Benutzer lesend auf die Resourcen der Gruppe zugreifen kann
- Löschen sie die Rollenzuordnung

### Arbeiten mit custom Role Definitions

- Rufen sie das JSON für die eingebaute Rolle "Virtual Machine Contributor" (Unter > Subscription > IAM  > Roles > Rolle > JSON)
- Ändern sie die Definition lokal so ab, dass diese Rolle Virtuelle Maschinen nur STARTEN und NEUSTARTEN (nicht aber STOPPEN) kann
- Erzeugen sie die neue Rollendefinition mittels Powershell

### HINWEISE 


-Neue Rollendefinition anlegen
```
new-azRoleDefinition ..
```
- Rechte für VM (Microsoft.Compute/virtualmachines)
```
"Microsoft.Compute/virtualMachines/start/action"
"Microsoft.Compute/virtualMachines/restart/action"
```