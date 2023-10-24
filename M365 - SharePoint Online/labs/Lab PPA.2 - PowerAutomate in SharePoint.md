# Lab PPA.2 - Power Automate Formulare in SharePoint
Zeit: 45 min


In diesem Lab bauen sie den Learning Manager aus, um auch auf Mobilgeräten eine eigene Oberfläche anzubieten mit eigenständigen Funktionen.
Mittels Power Apps passen sie zudem die SharePoint Listenformulare an und gestalten eine interaktive Oberfläche für die Eingabe.

## Ziele
- Verständnis für die Power Platform in M365
- Verständnis für die Erstellung von Apps mit Power Apps

## Aufgabe: 

Um Benutzern auf Mobilgeräten eine schnelle Interaktion zu ermöglichen, erstellen sie eine eigene Power App.

In [Microsoft SharePoint](https://crm149144.sharepoint.com/_layouts/15/sharepoint.aspx)


* In "ihrer" Liste Trainings. Erstellen sie eine neue *Standalone* PowerApp in dem sie im Listenmenü auf *Integrate > Power Apps > Create* klicken.

* Die App soll folgende Funktionen umsetzen

* Eine filterbare Liste der Trainings anzeigen. (ist in der Vorlage enthalten, sehen sie sich die entsprechenden Funktionen an. Diese finden sie indem sie die "Gallery" selektieren und in der Formelleiste die Formel für die Eigenschaft "Items" anzeigen - siehe Abbildung 1)

| ![SharePoint Gallery](<img/Lab PSS.1B - Power App SharePoint Gallery Items.png>)
|:--:|
| *Abbildung 1 - Filter der Gallerie der SharePoint Einträge* |

* Die Gallerie soll pro Eintrag folgendes Icon anzeigen, basierend auf dem Status:
  * Geplant: Icon.Clock
  * Storniert: Icon.Cancel (badge)
  * Abgeschlossen: Icon.Check (badge)

* Die Gallerie soll Schnellaktionen erhalten. Fügen sie dazu einen Button ein, welcher beim Klick, den Status der gewählten Zeile auf "Abgeschlossen" setzt.

* Die Gallerie soll es zudem erlauben ein Training auszuwählen und auf einem Detailformular Feedback zu erfassen - was ist dafür nötig?

## Hinweise
* Power Apps - Beispiel für eine Formel zu Feldaktualisierung
```powerfx
Patch(Trainings,LookUp(Trainings,ID=ThisItem.ID),{Status:{Value:"Abgeschlossen"}})
```

* Power Apps. Beispiel zur Navigation auf einen Screen mit Übergabe von 2 Werten. Die beiden Werte stehen am Zielbildschirm unter den Namen *Name1* und *Name2* zur Verfügung.

```powerfx
Navigate(
    <ScreenName>,
    <ScreenTransition>,
    {
        Name1: <Wert>,
        Name2: <Wert>
    }
)
```