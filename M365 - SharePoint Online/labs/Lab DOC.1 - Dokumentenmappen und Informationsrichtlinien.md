# Lab DOC.1 - Dokumentenmappen und Informationsrichtlinien für den Learning Manager
Zeit: 45 min

In diesem Lab erweitern sie das Learning Manager Datenmodell um Dokumentenmappen, welche den "Aktenordner" zu einem Training darstellen und alle Inhalte gruppieren und mit gemeinsamen Metadaten versehen.
Zudem sollen Zertifikate nur 1 Jahr aufbewahrt und dann archiviert bzw. gelöscht werden.

## Ziele
- Verständnis für die Vorteile von Dokumentenmappen
- Verständnis für die Erstellung von Informationsrichtlinien

## Aufgabe A: Trainingsordner mit Dokument Sets erstellen

In [Microsoft SharePoint](https://crm149144.sharepoint.com/_layouts/15/sharepoint.aspx)

+ Um alle Dokumente eines Trainingsvorganges zu erfassen, erstellen sie einen neuen Inhaltstyp vom Typ "Dcument Set" mit folgenden Werten:

| Name         | Category | Parent Category | Parent Content Type |
|--------------|:-----:|-----------:|------:|
| Training Doku [Kürzel] |  [Neu erstellen] |        Document Set Content Types | Document Set |

+ Fügen sie folgende Spalten in den neuen Inhaltstyp ein:


| Name         | Typ | Weitere Optionen |
|--------------|:-----:|-----------:|
| Trainer |  Person |        - |
| Rechnungsaddresse      |  Text |          - |
| Training      |  Nachschlagen (Lookup) |Nachlschlagen in Liste "Trainings" in Spalte Titel| 

* Um die Dokumentation strukturiert zu halten, soll der neue Inhaltstyp soll ausschliesslich Informationen vom Typ "Document" und "Zertifikat" aufnehmen können.

* Zudem soll jede neue Trainings Doku Mappe bereits eine Vorlage für die Teilnehmerliste enthalten - wie lässt sich dies realisieren?

* Die Spalte "Training" soll auf alle Inhalte der Mappe synchronisiert werden

* Die Spalte Training und Rechnungsadresse sollen ebenso auf der Startseite der Mappe angezeigt werden.

* Fügen sie eine neue Bibliothek "Trainingsdokumentation" in ihrer Site ein und weisen sie den Inhaltstyp "Training Doku" der Bibliothek zu.

### Diskussion

Wie könnten man die diese Informationen noch besser struktuieren? Die Spalten "Trainer" existiert ja bereits auf dem Inhaltstyp "Training".

## Aufgabe B: Informationsrichtlinien

In [Microsoft SharePoint](https://crm149144.sharepoint.com/_layouts/15/sharepoint.aspx)

Erstellen sie eine Informationsrichtlinie, welche Zertifikate (Inhalte vom Inhaltstyp Zertifikat), 365 Tage nach ihrer Erstellung archiviert (In den Papierkorb verschiebt).

## HINWEISE

### Aufgabe A

Um Document Sets auf einer Site zu verwenden, müssen sie zuerst das entsprechende Feature aktivieren unter [Zahnrad] > Site Contents > Site Settings > Site Collection Features > Document Sets > Activate

![Document Set Feature aktivieren](<img/Lab DOC.1A - Activate Document Set Feature.png>)


### Aufgabe B

* Um eine Richtlinie zu erstllen, müssen wie, wie in Aufgabe B, über die Bibliothek in den Inhaltstyp navigieren um hier den Bereich *Informationen Management Policies* zu finden.

![Content Type - Information Management Policy Settings](<./img/Lab SPI.3C - CT Information Policy Settings.png>)

