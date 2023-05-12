#Lab VM.1 Deployment eigener virtueller Maschinen

Zeit: 30 min

## Ziele: 
- Verständnis für die Erstellung und Architektur von Azure Virtual Machines
- Verständnis für Deployment von Inhalten innerhalb von VMs
---	
## Aufgabe

### In Azure Portal:
- Erstellen sie eine neue virtuelle Maschine
- Öffnen sie zusätzlich nötige Ports (445,446)
- Weisen sie ihrem Benutzer die RBAC Rolle "Virtual Maschine Contributor" zu, sodass sie für alle VMs (auch zukünfitge) diese Rolle besitzen
- Prüfen sie die "Boot Diagnostics" -> was macht die VM?
		
### Mit PowerShell
- Rollen sie eine neue Windows Server VM aus
- Rufen sie die öffentliche IP Adresse ab und speichern sie sie in einer Variable
- Installieren sie die Web Server Rolle (IIS) auf der Virtuellen Maschine
- Prüfen sie die Funktionsfähigkeit der VM - in welchem Status ist die Maschiene?

## HINWEISE

### Installation von VM Extensions

- Parameter für cmdLet Set-AzVMExtension für die Ausführung von Custom Scripts in der VM
```
-ExtensionName "IIS" `
-Publisher Microsoft.Compute `
-ExtensionType CustomScriptExtension `
-TypeHandlerVersion 1.8 `
-SettingString '{"commandToExecute":"powershell Add-WindowsFeature  Web-Server; powershell Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername)"}'
```