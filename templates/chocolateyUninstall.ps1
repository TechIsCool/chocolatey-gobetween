$package = '##PACKAGENAME##'

Remove-NetFirewallRule -Name "Gobetween-Metrics-HTTP-In-TCP"
Remove-NetFirewallRule -Name "Gobetween-Metrics-HTTP-In-TCP-PUBLIC"

Remove-Item "C:\ProgramData\${package}" -Recurse -Force