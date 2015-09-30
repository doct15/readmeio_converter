---
title: "Building with distelli-manifest.yml PreRelease"
excerpt: ""
---
You can specify your build instructions in the distelli-manifest.yml file in the PreRelease section. For more information on the distelli-manifest.yml see [Distelli Manifest](doc:distelli-manifest).
[block:api-header]
{
  "type": "basic",
  "title": "Customizing the Build"
}
[/block]
A build is typically made up of the following steps:
1. [Install](#Install): Install any dependencies required for the next 2 steps.
2. [Build](#build): Run the build script.
3. [Test](#test): Run tests.

Here is an example PreRelease section of a distelli-manifest.yml:
[block:code]
{
  "codes": [
    {
      "code": "  PreRelease:\n    - echo \"---Begin PreRelease---\"\n    \n    - echo \"---Install dependencies---\"\n    - sudo apt-get -y update\n    - sudo apt-get -y install nodejs\n    - sudo apt-get -y install npm\n    \n    - echo \"---Build application---\"\n    - sudo npm install\n    \n    - echo \"---Run tests---\"\n    - npm test",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Install"
}
[/block]
There are no default install steps. They are customizable. Enter the commands, specific to the operating system being built on, to install any dependencies.

For more information see [Installing Dependencies](doc:installing-dependencies).
[block:api-header]
{
  "type": "basic",
  "title": "Build"
}
[/block]
There are no default build steps. They are customizable. Enter the commands specific the application being built, compiled, linked, etc...
[block:api-header]
{
  "type": "basic",
  "title": "Test"
}
[/block]
There are no default test steps. They are customizable. Enter the commands to initialize the tests.
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)