
if(Get-Module -ListAvailable -Name pester | Where-Object { $_.Version -eq "5.5.0" }) {
  import-module -name pester -RequiredVersion '5.5.0'
  Write-Host "Pester 5.5.0 Installed"
}else{
  try{
    Write-Host -f red "Pester 5.5.0 is not Installed"
    Write-Host -f green "Installing Pester Module"
    install-module -name 'pester' -RequiredVersion '5.5.0' -Repository 'psgallary' -confirm:$false
    import-module -name pester -RequiredVersion '5.5.0'
    Write-Host -f Green "Pester 5.5.0 is Installed"
  }
  catch [system.exception] {
    write-host -f red "Error: $($_.Exception.Message)"
  }
}
# Pester Configration settings
# _----------------------------_
# ------------------------------
# Invoke-Pester -CodeCoverage .\libs\*.psm1 -CodeCoverageOutputFile 'Coverage.xml' -CodeCoverageOutputFileFormat JaCoCo -script .\BT0-CI-Test-Pester.ps1 -PassThru
$pesterConfig = New-PesterConfiguration -hashtable @{
  CodeCoverage = @{ 
    Enabled               = $true
    OutputFormat          = 'JaCoCo'
    OutputPath            = 'Coverage.xml'
    OutputEncoding        = 'utf8'
    CoveragePercentTarget = 85
    path                  = "libs\*.psm1","*.psm1"
  }
  Run = @{
    #PassThru = $true
    #scriptblock = {'.\test\Test-Unit-Pester.ps1'}
    Path = '.\tests\Test-Unit-Pester.ps1';
  }
}
Invoke-Pester -Configuration $pesterConfig
