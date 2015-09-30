---
title: "Auto Deploy from your CI Platform2"
excerpt: ""
---
Distelli makes it easy to deploy to your server or environment directly from your Continuous Integration (CI) systems. In this guide, we'll review how to set up Distelli with CI to deploy directly to your server or environment:

1. Install the Distelli CLI on the CI system.
2. Create the application in your Distelli account.
3. Commit the Distelli manifest to the application repository.
4. Add an environment to the application.
5. Add a server to the environment.
6. Create a Distelli credentials file.
7. Add the deploy command to the CI system.

Make sure you have signed up for a [Distelli account](https://www.distelli.com/signup) before beginning.
[block:api-header]
{
  "type": "basic",
  "title": "Step 1. Install the Distelli CLI on the CI System"
}
[/block]
The Distelli CLI provides functionality to push and deploy software directly from a system. To enable your CI system to deploy applications with Distelli, the system will need the Distelli CLI installed. See [Distelli CLI](doc:distelli-cli) for instructions.
[block:api-header]
{
  "type": "basic",
  "title": "Step 2. Create the Application in your Distelli Account"
}
[/block]
For Distelli to be able to deploy your application, it must first be created in your Distelli account. This is as simple as running the `distelli create` command with the Distelli CLI.

The syntax is:
[block:code]
{
  "codes": [
    {
      "code": "distelli create USERNAME/APPLICATIONNAME",
      "language": "text"
    }
  ]
}
[/block]
USERNAME represents your Distelli username you signed up. This is not the email you used, but the username. See [Finding Your Distelli Username](doc:finding-your-distelli-username) if you need help. Also, if you are using Distelli teams, this should be the team username. See [Finding a Teams Username](doc:finding-a-teams-distelli-username) if necessary.

APPLICATIONNAME is the name of your application.

For more information on creating your application see [Creating an Application](creating-an-application-1).
[block:api-header]
{
  "type": "basic",
  "title": "Step 3. Commit the Distelli Manifest to the Application Repository"
}
[/block]
For an application to successfully deploy with Distelli, it requires a `distelli-manifest.yml` file. The contents of this file vary based on the application and requirements. There are many examples available in:

* [Distelli Tutorials](doc:tutorials-index) 
* [Distelli Manifest Library of Examples](doc:distelli-manifest-library-of-examples) 

And a complete reference guide [Distelli Manifest](doc:distelli-manifest).

It is suggested that you create this file, run some standalone test deploys to ensure it works as expected, then incorporate the file into your application repository.
[block:api-header]
{
  "type": "basic",
  "title": "Step 4. Add an Environment to the Application"
}
[/block]
Applications are deployed to environments. Environments contain servers. Before you can deploy your application you must first create an environment for the application.

To create an environment see [Creating an Environment](creating-an-environment-1).
[block:callout]
{
  "type": "info",
  "body": "Remember your environment name for the steps below."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 5. Add a Server to the Environment"
}
[/block]
To add a server to the environment you just created, follow the instructions [Adding Servers to an Environment](doc:adding-servers-to-an-environment).

Adding servers to environments can be automated with the distelli.yml credentials file. For more info, see [Distelli distelli.yml Usage](doc:distelli-distelliyml-usage).
[block:api-header]
{
  "type": "basic",
  "title": "Step 6. Create a Distelli Credentials File"
}
[/block]
When using the Distelli CLI with a properly configured ~/distelli.yml there will not be a prompt for email credentials. This will allow automated execution of Distelli CLI commands

This is required and should be created on the build system in the "home" (~) directory of the build user that does the builds on the build system.

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

[block:api-header]
{
  "type": "basic",
  "title": "Step 7. Add the Deploy Command to the CI System"
}
[/block]
When the CI build process is complete and accepted, the CI system can now execute a `distelli deploy` to deploy the built application. 

This command needs to know where the **distelli-manifest.yml** file is located and is typically run from the directory where the manifest file resides.

Ultimately, the CI system will need to run the following command.
[block:code]
{
  "codes": [
    {
      "code": "distelli deploy -q -y --env <ENVIRONMENT>",
      "language": "text"
    }
  ]
}
[/block]
For more information on the Distelli CLI deploy command see [Distelli CLI](doc:distelli-cli#deploy).
[block:api-header]
{
  "type": "basic",
  "title": "Travis CI"
}
[/block]