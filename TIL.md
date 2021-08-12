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
