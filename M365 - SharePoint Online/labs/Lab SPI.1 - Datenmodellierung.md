# Lab SPI.1 - Grundlegendes Datenmodell für den Learning Manager
Zeit: 30 min

In diesem Lab erstellen sie die Grundlegende Datenstruktur für die Lösung zur Verwaltung von Trainings, welche in den folgenden Modulen weiter ausgebaut wird.

## Ziele
- Verständnis für den Aufbau eines SharePoint basierten Datenmodells

## Aufgabe

Verwenden sie einen der Benutzer aus der [Liste](Users.md).
Das Passwort haben sie als seperate Nachricht über den virtuellen Klassenraum erhalten.

In [Microsoft SharePoint](https://crm149144.sharepoint.com/_layouts/15/sharepoint.aspx)
 
* Erstellen sie eine neue SharePoint SITE 
  * Typ: Team Site
  * Name: "Learning Manager [Kürzel]"
  * Private
  * Sprache: Deutsch oder nach Wahl
  * Warten sie bis die Site erstellt ist (sie müssen keine weiteren Benutzer berechtigen)

* Erstellen sie eine neue SharePoint Liste
  * Vorlage: Leere Liste (Blank)
  * Name: Trainings
  * In Navigation anzeigen: Ja

* Erstellen sie die Listenstruktur für die Trainings mit folgenden Spalten

| Name         | Typ | Weitere Optionen |
|--------------|:-----:|-----------:|
| Name |  Text |        - |
| Trainer      |  Person |          Nur Personen |
| Start      |  Datum |          - |
| Dauer      |  Zahl |          Ohne Dezimalstellen |
| Kategorie      |  Aushwahl |          Optionen: Development, IT Admin, Business  |
| Verantwortlich      |  Person |          Nur Personen |
| Status      |  Auswahl |          Optionen: Angefragt, Geplant, In Durchführung, Abgeschlossen |
| Kosten      |  Währung |          - |
  



#### Diskussion
*Beachten sie die bereits vorhanden Bibliothek an Listenvorlagen bei der Listenerstellung!* 

  * Wofür könnten wir diesen Vorlagenmechanismus verwenden?*
  * Woher kommen diese Vorlagen?


## HINWEISE

Um die Inhalte eindeutig pro Teilnehmer zu erstellen verwenden sie als Kürzel jeweils den ersten Buchstaben des Vor- und Nachnamens.

Als Alan Steiner verwenden sie "AS" also zB "Learning Manager AS"
