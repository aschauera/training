MARKDOWN

# Lab SOL.1 - Power Platform - Grundlagen

## Zeit: 20 min

## Ziele: 
- Die Teilnehmer kennen die Authentifizierungs und Authorisierungsmechanismen in Power Platform
- Die Teilnehmer kennen den Aufbau von Power Platform Umgebungen
- Die Teilnehmer wissen wie sie das Solution Modell optimal nutzen
---
## Aufgabe A - Rollen und Rechte zuweisen

### [Im Power Platform Admin Center](https://admin.powerplatform.microsoft.com/home)
- Berechtigen sie den Benutzer Alan Steiner auf ihre Power Platform Umgebung, sodass der Benutzer einer eigenen Sicherheitsrolle zugewiesen ist, Inhalte erstellen kann ABER KEINE CHATBOTS erstellen kann (unter [Umgebung] > Security Roles).
Erstellen sie dabei eine Kopie der Standard Rolle "Environment Maker" und entfernen sie die Rechte für "Chatbot"

## Aufgabe B - Umgebungen erstellen und verwalten und sichern
- Erstellen sie eine neue "Sandbox" Umgebung. Diese soll als Spielwiese für persönlich Produktivität dienen. Schränken sie in dieser die verfügbaren Connectoren ein sodass alle sperrbaren Connectoren auch gesperrt sind (Hinweis: "Blockable" = YES)

## Aufgabe C - Lösungen erstellen und ausrollen

- Sie haben nun mehrere Umgebungen in ihrem Tenant. Um Lösungen zwischen Umgebungen zu transportieren dient der Solution Mechanismus.
### Im [Maker Portal](make.powerapps.com) - unter Solutions / Lösungen:
- Erstellen sie eine neue "Unmanaged" Lösung. Diese wird für die Folgelabs als Container dienen. Als "Publisher" geben sie ihren eigenen Namen und ein Prefix an, sodass sie alle Inhalte wieder finden könnne.
- FRAGE: Was unterscheided Managed/Unmanaged? 
- Fügen sie ihrer Lösungen mittels "Add Existing" > Table > Contact eine existierende Tabelle hinzu.
- Exportieren sie ihre Lösung
- Importieren sie ihre Lösung in ihre neue Umgebung aus Aufgabe B

## HINWEISE

- Name der Standard "Maker" Rolle
```
"Environment Maker"
```
