---
title: "Deployment Types"
excerpt: ""
---
There are currently 3 types of deployments.
* [Deploy](#deploy)
* [Restart](#restart)
* [Terminate](#terminate) 
[block:api-header]
{
  "type": "basic",
  "title": "Deploy"
}
[/block]
A deploy will deploy the application release to the servers in the application environment.
The following manifest sections will be processed in this order.
1. PreInstall
2. PkgInclude or Install
3. PostInstall
4. PreStart
5. Start or Exec
6. PostStart
[block:api-header]
{
  "type": "basic",
  "title": "Restart"
}
[/block]
A restart will stop the existing application process that was started with a manifest Exec section. Then attempt to start the process again.
The following manifest sections will be processed in this order.
1. PreRestart
2. PreStart
3. Start or Exec
4. PostStart
5. PostRestart
[block:api-header]
{
  "type": "basic",
  "title": "Terminate"
}
[/block]
A terminate will stop the existing application process that was started with a manifest Exec section. Then remove the application from the server.
The following manifest sections will be processed in this order.
1. PreTerminate
2. Terminate
3. PostTerminate
[block:api-header]
{
  "type": "basic",
  "title": "Deployment Types across the Manifest Sections"
}
[/block]
The values indicate the order the distelli-manifest.yml sections are processed depending on the deployment type.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/q9W9OgOeSgaTlw6dB2GM",
        "manifest_chart.png",
        "678",
        "695",
        "#956a57",
        ""
      ]
    }
  ]
}
[/block]

[block:parameters]
{
  "data": {
    "0-0": "PreRelease",
    "2-0": "Install",
    "3-0": "PostInstall",
    "4-0": "PreRestart",
    "6-0": "Start OR Exec",
    "7-0": "PostStart",
    "8-0": "PostRestart",
    "9-0": "PreTerminate",
    "10-0": "Terminate",
    "11-0": "PostTerminate",
    "5-0": "PreStart",
    "h-1": "Deploy",
    "h-2": "Restart",
    "h-3": "Terminate",
    "0-1": "",
    "2-1": "2",
    "3-1": "3",
    "4-2": "1",
    "5-2": "2",
    "6-2": "3",
    "7-2": "4",
    "8-2": "5",
    "5-1": "4",
    "6-1": "5",
    "7-1": "6",
    "9-3": "1",
    "10-3": "2",
    "11-3": "3",
    "h-4": "What",
    "0-4": "This phase is used to specify any build and/or test steps that must pass before a release is created.",
    "2-4": "If this section is included in your manifest, the application bundle will not be unbundled to the destination server.\n\nIf this section is not included in your manifest, it is during this phase that the application bundle is unbundled to the destination server.",
    "3-4": "At this phase, after install, your application bundle is available on the destination server. Now is when you may want to run application specific install steps.",
    "4-4": "Only occurs during a restart application deploy.",
    "8-4": "Only occurs during a restart application deploy.",
    "5-4": "Steps to complete before starting or executing your application.",
    "7-4": "Steps to complete after the application is started or executed.",
    "6-4": "This is the step(s) to launch your application. If both \"Start\" and \"Exec\" sections are included, only the Exec section will be executed.",
    "1-0": "PreInstall",
    "1-1": "1",
    "1-4": "Happens before Install. Application bundle has not been unbundled to the destination server.\nTypically used to install system level prerequisites.",
    "h-5": "Build",
    "0-5": "1"
  },
  "cols": 6,
  "rows": 12
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Distelli Push and PreRelease"
}
[/block]
It should be noted that the distelli-manifest.yml PreRelease section is run during a disteli push before the release is bundled and pushed.

This section is also used to specify build instructions. For example:
[block:code]
{
  "codes": [
    {
      "code": "jdoe/NodeExpress:\n  PkgInclude:\n    - '*'\n  PkgExclude:\n    - node_modules/\n  PreRelease:\n    - echo \"Begin PreRelease Build Steps\"\n    - sudo npm install\n    - npm test\n    - echo \"End PreRelease Build Steps\"\n  PreInstall:\n    - echo \"Begin PreInstall\"\n    - sudo apt-get update\n    - sudo apt-get install nodejs -y\n    - sudo apt-get install npm -y\n\n  PostInstall:\n    - npm install\n  Exec:\n    - echo \"Begin Exec\"\n    - /usr/bin/nodejs app.js",
      "language": "yaml"
    }
  ]
}
[/block]

For more information on this see [Distelli Manifest](doc:distelli-manifest#prerelease)