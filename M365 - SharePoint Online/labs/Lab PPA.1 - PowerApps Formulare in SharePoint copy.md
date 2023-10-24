# Lab PPA.1 - PowerApps Formulare in SharePoint
Zeit: 45 min


In diesem Lab bauen sie den Learning Manager aus, um auch auf Mobilgeräten eine eigene Oberfläche anzubieten mit eigenständigen Funktionen.
Mittels Power Apps passen sie zudem die SharePoint Listenformulare an und gestalten eine interaktive Oberfläche für die Eingabe.

## Ziele
- Verständnis für die Power Platform in M365
- Verständnis für die Erstellung von Apps mit Power Apps

## Aufgabe A: SharePoint Formulare gestalten mit Power Apps

In [Microsoft SharePoint](https://crm149144.sharepoint.com/_layouts/15/sharepoint.aspx)

* Auf ihrer Liste "Training", passen sie das Listen Formular an um eine interaktives Erlebnis zu schaffen. Folgende Funktionen sollen umgesetzt werden:

| Funktion        | Feld | Hinweise |
|--------------|:-----:|-----------:|
| Farbliche Kennzeichnung  |  Dauer |Hintergrundfarbe Rot wenn > 3 |
| Sichtbarkeit  | Genehmigung erforderlich | Sichtbar wenn Dauer > 3 |

### Diskussion

Frage/Diskussion: Wie könnten sie die Bedingung ( > 3 ) dynamisch gestalten, sodass bei einer Änderung nicht an jeder Stelle abgeändert werden muss?


## Aufgabe B: Eigenständige SharePoint Apps

Um Benutzern auf Mobilgeräten eine schnelle Interaktion zu ermöglichen, erstellen sie eine eigene Power App.

In [Microsoft SharePoint](https://crm149144.sharepoint.com/_layouts/15/sharepoint.aspx)


* In "ihrer" Liste Trainings. Erstellen sie eine neue *Standalone* PowerApp in dem sie im Listenmenü auf *Integrate > Power Apps > Create* klicken.

* Die App soll folgende Funktionen umsetzen

* Eine filterbare Liste der Trainings anzeigen. (ist in der Vorlage enthalten, sehen sie sich die entsprechenden Funktionen an. Diese finden sie indem sie die "Gallery" selektieren und in der Formelleiste die Formel für die Eigenschaft "Items" anzeigen - siehe Abbildung 1)

| ![SharePoint Gallery](<img/Lab PSS.1B - Power App SharePoint Gallery Items.png>)
|:--:|
| *Abbildung 1 - Filter der Gallerie der SharePoint Einträge* |

* Die Gallerie soll Schnellaktionen erhalten. Fügen sie dazu einen Button ein, welcher beim Klick, den Status der gewählten Zeile auf "Abgeschlossen" setzt.

* Die Gallerie soll es zudem erlauben ein Training auszuwählen und auf einem Detailformular Feedback zu erfassen - was ist dafür nötig?

