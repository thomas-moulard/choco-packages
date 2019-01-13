$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'rti-connext'
  file           = "$toolsPath\rti_connext_dds_secure-5.3.1-eval-i86Win32VS2017.zip"
  file64         = "$toolsPath\rti_connext_dds_secure-5.3.1-eval-x64Win64VS2017.zip"
  unzipLocation  = "C:\Program Files\rti_connext_dds-5.3.1"
  checksumType   = 'sha256'
  checksum       = '5B78DFAB5A57F542CA94C0F467462430D850C0D94EC13FC06E60A118391220C0'
  checksumType64 = 'sha256'
  checksum64     = 'CAAED4527D2A00F60BCC637742B73FE7C7CAE9B57809A9BBF2BE1C8D729FDE79'
}

Install-ChocolateyZipPackage @packageArgs
& $(Join-Path $packageArgs.unzipLocation resource\scripts\rtisetenv_x64Win64VS2017.bat)
Install-ChocolateyEnvironmentVariable NDDSHOME "$packageArgs.unzipLocation" Machine
