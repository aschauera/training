# Lab MCS.3.1: Generative Orchestration - Multi Modale Dialoge

## Übersicht
In diesem Lab werden Multi Modale Interaktionen vorgestellt, zur Analyse von Bildern.

## Voraussetzungen
- Copilot Studio Zugang
- Kenntnisse im Umgang Classic Orchestration und Generative Answers

## Lab-Umgebung einrichten
1. Navigieren sie zu [https://copilotstudio.microsoft.com](https://copilotstudio.microsoft.com)
2. Stellen sie sicher dass die richtige Umgebung ausgewählt ist (rechts oben unter "Umgebung" oder "Environment")
3. Öffnen sie den Agent welchen sie in [Lab MCS.3.1](Lab%20MCS.3.1%20-%20Generative%20Orchestration.md) erstellt haben

## Übung 1: Der Helpdesk Agent lernt Bilder zu analysieren
Zeit: 25 
### Ziele
- Teilnehmer können Multi Modale Interaktionen gestalten.

### Gewünschte Ergebnisse
-  Der Helpdesk Agent soll es Benutzern erlauben einfache Screenshots von Fehlermeldungen hochzuladen.

### Schritte

**1. Multi Modalität**

- Unter *Settings > Generative AI* stellen sie sicher dass der Bildupload aktiviert ist.
- Erweitern sie die Instruktionen, sodass der Agent bei einem Bildupload spezifisch den Fehler analysiert.
- Testen sie den Agenten in dem sie das Beispielbild hochladen und entsprechende Fragen dazu stellen [Downlaod Fehlerbild](../labs/data/M04_VPN_error_sample_image.png)

### Ergebnisse
- Der Helpdesk Agent wurde nun als generative Agent neu designed und grundlegendes Verhalten wurde definiert. Die Grundlage für die weiteren Labs ist gelegt, um dem Agent Wissen und einen 'Werkzeugkasten' an Fähigkeiten beizubringen.


## Weiterführende Links
- [Copilot Studio - Generative Orchestration](https://learn.microsoft.com/en-us/microsoft-copilot-studio/advanced-generative-actions)
