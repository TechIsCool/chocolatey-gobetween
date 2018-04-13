$package = '##PACKAGENAME##'

$launch_path = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$pp = Get-PackageParameters
if (!$pp['InstallPath']) { $pp['InstallPath'] = "$env:SystemDrive:\ProgramData\${package}" }

$choco_params = @{
  PackageName    = "$package"
  UnzipLocation  = $pp['InstallPath']
  url           = "##FILEPATH##/##FILEx86##"
  url64         = "##FILEPATH##/##FILEx64##"
  checksum       = '##SHA256x86##'
  checksumType   = 'sha256'
  checksum64     = '##SHA256x64##'
  checksumType64 = 'sha256'
  ValidExitCodes = @(0)
}

Install-ChocolateyZipPackage @choco_params

if (!$pp["DisableFirewall_Metrics"]){
  Write-Output 'Firewall Rules Enabled'
  New-NetFirewallRule -Name "${package}-Metrics-HTTP-In-TCP" `
  -DisplayName "${package} (HTTP-In)" `
  -Description "Inbound rule for ${package} Metrics. [TCP 9284]" `
  -Protocol TCP `
  -LocalPort "9284" `
  -Action Allow `
  -Profile Domain,Private

  New-NetFirewallRule -Name "${package}-Metrics-HTTP-In-TCP-PUBLIC" `
  -DisplayName "${package} (HTTP-In)" `
  -Description "Inbound rule for ${package} Metrics. [TCP 9284]" `
  -Protocol TCP `
  -LocalPort "9284" `
  -Action Allow `
  -Profile Public
}

if (!$pp['Command']) { $pp['Command'] = 'from-file' }
if (!$pp['ConfigType']) { $pp['ConfigType'] = "toml" }
if (!$pp['ConfigPath']) { $pp['ConfigPath'] = "$($pp['InstallPath'])\config\${package}.toml" }

$args = "$($pp['Command']) -f $($pp['ConfigType']) -c '$($pp['ConfigPath'])'"

&nssm install "$package" "C:\ProgramData\${package}\${package}.exe" "${args}"
&nssm set "$package" Start SERVICE_AUTO_START