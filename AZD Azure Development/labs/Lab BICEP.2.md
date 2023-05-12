# Lab BICEP.2 BICEP deployments mit CLI

Zeit: 20 min

## Ziele: 
- Die Teilnehmer kennen die Vorteile von BICEP für komplexe Deployments
---
## Aufgabe

### Falls noch nicht in Lab BICEP.1 erstellt:
- Mittels BICEP und Visual Studio Code
- Erstellen sie eine neuer Ressourcengruppe mit dem Namen labbicep1
- Erstellen sie ein neues BICEP Template labbicep1.bicep, welches einen Storage Account erzeugt  in der Resourcengruppe
- Als Location soll die Location der Resourcengruppe übernommen werden in einen Parameter
- Ein zweiter Parameter soll den Namen des StorageAccounts wie folgt definierbar machen:
	"storage"<Eindeutige ID>
- Der Storage Name muss zwischen 3 und 24 Zeichen lang sein - dies soll im Template validiert werden
- Prüfen sie welche Änderungen das Template bei einem Deployment auf der Azure Subscription durchführen würde
### Falls BICEP Template bereits vorhanden
- Rollen sie das lokale BICEP Template (labbicep1.bicep) mit mittels Azure CLI aus

---		

## HINWEISE

- Resourcengruppe erzeugen mit AZ
```bash
az group create --name <group name> --location "westeurope"
```
- AZ deployment group
```bash
az deployment group create 
```

- What If Parameter
```bash
az deployment group what-if 
```