# Lab MCS.3.2: Generative Orchestration - Wissensquellen

## Übersicht
In diesem Lab werden die Vorteile der Wissenqeullen der *Generative Orchestration* erkundet.

## Voraussetzungen
- Copilot Studio Zugang
- Kenntnisse im Umgang Classic Orchestration und Generative Orcehstration

## Lab-Umgebung einrichten
1. Navigieren sie zu [https://copilotstudio.microsoft.com](https://copilotstudio.microsoft.com)
2. Stellen sie sicher dass die richtige Umgebung ausgewählt ist (rechts oben unter "Umgebung" oder "Environment")
3. Öffnen sie den Agent welchen sie in [Lab MCS.3.1](Lab%20MCS.3.1%20-%20Generative%20Orchestration.md) erstellt haben

## Übung 1: Dem Helpdesk Agent Wissen hinzufügen
Zeit: 15 min
### Ziele
- Der neue generative Helpdesk Agent soll nun sein Wissen nun aus mehreren Quellen (Dokumenten) und Systemen (Schnittstellen) beziehen.

### Gewünschte Ergebnisse
-  Der Helpdesk Agent kann mit Wissen aus statischen Dokumenten und aus Datenbanken antworten.

### Schritte

**1. Agent Knowledge**

- Legen sie das grundlegende Verhalten des Helpdesk Agents fest. Der Agent soll freundlich aber professionell antworten und sicherstellen, dass Antworten:

    - Immer einen Hinweis auf weitere Supportkanäle enthalten
    - Quellen immer angeführt werden.

- Testen sie das Verhalten des Agenten. Durch Eingabe einer Frage, welche nicht durch ein Thema abedeckt ist. 
    - Beispiel: "Wie setze ich mein Passwort zurück?"

- Erweitern sie die Instruktionen, sodass der Agent Nachfragen stellt nach der gewünschten Sprache.
- Führen sie einen weiteren Verhaltenstest aus.
- Beachten sie insbesondere die *Activity Map* um das Verhalten zu verstehen.

### Ergebnisse
- Der Helpdesk Agent wurde nun als generative Agent neu designed und grundlegendes Verhalten wurde definiert. Die Grundlage für die weiteren Labs ist gelegt, um dem Agent Wissen und einen 'Werkzeugkasten' an Fähigkeiten beizubringen.


## Weiterführende Links
- [Copilot Studio - Generative Orchestration](https://learn.microsoft.com/en-us/microsoft-copilot-studio/advanced-generative-actions)
