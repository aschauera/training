# Lab SPD.2- Farbschemata mit Themes erstellen
Zeit: 45 min

In diesem Lab arbeiten sie an der farblichen Gestaltung der Site. Sie erstellen ein eigenes Theme und veröffentlichen dieses mit Microsoft PowerShell

## Ziele
- Verständnis für Farbschemata und den Erstellungsprozess

## Aufgabe A: Erstellung eines eigenen Farbschemas 

Mittels des [SharePoint Theme Generators](https://fluentuipr.z22.web.core.windows.net/heads/master/theming-designer/index.html)

Um eigene Farbschemas zu erstellen kann der Theme Generator verwendet werden. Der Generator automatisiert die Erstellung einer kompletten Farbpalette basierend auf 3 Farbvorgaben. Ebenso werden Kontraste geprüft.

* Erstellen sie ein neues Farbschema im Generator mit Farben ihrer Wahl. Stellen sie sicher dass sie keine Warnmeldungen erhalten.
* Exportieren sie das Schema für die PowerShell

Mittels PowerShell (im Terminal oder Visual Studio Code)
* Erstellen sie ein PowerShell Skript, welches sich zu ihrer Site verbindet und das exportierte Schema dort veröffentlicht.

In [Microsoft SharePoint](https://crm149144.sharepoint.com/_layouts/15/sharepoint.aspx)

* Wählen sie das neu erstellte Farbschema in der Site aus.

## HINWEISE

* Benötigte PowerShell Module: SharePoint Online Manamgement Shell
  * Download unter: https://www.microsoft.com/en-us/download/details.aspx?id=35588
* Verbindung herstellen:
```powershell
Connect-SPOService –Url <url der site> -Credential <Benutzername>
```
* Theme publizieren
```powershell
Add-SPOTheme -Identity <Theme Name> -Palette $palette -Overwrite -IsInverted $false
```

