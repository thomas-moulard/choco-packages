$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'Qt SDK'
  fileType       = 'exe'
  url            = 'https://download.qt.io/archive/qt/5.10/5.10.0/qt-opensource-windows-x86-5.10.0.exe'
  softwareName   = 'Qt*'
  silentArgs     = "--script $toolsPath\installer-noninteractive.qs"
  validExitCodes = @(0)
  checksum       = 'D6B5C46EF7410B0C397F25D55CFD7BB4A5BC040308274041A55F917D9F091305'
  checksumType    = 'sha256'
}

Install-ChocolateyPackage @packageArgs

$installLocation = Get-AppInstallLocation $packageArgs.softwareName
Write-Host "Installed to '$installLocation'"
Install-ChocolateyEnvironmentVariable Qt5_DIR "$(Join-Path $installLocation msvc2017_64)" Machine
