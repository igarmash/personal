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
