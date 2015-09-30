---
title: "Building an Application"
excerpt: ""
---
<div><div style="float: left;">**&lt;- go back to [Installing the CLI](doc:installing-the-cli)**</div><div style="float: right;">**go forward to [Editing the Manifest](doc:editing-the-manifest) -&gt;**</div></div>
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/AlHZM11zRyebbbfJEcIu",
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
The next step is to create, copy, or clone an application for deployment. The application you choose will be dependent on the Operating System of your Destination Server.

These steps should be completed on the **development system** where you [installed the Distelli CLI](doc:installing-the-cli). Here you will build an application to be deployed to your destination server.

For example, you can develop on Linux and deploy to a destination server that is Windows.

Follow the link below for the Operating System of your **destination server**.

[Linux or MAC OS X](#linux-or-mac-os-x-bash-application)
[Windows](#windows-batch-application)
[block:api-header]
{
  "type": "basic",
  "title": "Linux or MAC OS X Bash Application"
}
[/block]
To create the Bash application you can either [Clone from github](#linux-or-mac-os-x-clone-from-git) or [Create from Scratch](#linux-or-mac-os-x-create-from-scratch).
[block:api-header]
{
  "type": "basic",
  "title": "Linux or MAC OS X Clone from github"
}
[/block]
You can clone the example application from Distelli's public github repository using git tools. If necessary, you can <a href="http://git-scm.com/downloads" target="_blank">Download git</a>.

If you do not want to use git to clone the application, you can manually create the application by skipping down to the [Create from Scratch](#linux-or-mac-os-x-create-from-scratch) section.

1. From a terminal clone the example repository using the following command.
[block:code]
{
  "codes": [
    {
      "code": "git clone https://github.com/Distelli/SimpleBashApp.git",
      "language": "text"
    }
  ]
}
[/block]
2. Change to the newly created directory.
[block:code]
{
  "codes": [
    {
      "code": "cd SimpleBashApp",
      "language": "text"
    }
  ]
}
[/block]
3. Click here to skip ahead to [Editing the Manifest](doc:editing-the-manifest).
[block:api-header]
{
  "type": "basic",
  "title": "Linux or MAC OS X Create from Scratch"
}
[/block]
If you are not cloning from the git repository above, you can follow these instructions to create the application by hand.

1. From a terminal create a directory and change to that directory.
[block:code]
{
  "codes": [
    {
      "code": "mkdir SimpleApp\ncd SimpleApp",
      "language": "text"
    }
  ]
}
[/block]
2. Using your favorite text editor, create a file, in the SimpleApp directory, called `application.sh` and copy the contents below into that file.
[block:code]
{
  "codes": [
    {
      "code": "#!/bin/bash\n#\n# This is an example application for doing deployment validation.\n# This is a simple bash script to be deployed to either\n# * Linux Host\n# * MAC OS X Host\n#\nnodename=`uname -n`\narch=`uname -m`\ndatetime=`date +\"%u %m/%d/%Y %H:%M:%S.%N\"`\necho \"Hello World from Distelli.\"\necho \"You have successfully deployed a simple application script.\"\necho \"Server: $nodename\"\necho \"Server Architecture: $arch\"\necho \"Server Time: $datetime\"\necho \"Manifest Environment Variable: $EXAMPLE\"\necho \"\"\nsleep 10",
      "language": "shell"
    }
  ]
}
[/block]
3. Save the file application.sh.
4. Using your favorite text editor, create a file called `distelli-manifest.yml` and copy the contents below into that file.
[block:callout]
{
  "type": "danger",
  "body": "The below file is in YAML format and keeping the exact same spaces, not tabs, indentation is critical."
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "<username>/SimpleApp:\n\n  Env:\n    - EXAMPLE: '\"This is an example manifest environment variable.\"'\n    \n  PkgInclude:\n    - application.sh\n    \n  Exec:\n    - './application.sh'",
      "language": "yaml"
    }
  ]
}
[/block]
5. Save the file distelli-manifest.yml.
6. Click here to skip ahead to [Editing the Manifest](doc:editing-the-manifest).
[block:api-header]
{
  "type": "basic",
  "title": "Windows Batch Application"
}
[/block]
To create the Windows batch application you can either [Clone from github](#windows-clone-from-git) or [Create from Scratch](#windows-create-from-scratch).
[block:api-header]
{
  "type": "basic",
  "title": "Windows Clone from github"
}
[/block]
You can clone the example application from Distelli's public github repository using git tools. If necessary, you can <a href="http://git-scm.com/downloads" target="_blank">Download git</a>.

If you do not want to use git to clone the application, you can manually create the application by skipping down to the [Create from Scratch](#windows-create-from-scratch) section.

1. From a terminal clone the example repository using the following command.
[block:code]
{
  "codes": [
    {
      "code": "git clone https://github.com/Distelli/SimpleBatchApp.git",
      "language": "text"
    }
  ]
}
[/block]
2. Change to the newly created directory.
[block:code]
{
  "codes": [
    {
      "code": "cd SimpleBatchApp",
      "language": "text"
    }
  ]
}
[/block]
3. Click here to skip ahead to [Editing the Manifest](doc:editing-the-manifest).
[block:api-header]
{
  "type": "basic",
  "title": "Windows Create from Scratch"
}
[/block]
If you are not cloning from the git repository above, you can follow these instructions to create the application by hand.

1. From a terminal create a directory and change to that directory.
[block:code]
{
  "codes": [
    {
      "code": "mkdir SimpleApp\ncd SimpleApp",
      "language": "text"
    }
  ]
}
[/block]
2. Using your favorite text editor, create a file, in the SimpleApp directory, called `application.bat` and copy the contents below into that file.
[block:code]
{
  "codes": [
    {
      "code": "@echo off\nREM Windows batch file\nREM \nREM This is an example application for doing deployment validation.\nREM This is a simple batch file to be deployed to\nREM * Windows\nREM\nSET nodename=%computername%\nSET arch=%processor_architecture%\nSET datetime=\"%date% %time%\necho Hello World from Distelli.\necho You have successfully deployed a simple application script.\necho Server: %nodename%\necho Server Architecture: %arch%\necho Server Time: %datetime%\necho Manifest Environment Variable: %EXAMPLE%\necho.\npowershell -command \"Start-Sleep -s 10\"",
      "language": "shell"
    }
  ]
}
[/block]
3. Save the file application.bat.
4. Using your favorite text editor, create a file called `distelli-manifest.yml` and copy the contents below into that file.
[block:code]
{
  "codes": [
    {
      "code": "<username>/SimpleApp:\n\n  Env:\n    - EXAMPLE: 'This is an example manifest environment variable.'\n    \n  PkgInclude:\n    - application.bat\n    \n  Exec:\n    - application.bat",
      "language": "yaml"
    }
  ]
}
[/block]
5. Save the file distelli-manifest.yml.
6. Click here to skip ahead to [Editing the Manifest](doc:editing-the-manifest).
[block:api-header]
{
  "type": "basic",
  "title": "Next"
}
[/block]
You have built a simple script application that you will deploy. You must first adjust the manifest file.

To continue the Getting Started step by step guide continue on to [Editing the Manifest](doc:editing-the-manifest) 

<br>
<div><div style="float: left;">**&lt;- go back to [Installing the CLI](doc:installing-the-cli)**</div><div style="float: right;">**go forward to [Editing the Manifest](doc:editing-the-manifest) -&gt;**</div></div>