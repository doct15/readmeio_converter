---
title: "Auto Deploy from your CI Platform"
excerpt: ""
---
Distelli makes it easy to deploy to your server or environment directly from your Continuous Integration (CI) systems. In this guide, we'll review how to set up Distelli with CI to deploy directly to server(s).
[block:callout]
{
  "type": "warning",
  "body": "Distelli provides continuous integration and continuous deployment. For more information see [Overview of CI/CD with Distelli](doc:overview-of-cicd-with-distelli)."
}
[/block]
The following steps must occur.

1. Create the application in your Distelli account.
2. Add an environment to the application.
3. Add a server to the environment.
4. Commit the Distelli manifest to the repo.
5. Commit the Distelli credentials file to the repo.
6. Add the deploy command to the CI system.

Make sure you have signed up for a [Distelli account](https://www.distelli.com/signup) before beginning.
[block:api-header]
{
  "type": "basic",
  "title": "1. Create the Application in your Distelli account."
}
[/block]
To push and deploy an application using Distelli, the application must first be created. To create an application in Distelli, see [Creating an Application](creating-an-application-1).
[block:api-header]
{
  "type": "basic",
  "title": "2. Add an Environment to the Application."
}
[/block]
Applications are deployed to environments. Environments contain servers. Before you can deploy your application you must first create an environment for the application.

To create an environment see [Creating an Environment](creating-an-environment-1).
[block:api-header]
{
  "type": "basic",
  "title": "3. Add a Server to the Environment."
}
[/block]
To add a server to the environment you just created, follow the instructions [Adding Servers to an Environment](doc:adding-servers-to-an-environment).
[block:callout]
{
  "type": "info",
  "body": "Adding servers to environments can be automated with the distelli.yml credentials file. For more info, see [Distelli distelli.yml Usage](doc:distelli-distelliyml-usage)."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "4. Commit the Distelli Manifest to the Repo."
}
[/block]
For an application to successfully deploy with Distelli, it requires a `distelli-manifest.yml` file. The contents of this file vary based on the application and requirements. There are many examples available in:

* [Distelli Tutorials](doc:tutorials-index) 
* [Distelli Manifest Library of Examples](doc:distelli-manifest-library-of-examples) 

And a complete reference guide [Distelli Manifest](doc:distelli-manifest).

The first line of this file is:
[block:code]
{
  "codes": [
    {
      "code": "<username>/<application_name>:",
      "language": "yaml"
    }
  ]
}
[/block]
The **username** is your Disetlli username (see [Finding Your Distelli Username](doc:finding-your-distelli-username)) or the Distelli organization team username (see [Finding a Teams Username](doc:finding-a-teams-distelli-username)).

The **application_name** is the name of the application you created in Distelli during Step 1 above.

Once this file is created and working as expected, it needs to be checked into the repository with the application.
[block:api-header]
{
  "type": "basic",
  "title": "5. Commit the Distelli Credentials File to the Repo."
}
[/block]
When using the Distelli CLI with a properly configured ~/distelli.yml there will not be a prompt for email credentials. This will allow automated execution of Distelli CLI commands

For information on creating the ~/distelli.yml and finding the DistelliAccessToken and DistelliSecretKey see [Distelli distelli.yml Usage](doc:distelli-distelliyml-usage).
[block:code]
{
  "codes": [
    {
      "code": "DistelliAccessToken: '12345678901234567890123456'\nDistelliSecretKey: '1234567890123456789012345678901234567'",
      "language": "text"
    }
  ]
}
[/block]
Once this file is created, it needs to be checked into the repository with the application.
[block:api-header]
{
  "type": "basic",
  "title": "6. Add the Deploy Command to the CI System."
}
[/block]
When the CI build process is complete and accepted, the CI system will need to execute the following commands:

Copy the distelli.yml file to the build user home directory.
[block:code]
{
  "codes": [
    {
      "code": "cp -f distelli.yml ~/",
      "language": "shell"
    }
  ]
}
[/block]
Get and install the Distelli CLI to the build user home directory.
[block:code]
{
  "codes": [
    {
      "code": "wget -qO- http://download.distelli.com/setup | sh -s ~/",
      "language": "shell"
    }
  ]
}
[/block]
Deploy the application to environment ENVIRONMENT.
[block:code]
{
  "codes": [
    {
      "code": "~/DistelliCLI/bin/distelli deploy -q -y --env <ENVIRONMENT>",
      "language": "shell"
    }
  ]
}
[/block]
For more information on the Distelli CLI `deploy` command see [Distelli CLI](doc:distelli-cli#deploy).
[block:api-header]
{
  "type": "basic",
  "title": "Travis CI"
}
[/block]
Update the .travis.yml file to add a deploy step that will deploy to your environment via Distelli. Add an after_success section to your .travis.yml file with the following contents:
[block:code]
{
  "codes": [
    {
      "code": "after_success:\n  - cp -f distelli.yml ~/\n  - wget -qO- http://download.distelli.com/setup | sh -s ~/\n  - ~/DistelliCLI/bin/distelli deploy -q -y -m \"Deployment from Travis-CI\" --env <ENVIRONMENT>",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Jenkins CI"
}
[/block]
Update Jenkins to add a build step that will deploy to your servers via Distelli. Add a new Execute Shell build step with the following contents:
[block:code]
{
  "codes": [
    {
      "code": "cp -f distelli.yml ~/\nwget -qO- http://download.distelli.com/setup | sh -s ~/\n~/DistelliCLI/bin/distelli deploy -q -y -m \"Deployment from Jenkins\" --env <ENVIRONMENT>",
      "language": "shell"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Codeship"
}
[/block]
Update Codeship to add a Custom Script step that will deploy to your servers via Distelli. Add a custom script step to Codeship with the following contents:
[block:code]
{
  "codes": [
    {
      "code": "cp -f distelli.yml ~/\nwget -qO- http://download.distelli.com/setup | sh -s ~/\n~/DistelliCLI/bin/distelli deploy -q -y -m \"Deployment from Codeship\" --env <ENVIRONMENT>",
      "language": "shell"
    }
  ]
}
[/block]