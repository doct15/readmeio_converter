---
title: "IIS .net Application on Windows"
excerpt: ""
---
In this tutorial I will explore deploying a .NET application to a Windows IIS Server using Distelli.

This tutorial assumes you have experience working with:
* [Distelli CLI](doc:distelli-cli)
* [Distelli Agent](doc:distelli-agent) , and doing deploys with Distelli. You can learn more about Distelli [here](doc:getting-started).

This tutorial will use the BlogEngine.NET code available [here](http://blogengine.codeplex.com/).
 
[block:callout]
{
  "type": "info",
  "body": "This has been tested with Windows Server 2012."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Preparing the Application"
}
[/block]
The following instructions are all executed from the same command (cmd) shell prompt.

1. To get started create a directory for building your application.
[block:code]
{
  "codes": [
    {
      "code": "$ mkdir WinIISBlog",
      "language": "text"
    }
  ]
}
[/block]
2. Change to the directory just created.
[block:code]
{
  "codes": [
    {
      "code": "$ cd WinIISBlog",
      "language": "text"
    }
  ]
}
[/block]
3. Download the BlogEngine.NET (Web) code into this new directory. You can get the code [here](http://blogengine.codeplex.com/downloads/get/910931).

Now you will need to create the deploy instructions for Distelli. This is done with the distelli-manifest.yml file.

4. In the WinIISBlog directory create the file `distelli-manifest.yml`.
5. Copy and Paste the following into the `distelli-manifest.yml` file.
[block:code]
{
  "codes": [
    {
      "code": "<username>/WinIISBlog:\n  PkgInclude:\n    - '*.zip'\n  Env:\n    # Define the TCP port you want the IIS application to listen on\n    - PORT: enter_value_here\n    # Define the Name for the IIS application\n    - SITE: enter_sitename_here\n    # Define the Directory full path where the IIS application should reside\n    - APPDIR: enter_directory_here\n  PreInstall:\n    - echo \"Begin PreInstall\"\n    - echo \"Install any IIS Prerequisites\"\n    - echo \"---\"\n    - echo \"Removing existing IIS Site\"\n    - echo \"---\"\n    - echo \"Create Application Directory\"\n    - echo \"---\"\n    - echo \"Creating IIS Site\"\n    - echo \"---\"\n    - echo \"Done PreInstall\"\n  PostInstall:\n    - echo \"Begin PostInstall\"\n    - echo \"Unzip BlogEngine.NET to Application Directory\"\n    - echo \"---\"\n    - echo \"Set Directory Attributes\"\n    - echo \"---\"\n    - echo \"Done PostInstall\"\n  Start:\n    - echo \"Begin Start\"\n    - echo \"Start IIS Site\"\n    - echo \"---\"\n    - echo \"Open Firewall\"\n    - echo \"---\"\n    - echo \"Done Start\"",
      "language": "yaml"
    }
  ]
}
[/block]
The above is a skeleton manifest file. The following will discuss what needs to be added to the various manifest sections to successfully deploy this IIS application.
[block:api-header]
{
  "type": "basic",
  "title": "Username"
}
[/block]
First step is to change the **<username>** field to your Distelli user name. If you need assistance in finding your user name see [Finding Your Distelli Username](doc:finding-your-distelli-username).

For example if your user name is **johndoe** your manifest first line would look like this:
[block:code]
{
  "codes": [
    {
      "code": "johndoe/WinIISBlog:",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PkgInclude Section"
}
[/block]
This section defines which files make up your application that need to be deployed to the destination Windows Server. In this scenario we only need the BlogEngine.zip file. This *.zip syntax will keep all .zip files which will work.
[block:code]
{
  "codes": [
    {
      "code": "  PkgInclude:\n    - '*.zip'",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Env Section"
}
[/block]
This section is straightforward in that you are simply setting environment variables that will be used in the balance of the manifest file.
[block:code]
{
  "codes": [
    {
      "code": "  Env:\n    # Define the TCP port you want the IIS application to listen on\n    - PORT: enter_value_here\n    # Define the Name for the IIS application\n    - SITE: enter_sitename_here\n    # Define the Directory full path where the IIS application should reside\n    - APPDIR: enter_directory_here\n",
      "language": "yaml"
    }
  ]
}
[/block]
Change the values as appropriate for your environment. Here are some notes and suggestions:

# Port: 8085
Enter a TCP Port number to listen to for this application. Don't use an existing port that is being listened to. This parameter will be used when adding the Site to IIS and setting up firewall rules.

# SITE: BlogEngine
Enter a name for the IIS Site. This parameter will be used when adding the Site to IIS.

# APPDIR: c:\blog
Enter the full path to the directory where the application will be served from. This directory should not already exist. This is the directory where the BlogEngine application will be unzipped to and run from.

Here is the text with suggestions so you can copy/paste:
[block:code]
{
  "codes": [
    {
      "code": "  Env:    \n    # Define the TCP port you want the IIS application to listen on\n    - PORT: 8085\n    # Define the Name for the IIS application\n    - SITE: BlogEngine\n    # Define the Directory full path where the IIS application should reside\n    - APPDIR: c:\\blog\n\n",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PreInstall - Install any IIS Prerequisites"
}
[/block]
In my scenario, the Windows 2012 server did not have IIS, ASP, and .NET provisioned, so I chose to install these dependencies on deploy, which I was able to accomplish with the following commands:
[block:code]
{
  "codes": [
    {
      "code": "dism /enable-feature /online /featurename:IIS-WebServer /all\ndism /enable-feature /online /featureName:IIS-ASP /all\ndism /enable-feature /online /featureName:IIS-ASPNET /all\ndism /enable-feature /online /featureName:IIS-ASPNET45 /all",
      "language": "text"
    }
  ]
}
[/block]
My manifest PreInstall "Install any IIS Prerequisites" section looks like this:
[block:code]
{
  "codes": [
    {
      "code": "  PreInstall:\n    - echo \"Begin PreInstall\"\n    - echo \"Install any IIS Prerequisites\"\n    - dism /enable-feature /online /featurename:IIS-WebServer /all\n    - dism /enable-feature /online /featureName:IIS-ASP /all\n    - dism /enable-feature /online /featureName:IIS-ASPNET /all\n    - dism /enable-feature /online /featureName:IIS-ASPNET45 /all\n    - echo \"---\"",
      "language": "yaml"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "Your system may require installation of other prerequisites."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PreInstall - Removing Existing IIS Site"
}
[/block]
The syntax to create a site with IIS is:
[block:code]
{
  "codes": [
    {
      "code": "%windir%\\system32\\inetsrv\\appcmd add site",
      "language": "text"
    }
  ]
}
[/block]
The above command will fail and set %ERRORLEVEL% if the site already exists, which will cause the deploy to fail, so providing some code to check for an existing site and remove it first will be helpful.
[block:code]
{
  "codes": [
    {
      "code": "    - echo \"Removing existing IIS Site\"\n    - for /F \"tokens=*\" %%a in ('%windir%\\system32\\inetsrv\\appcmd list site %SITE%') do set RESPONSE=%%a\n    - if \"%RESPONSE%\"==\"\" (\n    -   echo \"%SITE% doesn't exist\"\n    - ) else (\n    -   echo \"%SITE% does exist. Deleting\"\n    -   (%windir%\\system32\\inetsrv\\appcmd delete site %SITE%)\n    - )\n    - echo \"---\"",
      "language": "yaml"
    }
  ]
}
[/block]
This code will check IIS to see if %SITE% exists. (Remember %SITE% is the environment variable you set in the Env: section above.) If it does exist, it will be deleted.
[block:api-header]
{
  "type": "basic",
  "title": "PreInstall - Create Application Directory"
}
[/block]
In this section you will need to create the application directory. Of note, if you try to do a "mkdir" for a directory that already exists, mkdir will set %ERRORLEVEL% which will cause the Distelli deploy to fail. You can use "IF not exist" syntax to check for the directory before creating. 

Realize that if the directory is not empty, you may encounter unknown issues.

# Approach One
[block:code]
{
  "codes": [
    {
      "code": "    - echo \"Create Application Directory\"\n    - IF not exist %APPDIR% (mkdir %APPDIR%)\n    - echo \"---\"",
      "language": "yaml"
    }
  ]
}
[/block]
Another approach may be to "quietly" remove any existing directory and all its contents before recreating. Note, "rmdir" does not set %ERRORLEVEL% if the directory doesn't exist so it's safe.

# Approach Two
[block:code]
{
  "codes": [
    {
      "code": "    - echo \"Create Application Directory\"\n    - rmdir /S/Q %APPDIR%\n    - mkdir %APPDIR% \n    - echo \"---\"",
      "language": "yaml"
    }
  ]
}
[/block]
Realize the above depicts two different approaches and they shouldn't be used together. I prefer the latter as it ensures the directory is empty.
[block:api-header]
{
  "type": "basic",
  "title": "PreInstall - Creating IIS Site"
}
[/block]
Ultimately , after ensuring the site doesn't exist and the application directory is empty, the IIS site will need to be created with the following syntax:
[block:code]
{
  "codes": [
    {
      "code": "    - echo \"Creating site %SITE%\"\n    - (%windir%\\system32\\inetsrv\\appcmd add site /name:%SITE% /physicalPath:%APPDIR% /bindings:http://*:%PORT%)\n    - echo \"---\"",
      "language": "yaml"
    }
  ]
}
[/block]
This ends the PreInstall section of the manifest.
[block:api-header]
{
  "type": "basic",
  "title": "PostInstall - Unzip BlogEnbing.NET to Application Directory"
}
[/block]
Between the PreInstall and PostInstall phases, the Distelli deploy does the "Install" phase where the application release bundle is downloaded to the destination Windows Server. This means that the BlogEngine.zip file is available, on the disk, in the PostInstall section. This file can be found in the %DISTELLI_INSTALLHOME% directory. For more information on Distelli System Environment variables see [Environment Variables Reference Guide](doc:environment-variables).

You can use powershell to unzip the contents of the BlogEngine.zip file with one of the following syntax:

# For Powershell ver 2
[block:code]
{
  "codes": [
    {
      "code": "PowerShell (New-Object -COM Shell.Application).NameSpace('\"%APPDIR%\"').CopyHere((New-Object -COM Shell.Application).NameSpace('\"%DISTELLI_INSTALLHOME%\\ZIPFILE.zip\"').Items(), 16);",
      "language": "text"
    }
  ]
}
[/block]
# For Powershell ver 3
[block:code]
{
  "codes": [
    {
      "code": "powershell add-type -assemblyname \"system.io.compression.filesystem\" ; [System.io.compression.zipfile]::ExtractToDirectory('\"%DISTELLI_INSTALLHOME%\\ZIPFILE.zip\"','\"%APPDIR%\"')",
      "language": "text"
    }
  ]
}
[/block]
For this section the manifest syntax is:
[block:code]
{
  "codes": [
    {
      "code": "  PostInstall:\n    - echo \"Begin PostInstall\"\n    - echo \"Unzip BlogEngine.NET to Application Directory\"\n    # Using Powershell version 2\n    #- PowerShell (New-Object -COM Shell.Application).NameSpace('\"%APPDIR%\"').CopyHere((New-Object -COM Shell.Application).NameSpace('\"%DIStELLI_INSTALLHOME%\\BlogEngine.NET 3.1 (web).zip\"').Items(), 1564);\n    # Using Powershell version 3+\n    - powershell add-type -assemblyname \"system.io.compression.filesystem\" ; [System.io.compression.zipfile]::ExtractToDirectory('\"%DIStELLI_INSTALLHOME%\\BlogEngine.NET 3.1 (web).zip\"','\"%APPDIR%\"')\n    - echo \"---\"",
      "language": "yaml"
    }
  ]
}
[/block]
Unremark the syntax that is appropriate for your version of Powershell on your destination Windows Server.

To see another method of unzipping deployed files, on windows, look at the example tutorial [PHP on Windows Tutorial](doc:php-on-windows-tutorial).
[block:api-header]
{
  "type": "basic",
  "title": "PostInstall - Set Directory Attributes"
}
[/block]
According to the install instructions for BlogEngine.NET, found [here](http://blogengine.codeplex.com/wikipage?title=Installation&referringTitle=Documentation&ANCHOR#FreshInstallation); the App_Data directory must have permissions set for the IIS User to read and write data. This can be accomplished in the PostInstall section after the files are unzipped to the disk.

[block:code]
{
  "codes": [
    {
      "code": "    - echo \"Set Directory Attributes\"\n    - attrib -r %APPDIR%\\App_Data /s /d\n    - icacls \"%APPDIR%\\App_Data\" /grant IIS_IUSRS:(OI)(CI)F /t\n    - icacls \"%APPDIR%\\App_Data\" /grant IUSR:(OI)(CI)F /t\n    - echo \"---\"",
      "language": "yaml"
    }
  ]
}
[/block]
And this completes the PostInstall section.
[block:api-header]
{
  "type": "basic",
  "title": "Start - Start IIS Site"
}
[/block]
This section will ensure the IIS Site %SITE% is started using the following syntax:
[block:code]
{
  "codes": [
    {
      "code": "    - echo \"Start IIS Site\"\n    - (%windir%\\system32\\inetsrv\\appcmd start site %SITE%)\n    - echo \"---\"",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Start - Open Firewall"
}
[/block]
By default, the Windows firewall is enabled and will block traffic destined to the newly added IIS Site. You can setup rules to allow access to the IIS Site based on the TCP Port number %PORT%.

I found that you can redundantly add the same firewall rule multiple times, so to keep things clean, and avoid a deploy failure, I wanted to ensure rules were being deleted before adding. Before deleting I actually add the rule to avoid getting an error.
[block:code]
{
  "codes": [
    {
      "code": "    - echo \"Open Firewall\"\n    - set FWNAME=\"%SITE% fw rule TCP Port %PORT%\"\n    - echo \"Adding %FWNAME%\"\n    - netsh advfirewall firewall add rule name=%FWNAME% dir=in action=allow protocol=TCP localport=%PORT%\n    - netsh advfirewall firewall delete rule name=%FWNAME%\n    - netsh advfirewall firewall add rule name=%FWNAME% dir=in action=allow protocol=TCP localport=%PORT%\n    - netsh advfirewall firewall add rule name=%FWNAME% dir=out action=allow protocol=TCP localport=%PORT%\n    - echo \"---\"",
      "language": "yaml"
    }
  ]
}
[/block]
That is it for the manifest. Save your file changes and get ready to deploy this application to your Windows Server.
[block:api-header]
{
  "type": "basic",
  "title": "Steps to Deploy this Application"
}
[/block]
1. Load the Distelli Agent on your destination Windows Server where you are deploying the application to. The Distelli Agent will connect your Server to your Distelli Account so you can deploy applications to the server.

2. Distelli create - In the WinIISBlog directory, where the distelli-manifest.yml file you just created exists, run the [distelli create](doc:distelli-cli#create) command. This assume you have the [Distelli CLI](doc:distelli-cli) Installed on this system. 

Remember to replace <username> with your Distelli username.
[block:code]
{
  "codes": [
    {
      "code": "    distelli create <username>/WinIISBlog",
      "language": "text"
    }
  ]
}
[/block]
This will create the application in your Distelli Account. 

3. Distelli push - Push the first release of the WinIISBlog application up to your Distelli Account.
[block:code]
{
  "codes": [
    {
      "code": "    distelli push -m \"First Release\"",
      "language": "text"
    }
  ]
}
[/block]
4. With your web browser log into the Distelli WebUI at [https://www.distelli.com/login](https://www.distelli.com/login).

5. Find and click the Application name **WinIISBlog**.

6. Create an Application Environment.
  a. Click **Environments** link.
  b. Click **Create Environment** link.
  c. Enter the "Name" **WinIISBlog_Env** and click **Create Environment**.

7. Add your server to the Application Environment
  a. From the WinIISBlog_Env page, which you should be on, click **Servers** link.
  b. Click the **Add Servers** link.
  c. Find your Windows Server, you installed the agent on earlier, and check the **Add Server** box.
  d. Click the **Add Selected Servers** link.

8. Deploy your First Release to the Environment
  a. Click **Details** link.
  b. In the **Release** list click the **Deploy** button for your "First Release".
  c. In the "New Deployment" dialog click the **Deploy** button.

The WinIISBlog application is now being deployed to your Windows Server in the WinIISBlog_Env environment. You can click the **View Log** button to watch the logging of the deployment phases.

Note: The PreInstall of the IIS requirements can take a "more than expected" time to complete.

If you have a failure deploying, as a suggestion, you can add more debugging by adding more echo statements to the distelli-manifest.yml. Remember that when you make changes you have to do a `distelli push -m "Message"` to update the Release in your Distelli account.
[block:api-header]
{
  "type": "basic",
  "title": "Troubleshooting"
}
[/block]
You can also refer to the [Troubleshooting Deploys](doc:troubleshooting-deploys).
[block:api-header]
{
  "type": "basic",
  "title": "The Complete Manifest"
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "<username>/WinIISBlog:\n  PkgInclude:\n    - '*.zip'\n  Env:\n    # Define the TCP port you want the IIS application to listen on\n    - PORT: 8085\n    # Define the Name for the IIS application\n    - SITE: BlogEngine\n    # Define the Directory full path where the IIS application should reside\n    - APPDIR: c:\\blog\n  PreInstall:\n    - echo \"Begin PreInstall\"\n    - echo \"Install any IIS Prerequisites\"\n    - dism /enable-feature /online /featurename:IIS-WebServer /all\n    - dism /enable-feature /online /featureName:IIS-ASP /all\n    - dism /enable-feature /online /featureName:IIS-ASPNET /all\n    - dism /enable-feature /online /featureName:IIS-ASPNET45 /all\n    - echo \"---\"\n    - echo \"Removing existing IIS Site\"\n    - for /F \"tokens=*\" %%a in ('%windir%\\system32\\inetsrv\\appcmd list site %SITE%') do set RESPONSE=%%a\n    - if \"%RESPONSE%\"==\"\" (\n    -   echo \"%SITE% doesn't exist\"\n    - ) else (\n    -   echo \"%SITE% does exist. Deleting\"\n    -   (%windir%\\system32\\inetsrv\\appcmd delete site %SITE%)\n    - )\n    - echo \"Create Application Directory\"\n    - rmdir /S/Q %APPDIR%\n    - mkdir %APPDIR%\n    - echo \"---\"\n    - echo \"Creating IIS Site\"\n    - (%windir%\\system32\\inetsrv\\appcmd add site /name:%SITE% /physicalPath:%APPDIR% /bindings:http://*:%PORT%)\n    - echo \"---\"\n    - echo \"Done PreInstall\"\n  PostInstall:\n    - echo \"Begin PostInstall\"\n    - echo \"Unzip BlogEngine.NET to Application Directory\"\n    # Using Powershell version 2\n    #- PowerShell (New-Object -COM Shell.Application).NameSpace('\"%APPDIR%\"').CopyHere((New-Object -COM Shell.Application).NameSpace('\"%DIStELLI_INSTALLHOME%\\BlogEngine.NET 3.1 (web).zip\"').Items(), 1564);\n    # Using Powershell version 3+\n    - powershell add-type -assemblyname \"system.io.compression.filesystem\" ; [System.io.compression.zipfile]::ExtractToDirectory('\"%DIStELLI_INSTALLHOME%\\BlogEngine.NET 3.1 (web).zip\"','\"%APPDIR%\"')\n    - echo \"---\"\n    - echo \"Set Directory Attributes\"\n    - attrib -r %APPDIR%\\App_Data /s /d\n    - icacls \"%APPDIR%\\App_Data\" /grant IIS_IUSRS:(OI)(CI)F /t\n    - icacls \"%APPDIR%\\App_Data\" /grant IUSR:(OI)(CI)F /t\n    - echo \"---\"\n    - echo \"Done PostInstall\"\n  Start:\n    - echo \"Begin Start\"\n    - echo \"Start IIS Site\"\n    - (%windir%\\system32\\inetsrv\\appcmd start site %SITE%)\n    - echo \"---\"\n    - echo \"Open Firewall\"\n    - set FWNAME=\"%SITE% fw rule TCP Port %PORT%\"\n    - echo \"Adding %FWNAME%\"\n    - netsh advfirewall firewall add rule name=%FWNAME% dir=in action=allow protocol=TCP localport=%PORT%\n    - netsh advfirewall firewall delete rule name=%FWNAME%\n    - netsh advfirewall firewall add rule name=%FWNAME% dir=in action=allow protocol=TCP localport=%PORT%\n    - netsh advfirewall firewall add rule name=%FWNAME% dir=out action=allow protocol=TCP localport=%PORT%\n    - echo \"---\"\n    - echo \"Done Start\"",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Need Help?"
}
[/block]
* [Installing Dependencies in PreInstall](doc:installing-dependencies) 
* [Tutorials Index](doc:tutorials-index)
* [Manifest Library of Examples](doc:distelli-manifest-library-of-examples)
* Read the Knowledge Base articles
* Check out the Reference Guides

We're always available to help. Contact [support](http://www.distelli.com/support).