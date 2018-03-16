$package = '##PACKAGENAME##'

$launch_path = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$choco_params = @{
  PackageName    = "$package"
  UnzipLocation  = "C:\ProgramData\${package}"
  url           = "##FILEPATH##/##FILEx86##"
  url64         = "##FILEPATH##/##FILEx64##"
  checksum       = '##SHA256x86##'
  checksumType   = 'sha256'
  checksum64     = '##SHA256x64##'
  checksumType64 = 'sha256'
  ValidExitCodes = @(0)
}

Install-ChocolateyZipPackage @choco_params


# New-NetFirewallRule -Name "Gobetween-Metrics-HTTP-In-TCP" `
# -DisplayName "Gobetween (HTTP-In)" `
# -Description "Inbound rule for Gobetween Metrics. [TCP 9284]" `
# -Protocol TCP `
# -LocalPort "9284" `
# -Action Allow `
# -Profile Domain,Private

# New-NetFirewallRule -Name "Gobetween-Metrics-HTTP-In-TCP-PUBLIC" `
# -DisplayName "Gobetween (HTTP-In)" `
# -Description "Inbound rule for Gobetween Metrics. [TCP 9284]" `
# -Protocol TCP `
# -LocalPort "9284" `
# -Action Allow `
# -Profile Public

&nssm install "$package" "C:\ProgramData\${package}\${package}.exe" "$($env:chocolateyPackageParameters)"
&nssm set "$package" Start SERVICE_AUTO_START