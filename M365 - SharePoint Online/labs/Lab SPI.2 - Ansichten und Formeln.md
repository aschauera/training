# Lab SPI.2 - Ansichten, Formeln und Validierungen für den Learning Manager
Zeit: 20 min

In diesem Lab erstellen sie die Ansichten, welche die Learning Manager Daten auf verschiedene Arten darstellen. Ebenso erstellen sie berechnete Spalten um dynamisch Werte in der Liste Trainings zu errechnen. Zudem werden Validierungen auf den Dateneingaben erstellt um die erstellten Trainingsdatensätze konsistent zu halten.

## Ziele
- Verständnis für Ansichten zur Datendarstellung
- Verständnis für berechnete Spalten zur generierung dynamischer Werte

## Aufgabe A: Ansichten

In [Microsoft SharePoint](https://crm149144.sharepoint.com/_layouts/15/sharepoint.aspx)
 
* Erstellen sie in ihrer Liste Trainings folgende Ansichten, um die Daten später darzustellen.

| Name         | Typ | Weitere Optionen |
|--------------|:-----:|-----------:|
| Trainer |  Gallerie |        - |
| Monatsansicht      |  Kalender |          Ende leider nicht wählbar (!) |
| Genehmigungspflichtig      |  Liste |          Nur Trainings die eine Genehmigung erfordern |
| Nach Kategorie      |  Liste |          Zeigt die Summe der Kosten pro Kategorie zeigen |

## Aufgabe B: Berechnete Spalten

In [Microsoft SharePoint](https://crm149144.sharepoint.com/_layouts/15/sharepoint.aspx)
 
* Erstellen sie in ihrer Liste Trainings folgende, berechnete Spalten.

| Name         | Typ | Weitere Optionen |
|--------------|:-----:|-----------:|
| Ende |  Datum |        Berechnet anhand von Start + Dauer |
| Genehmigung erforderlich      | Ja/Nein |          Ja falls Kosten >1000 €  |
  
## Aufgabe C: Feldvalidierungen

* Erstellen sie in ihrer Liste Trainings folgende Validierungen.

| Name         | Typ | Weitere Optionen |
|--------------|:-----:|-----------:|
| Start |  - |        Start muss in der Zukunft liegen |
| Genehmigung erforderlich      | Ja/Nein |          Ja falls Kosten >1000 €  |

## HINWEISE

Wenn die Site auf Deutsch erstellt wurde, ist die Formel für das aktuelle Datum "HEUTE()" anstelle von "TODAY()"
