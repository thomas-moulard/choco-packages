Import-Module AU

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }
function global:au_GetLatest {
  @{
    URL32 = "https://s3.amazonaws.com/RTI/Bundles/5.3.1/Evaluation/rti_connext_dds_secure-5.3.1-eval-i86Win32VS2017.zip"
    URL64 = "https://s3.amazonaws.com/RTI/Bundles/5.3.1/Evaluation/rti_connext_dds_secure-5.3.1-eval-x64Win64VS2017.zip"
    Version = "5.3.1"
    PackageName = 'RTI Connext'
  }
}

update -ChecksumFor none
