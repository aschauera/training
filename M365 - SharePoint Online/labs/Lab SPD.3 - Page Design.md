# Lab SPD.3 - Erstellung der Dashboard Startseite
Zeit: 30 min

In diesem Lab arbeiten sie an der Learning Manager Startseite. Um den Benutzern einen sinnvollen Einstieg in den Learning Manager zu ermöglichen. Um die Anforderungen an die Dashboard Seite zu erfüllen sind zusätzliche Schritte nötig, basierend auf den Erfahrungen aus den vorangegangenen Modulen.

*Die Aufgaben dieses Labs sind bewusst frei gestaltet, um ihnen zu ermöglichen, die Fähigkeiten aus den Vor-Modulen zu kombinieren und anzuwenden*

## Ziele
- Verständnis für die Erstellung von WebPart Seiten in SharePoint

## Aufgabe A: Erstellung der Learning Manager Einstiegsseite

In [Microsoft SharePoint](https://crm149144.sharepoint.com/_layouts/15/sharepoint.aspx)

Um einen gezielten Einstieg in die Learning Manager Inhalte zu gestalten, erstellen sie eine Startseite in ihrer Training Site, welche folgende Anforderungen erfüllt:

* Das Seiten Design soll eine Willkommensnachricht anzeigen, neben einem sinnvollen Seitenbild. Die Willkommensnachricht soll formatiert erscheinen mit einer Überschrift und formatiertem Willkommenstext. Zudem soll in einer Tabelle die Art der Inhalte aufgelistet werden und je der Ansprechpartner. Abbildung 1 zeigt ein mögliches Ergebnis

  * Frage: Welche Möglichkeiten gibt es dies zu realisieren?

| ![Learning Manager Dashboard](<img/Lab SPD.3- Learning Manager Dashboard Header.png>)
|:--:|
| *Abbildung 1 - Beispiel für den Dashboard Header* |

* Direkt unter der Willkommensnachricht sollen alle Inhalte des Inhaltstyp "Training Akte" (Document Set) angezeigt werden.

* In einer weiteren Sektion darunter sollen alle Zertifikate angezeigt werden, welche dem aktuellen Benutzer zugeordnet sind. Wähle sie hier ebenso ein mindestens 2-Spaltiges Layout, da hier in einem Folgelab noch ein Formular eingefügt werden wird.

  * Welche Ergänzungen im Datenmodell sind dafür nötig?

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

