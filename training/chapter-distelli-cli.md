---
title: "Chapter - Distelli CLI"
excerpt: ""
---
The Distelli Command Line Interface (CLI) tool allows you to create, bundle, push, and deploy your applications.
[block:api-header]
{
  "type": "basic",
  "title": "Distelli CLI"
}
[/block]
The Distelli Command Line Interface (CLI) tool is used to:
  * Create new applications in Distelli.
  * Push a new release of an application up to Distelli.
  * Deploy an application to an environment.
  * Automate Distelli functionality.

To create, push, and deploy application releases, the Distelli CLI requires some instructions in the form of a distelli-manifest.yml file. Here is an example:
[block:code]
{
  "codes": [
    {
      "code": "trainingstudent#/SimpleApp:\n\n  Env:\n    - EXAMPLE: '\"This is an example manifest environment variable.\"'\n    \n  PkgInclude:\n    - application.sh\n    \n  Exec:\n    - './application.sh'",
      "language": "yaml"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "The distelli-manifest.yml file is in YAML format and keeping the exact same spaces , not tabs, indentation is critical. For more information on this format, see [http://www.yaml.org/](http://www.yaml.org/)."
}
[/block]
There will be more information on the distelli-manifest.yml later in the course.
[block:api-header]
{
  "type": "basic",
  "title": "Lab 4.1 - Linux and MAC OS X - Validate Python Version"
}
[/block]
Before you can install the Distelli CLI on a Linux or MAC OS X system, you must first have **python version 2.6** or greater installed.

1. Validate installed version of python.
[block:code]
{
  "codes": [
    {
      "code": "python -V",
      "language": "text"
    }
  ]
}
[/block]
Example session
[block:code]
{
  "codes": [
    {
      "code": "Laptop:~$ python -v\nPython 2.7.6\nLaptop:~$",
      "language": "shell"
    }
  ]
}
[/block]
2. If the version is < 2.6 or is not installed, install from https://www.python.org/downloads/ (not necessary if laptop is Windows).
[block:api-header]
{
  "type": "basic",
  "title": "Lab 4.2 - Install Distelli CLI"
}
[/block]
# Windows
1. Install the Distelli CLI from the appropriate link below:

### 32bit
[Windows 32 bit installer](https://www.distelli.com/download/win32/Distelli-1.88-x86.msi)
### 64bit
[Windows 64 bit installer](https://www.distelli.com/download/win64/Distelli-1.88-x64.msi) 

# MAC OS X
1. Install the Distelli CLI from the link below:
 
### Installer
[MAC OS X installer](https://www.distelli.com/download/mac/DistelliCLI-1.88.pkg) 

# Linux
1. Install the Distelli CLI with one of the following commands:

### wget
[block:code]
{
  "codes": [
    {
      "code": "wget -qO- https://www.distelli.com/download/cli/setup | sh",
      "language": "text"
    }
  ]
}
[/block]
### curl
[block:code]
{
  "codes": [
    {
      "code": "curl -sSL https://www.distelli.com/download/cli/setup | sh",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Lab 4.3 - Validate Distelli CLI Install"
}
[/block]
To ensure the CLI is installed and working as expected you will use the CLI to login to your Distelli account.

1. Login to Distelli with the Distelli CLI using the `distelli login` command.
[block:callout]
{
  "type": "warning",
  "body": "If you are using Windows you will have to open a command (cmd) prompt."
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "Remember to use your student # (number) for training+student#@distelli.com email."
}
[/block]
Here is an example session:
[block:code]
{
  "codes": [
    {
      "code": "Laptop:~$ distelli login\n\nEmail: training+student#@distelli.com\nPassword:\nLaptop:~$",
      "language": "text"
    }
  ]
}
[/block]
You have validated the CLI is installed and working as expected.
[block:api-header]
{
  "type": "basic",
  "title": "Understanding `distelli create`"
}
[/block]
Create a new application in a Distelli account.

# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "distelli create <username>/<appname>",
      "language": "text"
    }
  ]
}
[/block]
# OPTIONS

There are no options.

# USAGE

Creating an application with `distelli create` will create an empty application in a Distelli account.

# EXAMPLES

Creating an application called "SimpleApp" in account "trainingstudent9".
[block:code]
{
  "codes": [
    {
      "code": "$ distelli create trainingstudent9/SimpleApp\n    Creating App: trainingstudent9/SimpleApp\n    App trainingstudent9/SimpleApp created successfully",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Understanding `distelli push`"
}
[/block]
Bundle a release of your application and push it to a Distelli account.
[block:callout]
{
  "type": "warning",
  "body": "If you have configured an S3 bucket in Distelli, a bundle of the application release will be pushed to your S3 bucket."
}
[/block]
# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "distelli push [-f|--manifest <manifest-filename>] [-m|--message <description>] [-r|--release-notes]",
      "language": "text"
    }
  ]
}
[/block]
# OPTIONS
[block:code]
{
  "codes": [
    {
      "code": "-f|--manifest <manifest-filename>",
      "language": "text"
    }
  ]
}
[/block]
This option will use the specified manifest file when bundling and pushing the release. If this option is not supplied the CLI uses distelli-manifest.yml in the current directory.
[block:code]
{
  "codes": [
    {
      "code": "-m|--message <description>",
      "language": "text"
    }
  ]
}
[/block]
Provides a message for this release.
[block:code]
{
  "codes": [
    {
      "code": "-r|--release-notes",
      "language": "text"
    }
  ]
}
[/block]
This option will prompt the user for a multi-line input of text that will be used as the "release notes" in the WebUI.

# USAGE

Use the `distelli push` command to bundle and upload your release for potential future deployments.

# EXAMPLES

Push the current local directory application up to your Distelli account which has an S3 bucket configured. Also include a message "First Release".
[block:code]
{
  "codes": [
    {
      "code": "$ distelli push -m \"First Release\"\n    Packaged 1 files in 1 directories\n    Pushing App: SimpleApp\n    Uploading Bundle to S3: [==========] 100%\n    Creating Release... DONE",
      "language": "text"
    }
  ]
}
[/block]
Push the local directory application up to your Distelli account with a release note.
[block:code]
{
  "codes": [
    {
      "code": "distelli push -r\nEnter Release Notes (Ctrl-D to Finish):\n\nThis release fixes issues found in the following bugs:\n* Bug #4373\n* Bug #4201\n* Bug #3293\n\n    Packaged 1 files in 1 directories\n    Pushing App: SimpleApp\n    Uploading Bundle: [=========] 100%\n    \n    Creating Release... DONE\n    Uploading Release Notes... DONE",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Lab 4.4 - Creating the Application in Distelli"
}
[/block]
In this lab you will create the application in your Distelli account.
[block:api-header]
{
  "type": "basic",
  "title": "Training Table of Contents"
}
[/block]
[TOC](doc:toc)