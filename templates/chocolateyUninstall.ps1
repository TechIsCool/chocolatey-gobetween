$package = '##PACKAGENAME##'

$pp = Get-PackageParameters

if (!$pp["FirewallDisableMetrics"]){
  Remove-NetFirewallRule -Name "${package}-Metrics-HTTP-In-TCP"
  Remove-NetFirewallRule -Name "${package}-Metrics-HTTP-In-TCP-PUBLIC"
}

&nssm stop "${package}"
&nssm remove "${package}"

Remove-Item "C:\ProgramData\${package}" -Recurse -Force