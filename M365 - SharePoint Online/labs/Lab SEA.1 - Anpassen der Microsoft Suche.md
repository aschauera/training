# Lab SEA.1 - Anpassen der Microsoft Suche
Zeit: 30 min

In diesem Lab passen sie die Microsoft/SharePoint Suche an, um den Benutzern die Suchergebnisse aufzubereiten.

## Ziele
- Verständnis für die Anpassung der Microsoft/SharePoint Suche

## Aufgabe A: Such Resultate für Zertifikate erstellen auf Site Ebene

In [Microsoft SharePoint](https://crm149144.sharepoint.com/sites/LearningManagerADMIN/_layouts/15/settings.aspx)

* Erstellen sie unter "Search" einen neuen Result Type für Inhalte basierend auf dem Inhaltstype "Zertifikat"

* Erstellen sie weiters unter "Search" im Anschluss einen neuen "Result Type" um die Suchergebnisse des Inhaltstyps einem Layout zuzuweisen. Wählen sie als Vorlage "Word"

* Erstellen sie eine neue Query Rule. Die Regel soll einen Bereich mit dem Namen "Zertifikatsdownload" über den Suchergebnisse anzeigen sobald ein Benutzer Inhalte der Result Source "Zertifikat" sucht UND eine Aktion eintippt. Das Aktionsverb soll in diesem Fall "download" lauten.

Ist alles erstellt, sollten in der Sucheseite Ergebnisse vom Inhaltstyp Zertifikat, mit dem, gewählten Layout dargestellt werden und bei Eingabe des Wortes "download" ebenso der Downloadblock - siehe HINWEISE unten.


## Aufgabe B: Suche Resultate übergreifend in MS Search anpassen

Microsoft Search liefert übergreifende (Nicht nur SharePoint) Resultate, zum Beispiel in MS Teams. Die Suche lässt sich ebenso, wie die SharePoint Suche anpassen.

Unter [Search - Verticals](https://admin.microsoft.com/Adminportal/Home#/MicrosoftSearch/verticals)

* Erstellen sie ein neues Vertical um Inhalte vom Inhaltstyp Zertifikat in einem eigener Reiter darzustellen.

Unter [Search - Result Types](https://admin.microsoft.com/Adminportal/Home#/MicrosoftSearch/resulttypes)
* Erstellen sie einen neuen Result Type. Dieser weist ein Layout zu. Hier können sie den Result Type Designer verwenden um grafisch die Ergebnisse zu gestalten. [Search Layout Designer](https://searchlayoutdesigner.azurewebsites.net/chooseLayout)

## HINWEISE

Die Konfiguration der Suche kann einige Stunden in Anspruch nehmen, bis sie auf der Suchseite dargestellt wird.