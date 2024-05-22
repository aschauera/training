MARKDOWN

# Lab DV.1 - Datenmodellierung mit Microsoft Dataverse
- Datenmodellierung für die Power Platform
- Datenkonsistenz
- Datenintegration aus externen Systemen
## Zeit: 45 min

## Ziele: 
- Die Teilnehmer kennen die Möglichkeiten von Dataverse
- Die Teilnehmer können Dataverse und SharePoint abgrenzen und kennen die jeweiligen Stärken

---
## Aufgabe A - Datenmodellierung

### [Im Power Maker Portal](https://make.powerapps.com)
```
Stellen sie sicher, dass sie in der richtigen Umgebung arbeiten
Erstellen sie alle Inhalte in ihrer Solutions aus Lab SOL.1
```
- Erstellen sie folgende Tabellen

| Tabellenname  | Hinweis |
| ------------- | --------|
| Kurse | Neu |
| Contact | Bestehende "Contacts" Tabelle |
| Zertifikat | Neu

- Das Datenmodell soll dazu dienen, Kurse und deren Teilnehmer sowie die Teilname zu verfolgen.

- Erstellen sie folgende Spalten

| Spalte  | Tabelle | Datentyp
| -----------|--------|----------|
| Name | Kurse | Text |
| Thema | Kurse | Text |
| Kursnummer | Kurse| Autonumber |
| Start | Kurse | Date |
| Ende | Kurse | Date |
| Dauer | Kurse |Berechnete Spalte (Typ: Formula) welche die Dauer in Tagen zwischen Start und Ende speichert|
| Ausstellungdatum | Zertifikat | Date |
| Aktiv |Zertifikat | Ja/Nein |
| Link | Zertifikat| Text (URL) |


- Erstellen sie folgende Relationen

| Quelle  | Ziel | Type
| -----------|--------|----------|
| Kurse | Contact | Many to Many | 
| Contact | Zertifikat | One to Many |

- Nun sollten sie ein grundlegendes Datenmodell besitzen um Kursdaten zu erfassen.

## Aufgabe B - Datenkonsistenz
- Um die Konsistenz der Daten sicherzustellen und/oder Geschäftslogik auszudrücken, erstellen sie folgenden "Business Rules"

| Regel  | Tabelle | Beschreibung 
| -----------|--------|----------|
| Start vor Ende | Kurse | Fehlermeldung falls Start NICHT vor Ende liegt | 
| Empfohlenes Feld | Kurse | Wenn die Titel Power Platform enthält, wird empfohlen auch das Feld "Thema" auszufüllen |


## Aufgabe C - Datenintegration

- Importieren sie nun Daten in ihre Kurstabelle aus einem bestehenden System
- Dazu klicken sie auf "Import" und geben den Link zum Beispiel Excel aus dem Repository aus [Dataverse Basics - Course Data.xlsx](https://github.com/aschauera/training/raw/master/PP%20-%20Power%20Plaform%20Basics/Dataverse/Dataverse%20Basics%20-%20Course%20Data.xlsx)

- [Optional] Importieren sie Datena aus einer Access Datenbank. Die Beispieldatenbank finden sie [hier](https://github.com/aschauera/training/raw/master/PP%20-%20Power%20Plaform%20Basics/Dataverse/Dataverse%20Basics%20-%20Course%20Data.accdb) - dazu müssen sie auf ihrem Rechner den Access OLEDB Provider installieren von [hier](https://github.com/aschauera/training/raw/master/PP%20-%20Power%20Plaform%20Basics/Dataverse/AccessDatabaseEngine_X64.exe)

### Spezialfall SharePoint: Virtuelle Tabellen

- Microsoft SharePoint (und ein paar weitere ausgewählte Quellen) erlauben die "direkte" Anbindung ohne Daten zu importieren.
- Klicken sie dazu in ihrer Solution auf Table > New Table from External data > und wählen sie "SharePoint" aus
- Wählen sie eine bestehende SharePoint Site und Liste
- Dataverse erstellt nun eine voll "virtuelle" Tabelle. Das bedeutet, sie können die Tabelle wie eine Dataverse Tabelle verwenden - im Hintergrund jedoch wird SharePoint abgefragt.

## HINWEISE

- Formel für "Dauer" Feld
```
DateDiff(Start,Ende,TimeUnit.Days)
```
