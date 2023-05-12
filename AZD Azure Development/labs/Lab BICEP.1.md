Lab BICEP.1 BICEP deployments

Zeit: 20 min

## Ziele: 
- Die Teilnehmer kennen die Vorteile von BICEP für komplexe Deployments
---
## Aufgabe

- Mittels BICEP und Visual Studio Code
- Erstellen sie eine neuer Ressourcengruppe mit dem Namen labbicep1
- Erstellen sie ein neues BICEP Template, welches einen Storage Account erzeugt  in der Resourcengruppe
- Als Location soll die Location der Resourcengruppe übernommen werden in einen Parameter
- Ein zweiter Parameter soll den Namen des StorageAccounts wie folgt definierbar machen:
	"storage"<Eindeutige ID>
- Der Storage Name muss zwischen 3 und 24 Zeichen lang sein - dies soll im Template validiert werden
- Prüfen sie welche Änderungen das Template bei einem Deployment auf der Azure Subscription durchführen würde
- Rollen sie das lokale BICEP Template mit der Visual Studio Erweiterung aus
---		

## HINWEISE

- Automatisiertes Deployment der Templates mittels CLI folgt in Lab BICEP.2