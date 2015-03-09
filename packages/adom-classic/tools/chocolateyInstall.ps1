$id = "adom-classic"
$name = "Ancient Domains of Mystery (ADOM)"
$url = "http://www.ancardia.com/download/old/1.1.1/adom_windows_1.1.1_beta4.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$adom = Join-Path $content "Adom_winbeta4.exe"

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage $id $url $content

try {
  New-GuiBin -Name $adom
  New-Shortcut -Link $name -Target $adom -SpecialFolder "CommonPrograms"

  Write-ChocolateySuccess $id
} catch {
  Write-ChocolateyFailure $id $_.Exception.Message
  throw
}
