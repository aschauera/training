# Lab CLI.2 - Automatisierung mit Azure CLI

Zeit: 30 min

### Ziele: 
- Verständnis für die Möglichkeiten Microsoft Azure Resourcen mittels Azure CLI zu verwalten
	
## Aufgabe

### In Azure PowerShell

- [Optional] Installieren sie das AZURE CLI lokal 
- ODER
- Verwenden sie die Azure Cloud Shell im Azure Portal
- Konfigurieren sie az um als default location immer "westeurope" für alle Kommandos zu verwenden
- Geben sie alle Resourcengruppen aus
- Legen sie eine neue Resourcengruppe "azuretraining+laufendeNr" an
- Exportieren sie das ARM Template für die Ressourcengruppe um es wiederverwendbar abzulagen
- Löschen sie die Ressourcengruppe

### HINWEISE

- Azure CLI Download: >
[Download Azure CLI](https://aka.ms/installazurecliwindows)

- Defaults setzen
```bash
az configure --defaults location=westeurope 
ODER
az config set defaults.location=westeurope
```
- Beispiel - Formatierte Ausgaben
```bash
az group list --query "[].{RG Name:name}" -ojson 
az group list --query "[?name == '<name>']" -otable
``` 

