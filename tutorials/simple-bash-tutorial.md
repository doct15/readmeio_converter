---
title: "Simple Bash Tutorial"
excerpt: ""
---
This tutorial will get you setup and deploying a simple Bash application with Distelli in minutes.

The tutorial assumes you have already:
* [Created a free Distelli account](https://www.distelli.com/signup).
* Completed the [Deploys Tutorial Setup (do this first)](doc:tutorial-setup).
* Have Git installed on your **Development** server.

The scenario also expects that you have a **Destination** server available to do deployments of the example application.
[block:api-header]
{
  "type": "basic",
  "title": "Step 1: Cloning an Application"
}
[/block]
In this step, you'll clone a simple sample application from Distelli's public GitHub repository. These steps should be completed on the Development server where you installed the Distelli CLI.

Enter the following command to clone the sample Bash application from GitHub:
[block:code]
{
  "codes": [
    {
      "code": "#Clone a sample app repo from GitHub to your local machine\ngit clone https://github.com/Distelli/BashSimpleApp.git\n\n#Then, CD into the sample repo\ncd BashSimpleApp",
      "language": "c",
      "name": "test"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 2: Inspecting the Manifest File"
}
[/block]
The Distelli Manifest file provides the Distelli Platform with the needed information to successfully deploy your application. This file must exist before pushing your application to Distelli.

The sample application you cloned will already have an existing `distelli-manifest.yml` file in the application root directory. You will need to make a small change to this file before you can push the application up to Distelli.

Edit the `distelli-manifest.yml` file. On the first line you will see a <username> placeholder, and then the name of the sample application.
Replace the <username> placeholder with your Distelli username. For example if your username is 'YourUserName' your `distelli-manifest.yml` should look like this:
[block:code]
{
  "codes": [
    {
      "code": "YourUserName/BashSimpleApp:\n  # This Basic Distelli Manifest has no \n  # destination requirements.\n  #\n\n  Env:\n    - EXAMPLE: '\"CHANGE ME TO SOMETHING FUN\"'\n\n  Exec:\n    - echo \"Beginning Execution\"\n    - exec ./simplebash.sh\n\n  PkgInclude:\n    - simplebash.sh",
      "language": "text"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "*In .yml (YAML format) files, correct indentation is important.*",
  "title": ""
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 3: Creating a Version of the Application on Distelli"
}
[/block]
In this step, you'll create a remote version of your application on Distelli using the **distelli create** command. You only need to create the application once, after that you can push the application, and subsequent versions, up to Distelli.

To create an application in Distelli, enter the following command replacing **YourUserName** with your Distelli username:
[block:code]
{
  "codes": [
    {
      "code": "distelli create YourUserName/BashSimpleApp",
      "language": "text"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "*The application name must match the application name in the Distelli Manifest.*",
  "title": ""
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 4: Pushing your First Version"
}
[/block]
In this step, you'll push your first application version to Distelli using the `distelli push` command.

Enter the following command in the terminal:
[block:code]
{
  "codes": [
    {
      "code": "distelli push -m \"Initial Release of BashSimpleApp\"\n\nPushing App: BashSimpleApp\nUploading Bundle: [==========] 100%\n\nCreating Release... DONE",
      "language": "text"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "title": "",
  "body": "*Just as it is important to have a succinct comment for software repository checkins, it is best-practice to include a relevant message when pushing or deploying your application up to Distelli.*"
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 5: Creating an Environment"
}
[/block]
When you deploy an application with Distelli, you can deploy the application to an Environment which may contain 1 or more servers. You can imagine this in relation to the Software Development Life Cycle where you have several environments which may include; Dev, Test, Staging, and Production. And each of these environments may have 1 or more servers.

In this step, you'll create an environment and add the destination server. To do this:

1. Login to the Distelli WebUI at [https://www.distelli.com/login](https://www.distelli.com/login).
2. Click the **BashSimpleAppp** application name.
3. Click the **Environments** link.
4. Click the **Create Environment** button.
5. Enter the **Name** *Stage-bash*.
6. Click **Create Environment**

You have just created an environment named Stage-bash.

7. Click the **Servers** link.
8. Click **Add Servers** link.
9. Select the **Add Server** checkbox for the server you installed the agent on.
10. Click the **Add Selected Servers** link.

You have added server(s) to the environment.
[block:api-header]
{
  "type": "basic",
  "title": "Step 6: Deploying your Release"
}
[/block]
In this step, you'll deploy your release to the Stage-bash environment which includes your destination server. On the development server where you installed the Distelli CLI and the sample application ensure you are in the BashSimpleApp root directory where the Distelli Manifest file is and use the `distelli deploy` command.
[block:code]
{
  "codes": [
    {
      "code": "distelli deploy BashSimpleApp -m \"Initial Release\" -e Stage-bash",
      "language": "c"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "Environment names are case sensitive."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 7: Validation"
}
[/block]
During the deployment you will see Deployment In Progress messages and when it is complete you should see:
[block:code]
{
  "codes": [
    {
      "code": "Deployment ##### Done: [=         ] Servers: 1 Done, 0 In Progress, 0 Failed",
      "language": "c"
    }
  ]
}
[/block]
Since this simple application only outputs to stdout you will have to look at the stdout log in the Distelli WebUI. To do so, sign in to the [the Distelli web interface](https://www.distelli.com/login) and navigate to your **BashSimpleApp** application and select the **Deployments** icon.

Here, at the top of the list, you will see your **Deployment #####**. Select it.

On the Deployment page click the **Stdout** button. This Bash script outputs the Server Time every 8 seconds for 10 iterations and then it will exit. When executing an application using the **Exec:** section in the distelli-manifest.yml, if the application stops, Distelli will automatically relaunch the application. To avoid this behavior, try editing the distelli-manifest.yml and change the section header **Env:** to **Start:** and watch the **View Log** instead of the Stdout.
[block:api-header]
{
  "type": "basic",
  "title": "Troubleshooting"
}
[/block]
For information on troubleshooting deployments, see [Troubleshooting Deploys](doc:troubleshooting-deploys).

[block:api-header]
{
  "type": "basic",
  "title": "Next Steps"
}
[/block]
Try adding more servers to the Stage-bash environment and do a deploy to Stage-bash. You will see the deployment will go to all servers in the environment.
[block:api-header]
{
  "type": "basic",
  "title": "Need More Help?"
}
[/block]
* [Tutorials Index](doc:tutorials-index)
* [Manifest Library of Examples](doc:distelli-manifest-library-of-examples)
* Read the Knowledge Base articles
* Check out the Reference Guides

We're always available to help. Contact [support](http://www.distelli.com/support).