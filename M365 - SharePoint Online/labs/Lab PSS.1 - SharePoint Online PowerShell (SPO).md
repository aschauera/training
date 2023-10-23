# Lab PSS.1- SharePoint Online PowerShell (SPO)
Zeit: 30 min

In diesem Lab lernen sie die Grundzüge der Verwaltung von Microsoft SharePoint Online mittels den offiziellen SPO CmdLets
## Ziele
- Verständnis für SharePoint PowerShell

## Aufgabe A: SPO Grundlagen

Mittels der PowerShell ISE oder Terminal

* Stellen sie sicher, dass sie die SharePoint Online Management Shell auf ihrem Rechner befindet (SPO Cmdlets)
* Stellen sie eine Verbindung zu ihrer Site her. Versuchen sie interaktive und nicht-interaktive Anmeldeoptionen

* Geben sie die verfügbaren Member Eigenschaften und Methoden des SPSite Objektes aus, die sie für das Scripting verwenden können

* Geben sie alle Sites aus, die im Status "Aktiv" sind.

* Erstellen sie einen Report der Berechtigung aller Site auf die sie Zugriff haben. Der Report soll in einer CSV Datei Names permissions.csv abgelegt werden.

* Erstellen sie eine Auswertung der Sites nach Speichernutzung. Die Auswertung soll in einer CSV Datei "topsites.csv" erstellt werden und die Top 10 Sites nach Speichernutzung enthalten

## HINWEISE

* Benötigte PowerShell Module: SharePoint Online Manamgement Shell
  * Download unter: https://www.microsoft.com/en-us/download/details.aspx?id=35588
* Verbindung herstellen
```powershell
Connect-SPOService –Url <url der site> -Credential <Benutzername>
```
* Objekt Selektionen mittels PowerShell 
```powershell
 Where { $_.<Eigenschaft> -eq "xx" } 
```

* Gruppen einer Site abrufen (Berechtigungen)
```powershell
 Get-SPOSiteGroup
```

* Format Konvertierungen nach CSV und Umleitung in Datei
```powershell
 ConverTo-CSV | Out-File <filename>
```