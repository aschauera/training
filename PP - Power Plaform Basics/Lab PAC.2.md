# Lab PAC.2 - Microsoft Power Apps - Canvas Apps - Responsive Design
- Canvas Apps Oberflächen gestalten
- Offline Fähigkeiten nutzen

## Zeit: 45 min

## Ziele: 
- Die Teilnehmer kennen die Möglichkeiten von Canvas Apps
- Die Teilnehmer können die verfügbaren App Typen abgrenzen und einschätzen, wann welcher Typ passt.

---
## Aufgabe A - Layouts mit Layout Containern

### [Im Power Maker Portal](https://make.powerapps.com)


## Aufgabe B - Daten offline verfügbar machen


## HINWEISE A

- Formel A für die Navigation auf einen Bildschirm
```
Navigate(<ScreenName>)
```
Formel B: Übergabe eines gewählten Wertes an den Screen (der Wert steht dann in der Variable "SelectedCourse" zur Verfügung)
```
Navigate(ScreenDetail, {SelectedCourse: GalleryCourses.Selected })
```

Formel C: Suchen von Kursen
```
Search(Kurs,TextInput1.Text,Kursnummer,Name,Thema)
```