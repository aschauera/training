# Lab SPI.3 - Wiederverwendbare Inhaltstypen und Dokumentevorlagen für den Learning Manager
Zeit: 30 min

In diesem Lab erweitern sie das Learning Manager Datenmodell um Inhaltstypen um Inhalte wiederverwendbar zu gestalten und diese für die Suche optimal aufzubereiten.
Ebenso erstellen sie Dokumentenvorlagen um die Generierung von Zertifikation aus dem Learning Manager zu realisieren.

## Ziele
- Verständnis für die Vorteile von Inhaltstypen
- Verständnis für die Dokumentengenerierung in Microsoft SharePoint

## Aufgabe A: Ansichten

In [Microsoft SharePoint](https://crm149144.sharepoint.com/_layouts/15/sharepoint.aspx)
 
* Erstellen sie in ihrer (!) Site einen neuen Site Content Type (Inhaltstyp) um diesen als Datenvorlage verwenden zu können, mit folgenden Optionen

| Name         | Category | Parent Category | Parent Content Type |
|--------------|:-----:|-----------:|------:|
| Training [Kürzel] |  [Neu erstellen] |        List Content Types | Item |

* Fügen sie die Spalten aus dem [Lab SPI.1](<Lab SPI.1 - Datenmodellierung.md>) dem Inhaltstyp hinzu
* Verändern sie die Liste "Trainings [Kürzel] sodass, diese Liste nun auf Basis von Inhaltstypen arbeitet und fügen sie den eben erstellten Inhaltstyp in die Liste ein.

* Erstellen sie eine Ansicht, welche nur die Einträge der Liste vom Inhaltstyp "Training" enthält.

### Fragen / Diskussion
* Was passiert mit den bereits erstellten Einträgen?
* Wie könnte man Inhaltstypen weiter strukturieren um sie noch effizienter für die Suche und Darstellung von Inhalten zu verwenden?

## Aufgabe B: Dokumentenvorlagen

In [Microsoft SharePoint](https://crm149144.sharepoint.com/_layouts/15/sharepoint.aspx)
 
* Erstellen sie in ihrer Site folgende Dokumentenbibliothek


| Name         | Typ | Weitere Optionen |
|--------------|:-----:|-----------:|
| Zertifikate |  Document Library |-|

* Um Zertifikate zu erstellen und zu drucken. Erstellen sie in ihrer Site einen neuen Inhaltstyp mit folgenden Optionen:

| Name         | Category | Parent Category | Parent Content Type |
|--------------|:-----:|-----------:|------:|
| Zertifikat [Kürzel] |  [Neu erstellen] |        Document Content Types | Document |

* Passen sie die Dokumentenvorlage für den Inhaltstyp in Word an.

## HINWEISE

### Aufgabe A
* Inhaltstypen auf Site Ebene werden verwaltet unter *[Zahnrad] > Site Contents > Site Settings > Site Content Types*

* Um eine Liste auf Inhaltstypen umzustellen wird einfach eine Spalte vom Type *Content Type* eingefügt

### Aufgabe B
* Um die Dokumentenvorlage für das Zertifikat zu editieren, müssen sie erst den Inhaltstyp in eine Bibliothek einfügen und von der Bibliothek aus den Inhaltstyp editieren unter [Bibliothek] > [Zahnrad] > Library Settings > Content Types > [Name] > Advanced Settings > Document Template
* Dies stellt sicher dass pro Spalte in der Bibliothek ein "Document Quick Part" in WORD existiert
