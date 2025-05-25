# Lab MCS.2.3: Fallback und Generative Antworten

## Übersicht
In diesem Lab werden die Möglichkeiten, die *Generative Answers* bieten vorgestellt. Der Helpdesk Agent wird weiter verfeinert und die Konversationen in meheren Ebenen sturkturiert mittels Fallback Mechanismen und Wissen aus Dokumenten.

## Voraussetzungen
- Copilot Studio Zugang
- Kenntnisse im Umgang mit Topics, Triggers und Themen

## Lab-Umgebung einrichten
1. Navigieren sie zu [https://copilotstudio.microsoft.com](https://copilotstudio.microsoft.com)
2. Stellen sie sicher dass die richtige Umgebung ausgewählt ist (rechts oben unter "Umgebung" oder "Environment")
3. Öffnen sie den *Helpdesk Agent*, welchen sie in Lab MCS.1.1 erstellt haben. Sie finden die Anleitung dazu in der Datei [Lab MCS.1.1](Lab%20MCS.1.1%20-%20Create%20an%20agent.md)
4. 

## Übung 1: Fragen beantworten mittels Generative Answers
Zeit: 15 min
### Ziele
- Teilnehmer kennen die Möglichkeiten, welche Generative Answers bieten und können diese zielgerichtet einsetzen.

### Gewünschte Ergebnisse
-  Der Helpdesk Agent soll Benutzern soll nicht nur Prozesse auslösen, sondern auch Antworten auf Fragen liefern, für die (noch) kein Agentenprozess vorhanden ist bzw. nötig ist.

### Schritte

**1. Anpassung des Conversational Boosting und Fallback Themas**

- Verwenden sie das Fallback Thema um Anfragen abzufangen, für die kein Dialog vorhanden ist.
- Fügen sie einen neuen *Generative Answers* Knoten ein
    - Als Wissenquelle verwenden sie das Beispieldokument unter [Lab MCS.2.3 - KB Dokument](./data/M03%20GenAnswers%20-%20HelpDesk%20KB%20Document.pdf)

- Stellen sie sicher, dass das Large Language Model **nur** aus den Dokumenten antwortet und **nicht** aus Web- oder eigenem Wissen.

- Weisen sie das LLM an, jede Antwort als Liste von Schritten auszugeben (Bulleted List).

- Testen sie das Verhalten des Agenten. Durch Eingabe einer Frage, welche nicht durch ein Thema abedeckt ist. 
    - Beispiel: "Wie setze ich mein Passwort zurück?"

- Weisen sie das LLM an Antworten auf Deutsch zu erstllen.


### Ergebnisse
- Der Helpdesk Agent wurde um eine QnA Funktion im Stile eines *Fallback* erweitert, um Fragen zu beantworten durch Einsatz des Large Language Models (GPT)

### Hinweise

## Weiterführende Links
- [Copilot Studio - Generative Answers](https://learn.microsoft.com/en-us/microsoft-copilot-studio/nlu-boost-node)
