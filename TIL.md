# Today i learned

## 13.07.2021

- Lenovo x3100 M5 - Consistency Check sorgt für langsame Ladezeiten (Ladevorgang bleibt bei Windows Logo stehe) und kann im BIOS gestoppt werden. Fall MMM Wädenswil, SH bootet nach einem Disk Austausch nicht mehr.

## 17.07.2021

- Windows Terminal kann mit 'wt' oder 'wt.exe' gestartet werden.

## 02.08.2021

- IMM Power Control lässt sich auch per ssh ansteuern:

```powershell
power state
power on
power cycle
power off

reset
reset -s
```

- PowerShell ISE kann mit 'ise' oder 'ise.exe' gestartet werden.

```powershell
ise
ise Get-DsmCompliance.ps1
```

## 03.08.2021

- Aliases um PS Module zu import-/exportieren

```powershell
ipmo POSFlagFile
rmo POSFlagFile
```

## 04.08.2021

- Gelöschte AD Objekte lassen sich ganz einfach mit PS abfragen

```powershell
Get-ADObject -filter 'isDeleted -eq $true -and name -ne "Deleted Objects"' -includeDeletedObjects
```

## 07.08.2021

- Ein Zufallsnamen für eine Datei generieren

```powershell
[System.IO.Path]::GetRandomFileName()
```

## 10.08.2021

- Immer davon ausgehen dass defekte HW für einen Austausch verwendet wird. (MP VOI Rombach - Mainboard defekt)

## 12.08.2021

[Codewars: Create Phone Number](https://www.codewars.com/kata/525f50e3b73515a6db000b83/powershell)
<br>
[PowerShell: -f operator](https://renenyffenegger.ch/notes/Windows/PowerShell/language/operator/f/index)

```powershell
function New-PhoneNumber([int[]]$numbers)
{
  return '({0}{1}{2}) {3}{4}{5}-{6}{7}{8}{9}' -f @($numbers)
}
```
## 16.08.2021

- PS Parameter unterstützen auch mehrere Aliases

[Stackoverflow](https://stackoverflow.com/questions/51071800/declaring-multiple-aliases-in-an-advanced-powershell-function)

```powershell
[Alias("one","two","three)]
[Alias("one")][Alias("two")][Alias("three")]
```

## 17.08.2021

- Modul Pfad abfragen

```powershell
$env:PSModulePath -Split ';'
```

## 28.08.2021

- Der performanteste Weg den Dateiinhlat einzulesen

[Stackoverflow](https://stackoverflow.com/questions/33511772/read-file-line-by-line-in-powershell)

```powershell
foreach ($line in [System.IO.File]::ReadLines($StoreListPath ))
{

}
```

## 01.10.2021

- WSUS Content verschieben und neu herunterladen

```powershell
Stop-Service WSUSService -Force
Stop-WebAppPool -Name 'WsusPool'
sl 'C:\Program Files\Update Services\Tools'
.\WsusUtil.exe E:\WSUS\ E:\WSUS\movecontent.log -skipcopy
.\WsusUtil.exe reset
Start-Service WSUSService
Start-WebAppPool -Name 'WsusPool'
```

## 05.10.2021

- ESD WIM Format

https://oofhours.com/2021/08/04/make-windows-images-smaller-easily/

```powershell
dism /export-image /SourceImageFile:".\Win10LTSC1809-v8.9.0.wim" /SourceIndex:1 /destinationimagefile:"win10ltsc1809-v8.9.0.esd.wim" /compress:recovery
```

## 10.10.2021

- OSDBuilder

https://osdbuilder.osdeploy.com/docs/basics/get-osdbuilder

## 12.10.2021

- WIMWitch

https://msendpointmgr.com/2019/10/04/wim-witch-a-gui-driven-solution-for-image-customization/

- Microsoft Patch Tuesday erst um 18:00 GMT+1

> Der Patch Tuesday bei Microsoft beginnt in der Regel um 10:00 Pacific Time (Los Angeles), dies entspricht 19:00 MEZ (kann abweichen wegen unterschiedlicher Umstellung Sommer-/Winterzeit). 

## 22.10.2021

- Windows Logs von einem bestimmten Zeitfenster abfragen

```powershell
Get-WinEvent -ListLog * | % {Get-WinEvent -FilterHashTable @{LogName=$_.LogName;StartTime="22-10-2021 09:18:25";EndTime="22-10-2021 09:18:45"} -ea 0} | sort timecreated -Descending | fl *
```

## 27.10.2021

- Windows 10 Build und UBR (Updated Build Revision) abfragen 

[Source](https://stackoverflow.com/questions/57194033/how-to-get-os-build-number-in-windows-10-1809-iso-using-powershell)

```powershell
# OS Build
(get-wmiobject -Class win32_OperatingSystem).BuildNumber
(Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name CurrentBuild).CurrentBuild
[system.environment]::osversion.version.build

# UBR
(Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name UBR).UBR

# DISM
(get-windowsimage -imagepath .\Win10LTSC1809-v8.9.0.esd.wim -Index 1).Build
(get-windowsimage -imagepath .\Win10LTSC1809-v8.9.0.esd.wim -Index 1).SPBuild
```
