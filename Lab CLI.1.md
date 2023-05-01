Lab CLI.1 - Automatisierung mit Azure PowerShell


### Ziele: 
- Verständnis für Verwaltung von Azure mit Microsoft PowerShell
- Installation der PowerShell Module
- Erstellung von Ressourcen und Entfernen von Ressourcen
- Kennenlernen der docs.microsoft.com/learn "Sandbox"
---
## ITPRO
Zeit: 30 min
### Aufgabe

- Erstellen sie eine komplette Virtuelle Maschine mittels Powershell

- Lab Anleitung unter: [Create an Azure Resource using scripts in Azure PowerShell - Learn](https://learn.microsoft.com/en-us/training/modules/automate-azure-tasks-with-powershell/5-create-resource-interactively?pivots=windows) - NUR SEITE 1 (!)



## DEVELOPER

Zeit: 30 min

### Ziele: 
- Verständnis für die Möglichkeiten Microsoft Azure Resourcen mittels PowerShell zu verwalten
	
## Aufgabe

### In Azure PowerShell

- Installieren sie das Az Modul
- Verbinden sie sich zu ihrem Azure Tenant und wählen stellen sie sicher dass sie in der korrekten Subscription arbeiten (Get-AzSubscription | Set-AzKontext)
- Geben sie die, in ihrer Subscription verfügbaren, Locations aus
- Erstellen sie eine neue Ressourcegruppe  in der Region "westeurope"
- Erstellen sie einen neuen Container in Azure Container Instances aus dem Image "nginx" um einen voll lauffähigen Web Server zu erzeugen
HINWEIS: nginx erfordert Linux als OS Typ (Parameter -OSType)
- Prüfen sie den Status des Containers, indem sie die Logs abrufen
- Löschen sie den Container sobald er fertig erstellt wurde
- Trennen sie die Verbindung zum Azure Tenant

### HINWEISE

#### Azure PowerShell Module
``` powershell  
Install-Module --name AZ
```
 
#### Container Instanz erstellen
``` powershell
New-AzContainerInstanceObject -image nginx
New-AzContainerGroup -container
```
#### Container Log abrufen
``` powershell
Get-AzContainerInstanceLog
```
