---
title: "PHP on Windows Tutorial"
excerpt: ""
---
In this tutorial we will look at deploying a simple PHP 5.4+ application to a Windows server using Distelli. This tutorial includes sample code for you to clone and complete this tutorial deploy.

This tutorial is broken into two parts:
* Installing the prerequisites on the Windows Server first and then deploying.
* Having the Distelli manifest automate the prerequisite installation with the deploy.

Both parts will accomplish the same task but will use different approaches. Follow through the steps to learn how things are done.

First, let’s discuss the Distelli framework.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/FGQPDRyPSdQ8IXylyuH2",
        "distelli-components.png",
        "998",
        "247",
        "#5a96cc",
        ""
      ]
    }
  ]
}
[/block]
There are several pieces to the framework that include:
* The Distelli CLI - Which gives the user an interface to their Distelli Account and provides such functionality as:
  - Distelli Create - Create an application.
  - Distelli Push - Bundle and push the application contents up to your Distelli Account.
  - Distelli Deploy - Deploy the bundled application to an environment with 1 or more servers.
* The Distelli Manifest - A set of deployment instructions. This is key to a successful deploy.
* Distell SaaS - http://www.distelli.com is where your Distelli Account exists.
* Distelli Agent - A small program that sits on your destination server(s) and facilitates deploys to these servers.

The first step is to ensure you have signed up for your Distelli Account at [http://www.distelli.com/signup](http://www.distelli.com/signup). If you have not, do so now.


[block:api-header]
{
  "type": "basic",
  "title": "The Distelli Agent"
}
[/block]
Next, let’s setup your destination Windows server to receive the software deployment from Distelli. In a scenario where there are no prerequisites, getting to deployments is as simple as installing the Distelli Agent. Take a moment now and install the Distelli Agent from [these instructions](doc:installing-the-agent) on your Windows deployment server. 

If you don’t have an extra server readily available, you may want to look at using virtualization. [This document](doc:building-virtual-servers) has helpful information to quickly get you up and running with a virtualized server.
[block:api-header]
{
  "type": "basic",
  "title": "Windows Server Prerequisites"
}
[/block]
In this scenario you will be deploying a simple PHP application to a Windows server. This will require that you install PHP 5.4+ which can be found [here](http://windows.php.net/download/). I chose the standalone VC11 x64 Thread Safe version. Which also requires the installation of Visual C++ Redistributable for Visual Studio which is available [here](http://windows.php.net/download/).

At this point you will have to download and install the Visual C++ Redistributable, first, to your Windows server, and then install PHP. You can follow the links provided above.

Note, that the second half of this tutorial will install the prerequisites as part of the deployment process, but for this first section, you will have to install the prerequisites yourself, as you’ve just done. If you haven’t completed the installs, please do so now. Don’t forget to add the PHP directory to your [path](http://windowsitpro.com/systems-management/how-can-i-add-new-folder-my-system-path).
[block:api-header]
{
  "type": "basic",
  "title": "The Distelli CLI"
}
[/block]
In the next few steps you will setup the Distelli CLI, clone the example software, and deploy. 

The Distelli CLI allows you to bundle and push software for deployment to an environment of servers. On the development system where you will clone the example software, (shown on the left in the diagram above) install the Distelli CLI by following the [instructions here](doc:installing-the-cli).
[block:api-header]
{
  "type": "basic",
  "title": "Clone the Example Software"
}
[/block]
In this step you will use git to clone a public repository of software. Git is a version control system. GitHub, is a web-page on which you can publish your Git repositories and collaborate with other people. Distelli has created many publicly available examples on GitHub.

If you don’t already have git installed, you can install it from [here](https://git-scm.com/downloads).

Once installed on the development system, use git to clone the example repository with the following command:
[block:code]
{
  "codes": [
    {
      "code": "$ git clone https://github.com/Distelli/WinPHPApp.git",
      "language": "text"
    }
  ]
}
[/block]
This will create a subdirectory called WinPHPApp. Change to that directory:
[block:code]
{
  "codes": [
    {
      "code": "$ cd WinPHPApp",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "The Distelli Manifest"
}
[/block]
The key to a successful deploy is the Distelli Manifest file distelli-manifest.yml. Using your favorite editor, open the distelli-manifest.yml file that was cloned into the WinPHPApp directory.
[block:code]
{
  "codes": [
    {
      "code": "  <username>/WinPHPApp:\n    Env:\n      - PORT: \"8006\"\n    PkgInclude:\n      - simpleapp.php\n    Exec:\n      - php -S 0.0.0.0:%PORT% simpleapp.php\n",
      "language": "text"
    }
  ]
}
[/block]
On the first line, change the <username> to your Distelli username. This is not your Distelli email, but your Distelli username. If you need help [Finding Your Distelli Username](doc:finding-your-distelli-username).

For example if your username is **johndoe**, the first line of the manifest file should be:
[block:code]
{
  "codes": [
    {
      "code": "johndoe/WinPHPApp:",
      "language": "text"
    }
  ]
}
[/block]
The suffix on the first line indicates your application name. In this scenario, the application name is WinPHPApp. 

To understand the rest of the manifest, let’s start at the bottom:
[block:code]
{
  "codes": [
    {
      "code": "Exec:",
      "language": "text"
    }
  ]
}
[/block]
This is the Exec section of the manifest which executes the process that is monitored by Distelli to ensure uptime. If this process ends, Distelli attempts to restart it. For info on the Exec section see the [Distelli Manifest Reference Guide](doc:distelli-manifest#exec) 
[block:code]
{
  "codes": [
    {
      "code": "    php -S 0.0.0.0:%PORT% simpleapp.php",
      "language": "text"
    }
  ]
}
[/block]
The above command will start a php simple web server listening on the TCP port identified by the environment variable PORT; and serve the content from simpleapp.php.
[block:code]
{
  "codes": [
    {
      "code": "    PkgInclude:\n  - simpleapp.php",
      "language": "text"
    }
  ]
}
[/block]
The above section tells Distelli which file(s) to include in the bundle when bundling the release and deploying. Here we are including the simpleapp.php file from the WinPHPApp directory. This is the only file needed.
[block:code]
{
  "codes": [
    {
      "code": "Env:\n  - PORT: \"8006\"",
      "language": "text"
    }
  ]
}
[/block]
Finally the Env: section of the manifest is where you set environment variables. In this example we are setting the PORT variable to 8006. This will be used when the simple PHP web server starts-up. It will listen on TCP port 8006.

Now that you have changed the first line and had a chance to look over the manifest, ensure you **save your changes**.
[block:api-header]
{
  "type": "basic",
  "title": "Distelli Create and Push"
}
[/block]
Next you will create a release of your application in your Distelli account. On the computer that you cloned the git repository, make sure you are in the WinPHPApp directory and enter the following command:
[block:code]
{
  "codes": [
    {
      "code": "$ distelli create <username>/WinPHPApp",
      "language": "text"
    }
  ]
}
[/block]
Remember to change <username> to your Distelli Username (not your Distelli email).

Next, push the software release up to your Distelli Account with the following:
[block:code]
{
  "codes": [
    {
      "code": "$ distelli push -m \"First Push\"",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Distelli WebUI"
}
[/block]
Next you will use the Distelli WebUI to create an environment and add your Windows server to the environment in preparation for the deploy.

1. Login to the Distelli WebUI at [http://www.distelli.com/login](http://www.distelli.com/login). 
2. Search for the newly created application WinPHPApp in the list of Applications and click on the application name when you find it.
3. Now click the **Environments** link on the top. 
4. Click the **Create Environment** link.
5. Give the new environment the **Name** WinPHP_Env.
6. Click **Create Environment**.

You have just created an environment for the WinPHPApp application. In the next step you will add 1 or more servers to this environment for doing a deploy. This will be the Windows server that you previously installed the Distelli Agent on. 

7. Click the Environment **Servers** link under the Environment WInPHP_Env
8. On the resulting page click the **Add Servers** link.

In the list you should find the Windows Server that you installed the Agent on early with a **Healthy** status.

9. Check the **Add Server** checkbox.
10. Click **Add Selected Servers** link.
[block:api-header]
{
  "type": "basic",
  "title": "Distelli Deploy"
}
[/block]
You now have your Windows server in the WinPHP_Env environment. This environment is attached to the application WinPHPApp.  At this point you are ready to deploy your “First Push” release of the WinPHPApp application to the environment WinPHP_Env.

While still looking at the WinPHP_Env UI Page, click the Details icon.
Click the Deploy button for the v1 First Push release
In the resulting dialog, click the Deploy button

While the deploy is occurring you can watch the logs. Viewing the logs can be helpful in troubleshooting a failed deploy. Also see the troubleshooting guide here.
[block:api-header]
{
  "type": "basic",
  "title": "Validation"
}
[/block]
When the deploy has successfully completed you can validate the PHP simple web server is up and running by browsing to your server on port 8006:

http://SERVER_IP:8006

By default the Windows firewall will block access to this service. The following commands will open up TCP Port 8006 on the Windows server firewall. Note, you many need to run these as Administrator.

netsh advfirewall firewall add rule name="TCP Port 8006" dir=in action=allow protocol=TCP localport=8006
    netsh advfirewall firewall add rule name="TCP Port 8006" dir=out action=allow protocol=TCP localport=8006

Realize these firewall changes could be done as part of the Distelli Manifest during deploy.
[block:api-header]
{
  "type": "basic",
  "title": "Part 2 - Installing the Server Prerequisites on Deploy"
}
[/block]
Now that you have walked through the process and have seen how to provision the destination Windows server; bundle, push, and deploy your software; and how the Distelli Manifest works Let’s look at an example where all the dependencies are built during the Distelli deploy.

A summation of the prerequisite steps:
1. Download the Visual C++ Redistributable
  a. Unfortunately there is no direct link to download this, so in this scenario I will download the executable and include it in the Distelli manifest PkgInclude bundle during deploy.
2. Install the Visual C++ Redistributable
  a. I want this to install silently so I will use the appropriate options.
3. Install PHP 5.4+
  a. This file downloads in .zip format so I will need an unzip utility to unzip it
4. Download an unzip utility
5. Unzip and extract the PHP 5.4 files
6. And finally, execute the process

To see the solution, let’s jump directly into the distelli-manifest.yml that makes this possible:
[block:code]
{
  "codes": [
    {
      "code": "<username>/WinPHPPApp:\n  Env:\n    - PORT: 8006\n    - PHPDIR: c:\\php\n  PreInstall:\n    - echo \"Begin PreInstall\"\n    - echo \"Download zip utility\"\n    - powershell -Command (new-object System.Net.WebClient).DownloadFile('https://s3.amazonaws.com/download.distelli.com/7za.exe','7za.exe')\n    - echo \"Download php5 for windows\"\n    - powershell -Command (new-object System.Net.WebClient).DownloadFile('http://windows.php.net/downloads/releases/archives/php-5.6.8-Win32-VC11-x64.zip,'php.zip')\n    - echo \"Done PreInstall\"\n  PostInstall:\n    - echo \"Begin PostInstall\"\n    - echo \"Install MS Visual C++ Redistributable\"\n    - vcredist_x64 /install /quiet /norestart\n    - echo \"Install PHP 5\"\n    - mkdir %PHPDIR%\n    - 7za x php.zip -o%PHPDIR%\n    - echo \"Opening Firewall for Port %PORT%\"\n    - netsh advfirewall firewall add rule name=\"TCP Port %PORT%\" dir=in action=allow protocol=TCP localport=%PORT%\n    - netsh advfirewall firewall add rule name=\"TCP Port %PORT%\" dir=out action=allow protocol=TCP localport=%PORT%\n    - echo \"Done PostInstall\"\n  PkgInclude:\n    - simpleapp.php\n    - vcredist_x64.exe\n  Exec:\n    - '%PHPDIR%\\php.exe -S 0.0.0.0:%PORT% simpleapp.php'",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Clone the New Application"
}
[/block]
Enter the following to go up one directory:
[block:code]
{
  "codes": [
    {
      "code": "$ cd ..",
      "language": "text"
    }
  ]
}
[/block]
Now, using git, clone the new sample application from Distelli’s public repository with the following:
[block:code]
{
  "codes": [
    {
      "code": "$ git clone https://github.com/Distelli/WinPHPPapp.git",
      "language": "text"
    }
  ]
}
[/block]
 and change to the new directory. Please note the extra “P” and lower case “a” in the name!
[block:code]
{
  "codes": [
    {
      "code": "$ cd WinPHPPapp",
      "language": "text"
    }
  ]
}
[/block]
Now open the new distelli-manifest.yml file with your favorite editor.
[block:api-header]
{
  "type": "basic",
  "title": "Manifest Analysis"
}
[/block]
Let’s look at the newly added commands in the Distelli Manifest.

**Env:** - In this section I have added a variable to describe where PHP is to be installed:
[block:code]
{
  "codes": [
    {
      "code": "    PHPDIR: c:\\php",
      "language": "yaml"
    }
  ]
}
[/block]
**PreInstall:** - I added 2 powershell commands. One to download a zip utility and the other to download the PHP application:
[block:code]
{
  "codes": [
    {
      "code": "echo \"Download zip utility\"\npowershell -Command (new-object System.Net.WebClient).DownloadFile('https://s3.amazonaws.com/download.distelli.com/7za.exe','7za.exe')\n\necho \"Download php5 for windows\"\npowershell -Command (new-object System.Net.WebClient).DownloadFile('http://windows.php.net/downloads/releases/archives/php-5.6.8-Win32-VC11-x64.zip,'php.zip')",
      "language": "text"
    }
  ]
}
[/block]
**PostInstall:** - Most of the prerequisite install work is being done in this section. The reason these steps are in PostInstall is because the application release bundle isn’t downloaded until the Install step, which is after PreInstall and before PostInstall. For more information on this see the [Distelli Manifest Reference Guide](doc:distelli-manifest) 

Let’s break down the details:
[block:code]
{
  "codes": [
    {
      "code": "echo \"Install MS Visual C++ Redistributable\"\nvcredist_x64 /install /quiet /norestart",
      "language": "text"
    }
  ]
}
[/block]
Since the Visual C++ Redistributable does not have a single download link that can be consistently used, I downloaded a copy into the WinPHPPapp application directory and included it in my PkgInclude. This means the file will be bundled and pushed to my account on Distelli and copied to the destination Windows server during the Install process. As you can see I am running the Visual C++ Redistributable install process silently with no reboot.
[block:code]
{
  "codes": [
    {
      "code": "echo \"Install PHP 5\"\nmkdir %PHPDIR%\n7za x php.zip -o%PHPDIR%",
      "language": "text"
    }
  ]
}
[/block]
In the above step I am installing PHP by creating the PHP directory based on the environment variable PHPDIR. And then unzipping the PreInstall downloaded php.zip contents into the PHPDIR directory.
[block:code]
{
  "codes": [
    {
      "code": "echo \"Opening Firewall for Port %PORT%\"\nnetsh advfirewall firewall add rule name=\"TCP Port %PORT%\" dir=in action=allow protocol=TCP localport=%PORT%\nnetsh advfirewall firewall add rule name=\"TCP Port %PORT%\" dir=out action=allow protocol=TCP localport=%PORT%",
      "language": "text"
    }
  ]
}
[/block]
And the last step in the PostInstall section is to open up the necessary TCP Port in the firewall, as shown above.

**PkgInclude:** - As noted earlier, I included the Visual C++ Redistributable in my application bundle. So now when my application is downloaded during a deploy it includes these two files:
[block:code]
{
  "codes": [
    {
      "code": "simpleapp.php\nvcredist_x64.exe",
      "language": "text"
    }
  ]
}
[/block]
**Exec:** - Is the actual execution section. Of note, when deploying to windows, the Exec: section of the manifest should only have one command execution entry, and it must be the last line of the Exec: section.
[block:code]
{
  "codes": [
    {
      "code": "'%PHPDIR%\\php.exe -S 0.0.0.0:%PORT% simpleapp.php'",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Prepare for Deploy"
}
[/block]
Now you will need to complete the following steps to deploy this solution:
1. Ensure the Distelli Agent is installed on your destination Windows server.
2. Edit the distelli-manifest.yml and change <username> to your Distelli Username.
3. Using the Distelli CLI create the application.
    `distelli create <username>/WinPHPPapp`
4. Using the Distelli CLI push the application up to your account.
    `distelli push -m “A Push Message”`
5. Using the Distelli Web UI create an environment for the application.
6. Using the Distelli Web UI add the destination Windows server to the environment.
7. Kick off the deploy

Note: This manifest expects the destination Windows server is “clean” and has no c:\php directory. And that there is no process using TCP Port 8006. Hopefully you noted, this could be resolved by changing the Environment variables in the manifest.
[block:callout]
{
  "type": "warning",
  "body": "Remember, if you change the manifest you have to push a new release of the application up to your Distelli account before deploying."
}
[/block]
Good luck, and we are here to help.
[block:api-header]
{
  "type": "basic",
  "title": "Troubleshooting"
}
[/block]
For information on troubleshooting deployments, see [Troubleshooting Deploys](doc:troubleshooting-deploys).Good luck, and we are here to help.
[block:api-header]
{
  "type": "basic",
  "title": "Need Help?"
}
[/block]
* [Tutorials Index](doc:tutorials-index)
* [Manifest Library of Examples](doc:distelli-manifest-library-of-examples)
* Read the Knowledge Base articles
* Check out the Reference Guides

We're always available to help. Contact [support](http://www.distelli.com/support).