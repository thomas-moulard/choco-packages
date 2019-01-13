$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Qt SDK'
  fileType       = 'exe'
  file           = "$toolsPath\qt-opensource-windows-x86-5.10.0.exe"
  softwareName   = 'Qt*'
  silentArgs     = "--script $toolsPath\installer-noninteractive.qs"
  validExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs
Remove-Item -Force -ea 0 "$toolsPath\*.exe","$toolsPath\*.ignore"

$installLocation = Get-AppInstallLocation $packageArgs.softwareName
Write-Host "Installed to '$installLocation'"
Install-ChocolateyEnvironmentVariable Qt5_DIR "$(Join-Path $installLocation msvc2017_64)" Machine
