# Lab MCS.4.1 - Agent Tools erstellen

## Übersicht
In diesem Lab werden die Möglichkeiten des Generativen Agenten erweitert um Tools um Aktionen auszuführen.

## Voraussetzungen
- Copilot Studio Zugang
- Kenntnisse im Umgang mit Generative Orchestration

## Lab-Umgebung einrichten
1. Navigieren sie zu [https://copilotstudio.microsoft.com](https://copilotstudio.microsoft.com)
2. Stellen sie sicher dass die richtige Umgebung ausgewählt ist (rechts oben unter "Umgebung" oder "Environment")
3. Öffnen sie den Agent welchen sie in [Lab MCS.3.1](Lab%20MCS.3.1%20-%20Generative%20Orchestration.md) erstellt haben

## Übung 1: Der Helpdesk Agent lernt selbstätig zu planen
Zeit: 25 
### Ziele
- Teilnehmer können generative Agenten gestalten, die Tools verwenden um Aktionen auszuführen.

### Gewünschte Ergebnisse
-  Der Helpdesk Agent soll es Benutzern nun erlauben Tickets zu erstellen und Benachrichtigungen zu erhalten. Zudem soll die Kategorisierung automatisiert werden.

### Schritte

**1. Erstellen der Action zur Ticket Erstellung**

- Erstellen sie einen neue *Action*. Der Typ der Action sollte 'Power Automate Flow' sein.
- Der Flow soll eine Kategorie (String), sowie eine Beschreibung (String) entgegennehmen und mittels der Dataverse Aktion 'Add a new row' mit diesen Werten einen neue Zeile in die Ticket Tabelle einfügen.
- Der Flow soll einen Rückgabewert 'Result' (string) enthalten, welcher das Ergebnis der Operation für das LLM zurückliefert.

**2. Email Benachrichtigungen versenden**

- Nun erstellen sie ein weiteres Tool (Typ: Connector, Name "Send an Email"). Welches mit dem Outlook Connector eine Bestätigungsemail versendet.
- Die Mail soll im Anschluss an jeden Aufruf der Aktion "Ticketerstellung" aufgerufen werden und eine Bestätigung versenden.

**3. Ticket Kategorien automatisch ermitteln**

- Aktuell geben Benutzer manuell eine Kategorie ein. Dies soll nun automatisiert werden
- Erstellen sie dazu eine neue Action (Typ: Prompt). Das Prompt soll den Beschreibungstext als Eingabe nehmen und darauf eine Kategorie entscheiden.
- Diese Ausgabe der Kategorie könnte in einer weiteren Agent version als Eingabe für die Ticketerstellung dienen.
- Frage: Wie würden sie dies umsetzen?

### Ergebnisse
- Der Helpdesk Agent wurde nun so gestaltet, dass die Ausführung und der Einsatz der verfügbaren Tools dynamisch geplant wird.

## Weiterführende Links
