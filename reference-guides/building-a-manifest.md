---
title: "Building a Manifest"
excerpt: ""
---
This document discusses the distelli-manifest.yml, in particular, the philosophy, approach, and science to successfully creating a working manifest.
[block:api-header]
{
  "type": "basic",
  "title": "The Manifest"
}
[/block]
The distelli-manifest.yml is a required template that contains the instructions for building and deploying software with Distelli. 

Below is an example manifest with inline comments.
[block:code]
{
  "codes": [
    {
      "code": "johndoe/PHPUbuntuSimpleApp:\n\n  PreRelease:\n    - echo \"---Beginning PreRelease---\"\n    - echo \"--Installing build dependencies--\"\n    - echo \"-Updating apt-get-\"\n    - sudo apt-get -y update\n    - echo \"-Installing nodejs-\"\n    - sudo apt-get -y install nodejs\n    - echo \"-Installing npm-\"\n    - sudo apt-get -y install npm\n    - echo \"--Building--\"\n    - sudo npm install\n    - echo \"--Testing--\"\n    - npm test\n\n  PkgInclude:\n    - '*'\n\n  PkgExclude:\n    - node_modules/\n\n  PreInstall:\n    - echo \"---Begining PreInstall---\"\n    - echo \"--Installing deploy dependencies--\"\n    - echo \"-Updating apt-get-\"\n    - sudo apt-get -y update\n    - echo \"-Installing nodejs-\"\n    - sudo apt-get -y install nodejs\n    - echo \"-Installing npm-\"\n    - sudo apt-get -y install npm\n\n  PostInstall:\n    - echo \"Begin PostInstall\"\n    - npm install\n    \n  Env:\n    - PORT: 3000\n    \n  Exec:\n    - /usr/bin/nodejs app.js",
      "language": "yaml"
    }
  ]
}
[/block]
The manifest is in YAML format. For more information on the YAML format, see [http://www.yaml.org/](http://www.yaml.org/).

The sections of the manifest are clearly defined in the [Distelli Manifest](doc:distelli-manifest) reference guide.

Many sections in the manifest are free form code that is created by you, the user. When building or deploying on linux or mac, this code is specifically bash script. On Windows it is batch script.