# Lab MCS.1.2: Microsoft Copilot Studio Topics: Erstellung | Verwaltung | Strukturierung

## Übersicht
Dieses Lab liefert eine Einführung in die Strukturierung von Dialogen mittels Topics.

## Voraussetzungen
- Copilot Studio Zugang

## Lab-Umgebung einrichten
1. Navigieren sie zu [https://copilotstudio.microsoft.com](https://copilotstudio.microsoft.com)
2. Stellen sie sicher dass die richtige Umgebung ausgewählt ist (rechts oben unter "Umgebung" oder "Environment")
3. Öffnen sie den *Helpdesk Agent*, welchen sie in Lab MCS.1.1 erstellt haben. Sie finden die Anleitung dazu in der Datei [Lab MCS.1.1](Lab%20MCS.1.1%20-%20Create%20an%20agent.md)

## Übung 1: Erstellung der Helpdesk Dialoge
Zeit: 30 min
### Ziele
- Teilnehmer kennen die Grundlagen der Classic Orchestration und können Dialoge mittels Themen strukturieren, sowie den Dialogfluss verwalten. Zudem sind die Teilnehmer in der Lage Benutzerinterkationen natürlichsprachig zu gestalten.

### Gewünschte Ergebnisse
-  Der Helpdesk Agent soll Benutzern mehrere geführte Dialoge bieten rund um Informationen und Austausch von Hardware. In dieser Übung werden die Dialoge mit statischen Werten erstellt. In Lab XXX werden diese mit Informationen aus einem Backend System (Microsoft Dataverse) dynamisch gestaltet.

### Schritte
**1. Hardware Refresh Dialog**
    - Erstellen sie ein neues Topic, welches Nutzern erlaubt abzufragen, wann ihre aktuelle Hardware (Laptop) erneuert werden kann.
    
    - Um die Informationen bereit zu stellen, muss durch den Agent die Art der Hardware (Laptop, Handy, Monitor) und danach die Seriennummer (10-stellig), abgefragt werden. Das Format der Seriennummer soll überprüft werden und Nutzer sollen direkt durch den Agent auf eine fehlerhafte Eingabe hingewiesen werden.
    
    - Der Agent soll im Anschluss mit den gefundenen Informationen antworte
        - In diesem Beispiel soll eine *statische* Antwort erfolgen welche die Ausgewählte Hardwarekategorie nochmals nennt und ein beliebiges Refreshdatum
        - Beispiel: Ihr  <**Gewählte Kategorie**> mit der Seriennummer <**Eingegebene Seriennr.**> ist am 01.05.2026 zum Hardware Refresh berechtigt.

    
**2. Dialog zur Ticket Erstellung**
    - Erstellen sie ein neues Topic, welches Nutzer durch die Erstellung eines Tickets bei Hardwareproblemen führt.
    
    - Um die Informationen bereit zu stellen, muss durch den Agent die Art der Hardware (Laptop, Handy, Monitor) und danach die Seriennummer (10-stellig), abgefragt werden. Das Format der Seriennummer soll überprüft werden und Nutzer sollen direkt durch den Agent auf eine fehlerhafte Eingabe hingewiesen werden.

    - **Frage: Wie könnte man vermeiden, dass dieser Dialogteil doppelt erstellt werden muss (Topics: *Hardware Refresh* UND *Hardware Ticket*) und somit mehrfach gewartet?**

    - Strukturieren sie die Topics so (um), dass die Abfrage von Seriennummer und Hardwarekategorie nur 1x im Agent zentral erstellt werden muss.

    - Gestalten sie den Rest des Topics, sodass der Nutzer sein/ihr Problem schildern kann und der Agent dem Nutzer die Erstellung eines Tickets bestätigt.

    - In dieser Bestätigungsnachricht fügen sie eine Formel ein, welche den Nutzer informiert dass voraussichtlich 2 Tage in der Zukunft eine Bearbeitung stattfindet (Aktuelles Datum + 2 Tage) 

### Ergebnisse
- Der Helpdesk Agent wurde um mehrere Topics erweitert, welche modular strukturiert sind. 
- Mittels *Slot Filling* und *Entities* wurden die Nutzereingaben natürlich und gleichzeitig valide gestaltet.
- Dynamische Werte wurden als *Variablen* übergeben und mittels *PowerFX* Formeln errechnet.

## Weiterführende Links
- [Copilot Studio Slot Filling and Entities](https://learn.microsoft.com/en-us/microsoft-copilot-studio/advanced-entities-slot-filling)
- [Copilot Studio Topic Authoring Best Practices](https://learn.microsoft.com/en-us/microsoft-copilot-studio/guidance/topic-authoring-best-practices)
