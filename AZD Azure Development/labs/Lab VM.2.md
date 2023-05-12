# Lab VM.2 VM Availabilty sets
Zeit: 20 min

## Ziele: 
- Verständnis für die Bedeutung von Availability Sets zur Erreichung Hochverfügbarer VMs
---
## Aufgabe

### In Azure Portal:
- Richten sie ein neues Availability Set ein
- Erstellen sie 2 neue VMs In dieser Zone
	
### Mit PowerShell
- Automatisieren sie die anlage eines neuen Availability Sets
- Erstellen sie 2 neue Windows Server VMs in diesem Availability Set
---
## HINWEISE
- Erstellen eines Availability sets
```
New-AzAvailabilitySet -ResourceGroupName <rgName> -Name <name>
-Location "west europe"
```
- VM in AS einfügen
```
new-azvm ... -AvailabilitySetName <ASName> ...
```

