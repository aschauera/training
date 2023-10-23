# Lab PSS.2- SharePoint PnP PowerShell
Zeit: 30 min


In diesem Lab lernen sie die Grundzüge der Verwaltung von Microsoft SharePoint Online mittels den OpenSource PnP CmdLets
## Ziele
- Verständnis für SharePoint PnP PowerShell


## Aufgabe A: SPO Grundlagen

Mittels der PowerShell ISE oder Terminal

* Installieren sie die das PnP Modul (siehe Hinweise)

* Verbinden sie sich interaktiv mit ihrer SharePoint Site

* Erstellen sie einen neue Dokumentenbibliothek in ihrer vom Template "Document Library" mit dem Namen "PnPLibrary"

* Erstellen sie einen neuen Inhaltstyp "PnpTraining"
*Weisen sie der Dokumentenbibliothek "PnP Library" den Inhaltstyp "PnP Training" zu

* Setzen sie den Inhaltstyp "PnP Training" als Standardinhaltstyp und entfernen sie den Inhaltstyp "Document"


## HINWEISE

* Benötigte PowerShell Module: SharePoint Online Manamgement Shell
  * Download unter: https://www.microsoft.com/en-us/download/details.aspx?id=35588
* Verbindung herstellen
```powershell
Connect-PnPOnline –Url <url der site>
```
* Neue Liste/Library erstellen
```powershell
 New-PnpList
```

* Anlegen eines Inhaltstyps
```powershell
 Add-PnPContentType 
```
* Inhaltstypen auf Listen verwalten
```powershell
Add-PnPContentTypeToList
Set-PnPDefaultContentTypeToList
Remove-PnPContentTypeFromList
```