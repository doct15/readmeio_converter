---
title: "Distelli Build Environment"
excerpt: "Building your application on Distelli build servers"
---
[block:api-header]
{
  "type": "basic",
  "title": "Overview"
}
[/block]
The below information represents the Distelli build environment when doing builds using the distelli-manifest.yml with Distelli build servers.

Distelli also supports doing builds with travis.yml.

[block:api-header]
{
  "type": "basic",
  "title": "Virtual Environment"
}
[/block]
Distelli builds are always built in the following docker container:
<a href="https://hub.docker.com/r/distelli/travis-base/" target="_blank">distelli/travis-base</a>

The below documents this docker container environment.
[block:api-header]
{
  "type": "basic",
  "title": "Operating System"
}
[/block]
The docker image is Ubuntu 14.04.
[block:code]
{
  "codes": [
    {
      "code": "$ uname -a\nLinux 0e146561829a 3.16.0-34-generic #47~14.04.1-Ubuntu SMP Fri Apr 10 17:49:16 UTC 2015 x86_64 x86_64 x86_64 GNU/Linux",
      "language": "shell"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Networking"
}
[/block]
The virtual machines do not have any external IPv4 address but are fully able to communicate with any external IPv4 service.

Most services work normally when talking to the local host by either localhost or 127.0.0.1.

IPv6 is enabled, but does not have a globally unique address or reachability.
[block:api-header]
{
  "type": "basic",
  "title": "Applications Available"
}
[/block]
#### Version Control
* Git version 1.7.9.5
* Mercurial 2.0.2
* Subversion 1.6.17

#### Compilers & Build
* automake
* gcc 4.6.3
* javac 1.7.0_80
* make 3.8.1

#### Networking Tools
* curl
* rsync
* ssh/scp
* wget

#### Package Manager
* apt-get
* dpkg

#### Languages
* java 1.7.0_80
* perl5 rev 5 ver 14 sub 2
* python 2.7.3

<br>

For more information on installing build dependencies see [Build Language Reference](doc:build-language-reference) and see [Installing Dependencies](doc:installing-dependencies).
[block:api-header]
{
  "type": "basic",
  "title": "Hardware"
}
[/block]
Distelli build servers are hosted on Google Compute Engine machines in the us-central zone.