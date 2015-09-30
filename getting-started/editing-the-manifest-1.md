---
title: "Editing the Manifest"
excerpt: ""
---
<div><div style="float: left;">**<- go back to [Using a Repository](doc:using-a-repository)**</div><div style="float: right;">**go forward to [Creating the Application](doc:creating-the-application) ->**</div></div>
<br>

The Distelli Manifest file provides the Distelli Platform with the needed information to successfully build and deploy your application. This file must exist before building your application with Distelli.

The sample application you cloned will already have an existing distelli-manifest.yml file in the application root directory. You will need to make a small change to this file before you can build and deploy the application with Distelli.

1. Edit the distelli-manifest.yml file.

On the first line you will see a <username> placeholder, and then the name of the sample application.

2. Replace the <username> placeholder with your Distelli username. To find your Distelli username see Finding Your Distelli Username.

For example if your username is 'YourUserName' your distelli-manifest.yml should look like this:

[block:code]
{
  "codes": [
    {
      "code": "YourUserName/nodejsbuilddeploy:\n  # Distelli Manifest example\n  # this example assumes the build and deploy servers are:\n  # Ubuntu 14.04\n\n  PreRelease:\n    - echo \"---Beginning PreRelease---\"\n    - echo \"--Installing build dependencies--\"\n    - echo \"-Updating apt-get-\"\n    - sudo apt-get -y update\n    - echo \"-Installing nodejs-\"\n    - sudo apt-get -y install nodejs\n    - echo \"-Installing npm-\"\n    - sudo apt-get -y install npm\n    - echo \"--Building--\"\n    - sudo npm install\n    - echo \"--Testing--\"\n    - npm test\n\n  PkgInclude:\n    - '*'\n\n  PkgExclude:\n    - node_modules/\n\n  PreInstall:\n    - echo \"---Begining PreInstall---\"\n    - echo \"--Installing deploy dependencies--\"\n    - echo \"-Updating apt-get-\"\n    - sudo apt-get -y update\n    - echo \"-Installing nodejs-\"\n    - sudo apt-get -y install nodejs\n    - echo \"-Installing npm-\"\n    - sudo apt-get -y install npm\n\n  PostInstall:\n    - echo \"Begin PostInstall\"\n    - npm install\n    \n  Env:\n    - PORT: 3000\n    \n  Exec:\n    - /usr/bin/nodejs app.js",
      "language": "text"
    }
  ]
}
[/block]
3. **Save** the `distelli-manifest.yml` file.
[block:api-header]
{
  "type": "basic",
  "title": "Next"
}
[/block]
You have edited the Distelli manifest file. Later you will check-in the change you made into the repository.

To continue the Getting Started step by step guide continue on to [Installing the CLI](doc:installing-the-cli) 

<br>
<div><div style="float: left;">**<- go back to [Using a Repository](doc:using-a-repository)**</div><div style="float: right;">**go forward to [Creating the Application](doc:creating-the-application) ->**</div></div>