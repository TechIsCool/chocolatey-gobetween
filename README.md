# chocolatey-gobetween
[![Latest version released](https://img.shields.io/chocolatey/v/gobetween.svg)](https://chocolatey.org/packages/gobetween)
[![Package downloads count](https://img.shields.io/chocolatey/dt/gobetween.svg)](https://chocolatey.org/packages/gobetween)
[![Build status](https://ci.appveyor.com/api/projects/status/md5xg3pwjlumn87y?svg=true)](https://ci.appveyor.com/project/TechIsCool/chocolatey-gobetween)

Chocolatey package for [gobetween](gobetween.io/).

This package installs the Gobetween Go package and registers as Service for the package.

*NOTE*: This does not start gobetween on install. Please start it with `Start-Service gobetween`

This Package is a template that will automatically be upgraded when a new verison is release.
 * `/InstallationPath:` - Where to install the binaries to - defaults to "`$env:SystemDrive:\ProgramData\gobetween`"
 * `/ConfigPath:` - Where to source the configuration from - defaults to "`${InstallPath}\config\gobetween.toml`"
 * `/ConfigType:` - determines what type of config (toml, json) - defaults to "toml"
 * `/Command:` - What Command to use (from-consul, from-file, from-url) - defaults to "from-file"
 * `/DisableFirewall_Metrics` - Disables Windows Firewall Rules - Metrics


Please make sure when passing through the install parameter you use

```
-params '"/ConfigPath=C:\\Path\\To\\Config.json /ConfigType=json"'
```


### Used Tech Stack
[AppVeyor](https://ci.appveyor.com/project/TechIsCool/chocolatey-gobetween) -
Builds the Nuget Package

[Chocolatey](https://chocolatey.org/packages/gobetween) -
Hosts the Nuget Package

[GitHub](https://github.com/TechIsCool/chocolatey-gobetween) -
Provided Version Control

[Zapier](https://zapier.com) - 
Checks API every 15 minutes and triggers automtic builds.

