---
title: "oldDistelli Build Environment"
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
<a href="https://hub.docker.com/r/distelli/distelli-mvn/" target="_blank">distelli/distelli-mvn</a>

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

[block:code]
{
  "codes": [
    {
      "code": "$ cat /etc/lsb-release\nDISTRIB_ID=Ubuntu\nDISTRIB_RELEASE=14.04\nDISTRIB_CODENAME=trusty\nDISTRIB_DESCRIPTION=\"Ubuntu 14.04.2 LTS\"",
      "language": "shell"
    }
  ]
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "$ cat /etc/os-release\nNAME=\"Ubuntu\"\nVERSION=\"14.04.2 LTS, Trusty Tahr\"\nID=ubuntu\nID_LIKE=debian\nPRETTY_NAME=\"Ubuntu 14.04.2 LTS\"\nVERSION_ID=\"14.04\"\nHOME_URL=\"http://www.ubuntu.com/\"\nSUPPORT_URL=\"http://help.ubuntu.com/\"\nBUG_REPORT_URL=\"http://bugs.launchpad.net/ubuntu/\"",
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
[block:api-header]
{
  "type": "basic",
  "title": "Applications Available"
}
[/block]
#### Version Control
* Git version 1.9.1
* Mercurial 2.8.2

#### Compilers & Build
* make
* mvn version 3.3.3

#### Networking Tools
* wget
* ssh/scp
* rsync

#### Package Manager
* apt-get

#### Languages
* java jre build 1.8.0_45-b14
* javac 1.8.0_45
* nodejs v0.12.2
* npm 2.7.4
* perl5 rev 5 ver 18 sub 2
* python 2.7.6

<br>

For more information on installing build dependencies see [Build Language Reference](doc:build-language-reference) and see [Installing Dependencies](doc:installing-dependencies).
[block:api-header]
{
  "type": "basic",
  "title": "Hardware"
}
[/block]
Distelli build servers are hosted on Google Compute Engine machines in the us-central zone.