$ErrorActionPreference = 'Stop'; 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'MP3SkypeRecorderSetup.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file          = $fileLocation
  fileType      = 'MSI' 
  softwareName  = 'MP3 Skype recorder*' 
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
  validExitCodes= @(0,1641,3010)
}

Install-ChocolateyPackage @packageArgs 
Remove-Item -Force $packageArgs.file
