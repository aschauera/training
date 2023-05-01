# Lab ARM.1 Azure Resource Manager

Zeit: 30 min

## Ziele: 

* Verständnis für Azure Deployment Modelle
* Verständnis für die Vorteile des Azure Resource Manager
---

### Aufgabe B Ressourcen mit ARM ausrollen

* Finden sie unter "Deploy custom template" > "Quickstart Template" das Template 1vm-2nics-2subnets-1vnet (quickstarts/microsoft.Compute) in dem sie im Dropdown nach "1vm" suchen

* Erkunden sie das Template und dessen Bestandteile grafisch (Option "Visualize - verfügbar NACHDEM SELECT Template gewählt wurde.
* Rollen sie das Template in die Resourcengruppe aus

* [Optional] Erweitern sie das Template (Custom deployment - Microsoft Azure)
- Führen sie einen Parameter "numberofInstances" (int)
- Führen sie eine neue Variable ein "AvailabilitySetName"
* [Optional] Wie gehen sie vor?: 
-   Wenn numberofInstances > 1 ist soll ein zusätzliches Availability Set erstellt werden

