Import-Module AU

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }
function global:au_GetLatest {
  @{
    URL32 = "https://download.qt.io/archive/qt/5.10/5.10.0/qt-opensource-windows-x86-5.10.0.exe"
    Version = "5.10.0"
    PackageName = 'Qt SDK'
  }
}

update -ChecksumFor none
