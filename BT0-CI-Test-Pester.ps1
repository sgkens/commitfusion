using module .\Logtastic.psm1

BeforeAll {}

Describe "LogTastic Instance Properites" {
  it "LogTate should be true" {
    $logtastic = Get-LogTasticModuleInstance  
    $logtastic.EnableLogDate()
    $logtastic.LogDate | should -be $true
  }

  it "LogTate should be false" {
    $logtastic = Get-LogTasticModuleInstance  
    $logtastic.DisableLogDate()
    $logtastic.LogDate | should -be $false
  }
}