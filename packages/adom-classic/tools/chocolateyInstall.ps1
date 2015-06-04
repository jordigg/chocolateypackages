$id   = "adom-classic"
$name = "Ancient Domains of Mystery (ADOM)"
$url  = "http://www.ancardia.com/download/old/1.1.1/adom_windows_1.1.1_beta4.zip"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$adom    = Join-Path $content "Adom_winbeta4.exe"
$batch   = Join-Path $content "adom.bat"

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage $id $url $content

@"
@ECHO OFF
START "$name" /D "%LOCALAPPDATA%" "$adom" %*
"@ | Out-File $batch -encoding 'ASCII'

New-IgnoreBin -Name $adom

New-Shortcut -Link $name -Target $batch -SpecialFolder "CommonPrograms" -Icon $adom
New-Shortcut -Link $name -Target $batch -SpecialFolder "CommonDesktop" -Icon $adom
