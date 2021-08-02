### Drives ###
New-PSDrive -Name "swv" -PSProvider "FileSystem" -Root "S:\Persönliche Daten\igor.garmash\_dev\_repos\SWV" | Out-Null
New-PSDrive -Name "sh" -PSProvider "FileSystem" -Root "S:\Persönliche Daten\igor.garmash\_dev\_repos\SH" | Out-Null
New-PSDrive -Name "ava" -PSProvider "FileSystem" -Root "S:\Persönliche Daten\igor.garmash\_dev\_repos\avanta-cortex-swv" | Out-Null

### Aliases ###
#Set-Alias -Name eps -Value Enter-PSSession #auch etsn
Set-Alias -Name rc -Value Restart-Computer
Set-Alias -Name gse -Value Get-ShutdownEvents
Set-Alias -Name ll -Value ls
Set-Alias -Name ise -Value powershell_ise

### Funktionen ###

function uptime () 
{
	net statistics server
}

function Get-CmdletAlias ($cmdletname) {
  Get-Alias |
    Where-Object -FilterScript {$_.Definition -like "$cmdletname"} |
      Format-Table -Property Definition, Name -AutoSize
}

function Get-ShutdownEvents ($Hostname)
{

	#Die gesuchten EventIDs
	$EventIDs = 1074, 6006, 6005, 6013
	
	#Anzahl der neusten Events
	$NewestEvents = 1000
	Get-EventLog -ComputerName $Hostname -LogName system -Newest $NewestEvents | Where-Object {$EventIDs -contains  $_.EventID} | out-gridview -title $Hostname

}

function touch {set-content -Path ($args[0]) -Value ($null)}

# ToDo: Header
function Update-JavaExceptionSites()
{
    # Variablen
    [String] $adSearchBase = 'OU=SH,OU=Store,OU=Computers,OU=MGB,DC=pop,DC=migros,DC=ch'
    [String] $exceptionSitesDir = "$env:USERPROFILE\AppData\LocalLow\Sun\Java\Deployment\security" 
    [String] $exceptionSitesPath = "$exceptionSitesDir\exception.sites"

    # Alle SH abfragen
    $storehubArray = @()
    $storehubArray = Get-AdComputer -Filter * -SearchBase $adSearchBase

    [String] $outputString = ""

    # Output String generieren
    foreach ($sh in $storehubArray)
    {

        [String] $outputString += "https://rsa-$($sh.Name):443`n"

    }

    # Exception Site Verzeichnisstruktur anlegen, falls nicht vorhanden
    if (!(Test-Path -Path $exceptionSitesDir))
    {

        New-Item -ItemType Directory -Force -Path $exceptionSitesDir | Out-Null

    }

    # $env:USERPROFILE\AppData\LocalLow\Sun\Java\Deployment\security\exception.sites Ã¼berschreiben
    $outputString | Out-File -FilePath $exceptionSitesPath -Encoding ascii
}

function Get-DsmCompliance
{

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [String]
        $ComputerName
    )
    
    $EmdbDrive = "\\swvps002.pop.migros.ch"
    
    # EMDB Verbindung aufbauen, falls nicht vorhanden
    if (!(Test-Path -Path "Emdb:"))
    {
        New-EmdbDrive -Root $EmdbDrive | Out-Null
    }
    
    # Alle Face Geräte abfragen
    $devices = Get-EmdbComputer "emdb:\rootDSE\Managed Users & Computers\FACE\*\" -Filter "cn:IgnoreCase=*$($ComputerName)*" -Recurse
    
    foreach ($device in $devices)
    {
    
        $device | Select-Object Name, LastCalculatedCompliance, Modifier, ModificationDate

    }

}

### Main ###
sl \
cls
Write-Host "$(hostname)`n"
