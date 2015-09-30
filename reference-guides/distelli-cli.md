---
title: "Distelli CLI"
excerpt: ""
---
The Distelli CLI (Command Line Tool) allows you to create, bundle, push, and deploy your applications.

To install the CLI on your system follow the instructions [Installing the CLI](doc:installing-the-cli) 

[block:api-header]
{
  "type": "basic",
  "title": "Contents"
}
[/block]
[Installing the CLI](#installing-the-cli)
[Upgrading the CLI](#upgrading-the-cli)
[CLI Command Reference](#cli-command-reference)
[block:api-header]
{
  "type": "basic",
  "title": "Installing the CLI"
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "MAC OS X"
}
[/block]
Download and run the [MAC OS X installer here.](https://www.distelli.com/download/mac/DistelliCLI-1.88.pkg) 
[block:api-header]
{
  "type": "basic",
  "title": "Linux"
}
[/block]
To install on Linux you can use either curl **or** wget with one of the following syntaxes.

##wget example
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

##curl example
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
  "title": "Windows"
}
[/block]
Download and run the Windows installer for your version of Windows

[Windows 32 bit installer](https://www.distelli.com/download/win32/Distelli-1.88-x86.msi)
[Windows 64 bit installer](https://www.distelli.com/download/win64/Distelli-1.88-x64.msi) 
[block:api-header]
{
  "type": "basic",
  "title": "Login and Validate"
}
[/block]
To complete, and validate, the CLI installation; issue a `distelli login` command to login to your Distelli Account.
[block:callout]
{
  "type": "warning",
  "body": "This requires that you have already completed the [Creating an Account](doc:creating-an-account) steps."
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "# distelli login\n\nEmail: jdoe@distelli.com\nPassword:",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Upgrading the CLI"
}
[/block]
To upgrade the Distelli CLI, simply re-install the CLI on top of the existing CLI. This will perform an upgrade.
[block:api-header]
{
  "type": "basic",
  "title": "CLI Command Reference"
}
[/block]
The following is an alphabetical listing of the Distelli CLI commands.

[bundle](#bundle)
[create](#create)
[debug](#debug)
[deploy](#deploy)
[help](#help)
[list](#list)
[login](#login)
[logout](#logout)
[push](#push) 
[block:api-header]
{
  "type": "basic",
  "title": "bundle"
}
[/block]
Locally bundle a release of an application.

# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "distelli bundle [-f|--manifest <manifest-filename>] [-o|--output-file <output-file>] [-b <build-dir>]",
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
      "code": "-b <build-dir>",
      "language": "text"
    }
  ]
}
[/block]
This option will create the bundle and saves it in the path specified. If this option is omitted, the bundle is stored in the ./.distelli/pkgbuild directory.
[block:code]
{
  "codes": [
    {
      "code": "-f | --manifest <manifest-filename>",
      "language": "text"
    }
  ]
}
[/block]
This option will use the specified manifest file when bundling the release. If this option is not supplied the bundle command uses distelli-manifest.yml in the current directory.
[block:code]
{
  "codes": [
    {
      "code": "-o | --output-file <output-filename>",
      "language": "text"
    }
  ]
}
[/block]

This option will create the bundle and save it to the path and filename specified. This option overrides the `-b <build-dir>` option.

# USAGE

By default, with no options, this command will look in the local ./distelli-manifest.yml file at the PkgInclude and PkgExclude section to determine which files, if any, will be bundled.
These files will be tar'd and gzip'd and saved locally to ./.distelli/pkgbuild with the following naming convention:
[block:code]
{
  "codes": [
    {
      "code": "APPNAME-YYYY-MM-DD-HH-MM-SS-MD5SUM.tar.gz",
      "language": "text"
    }
  ]
}
[/block]
* APPNAME - The Distelli application name
* YYYY - The full year
* MM - The month
* DD - The date
* HH - The hour
* MM - The minute
* SS - The second
* MD5SUM - The MD5 checksum of the files contents
* tar - The files are tar'd
* gz - The file is compressed using gzip

# EXAMPLES

Doing  a simple bundle
[block:code]
{
  "codes": [
    {
      "code": "$ distelli bundle\n\n    Packaging App: SimpleApp\n    Packaged 2 files in 2 directories\n    \n    Packaged: ./.distelli/pkgbuild/SimpleApp-2015-07-02-00-21-57-d01fdbcbfca218764a037ecfdab75620.tar.gz",
      "language": "text"
    }
  ]
}
[/block]
Bundling to a different filename while using a different manifest.
[block:code]
{
  "codes": [
    {
      "code": "$ distelli bundle -o Simpleapp.tar.gz -f linux-manifest.yml\n\n    Packaging App: SimpleApp\n    Packaged 2 files in 2 directories\n\n    Packaged: Simpleapp.tar.gz\n",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "create"
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

Creating an application called "SimpleApp" in account "jdoe".
[block:code]
{
  "codes": [
    {
      "code": "$ distelli create jdoe/SimpleApp\n    Creating App: jdoe/SimpleApp\n    App jdoe/SimpleApp created successfully",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "debug"
}
[/block]
Display the debug mode or set the debug mode on|off.
[block:callout]
{
  "type": "danger",
  "body": "This command should only be used with a Distelli support team member."
}
[/block]
# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "distelli debug [on|off]",
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
      "code": "on",
      "language": "text"
    }
  ]
}
[/block]
Turn debug mode on
[block:code]
{
  "codes": [
    {
      "code": "off",
      "language": "text"
    }
  ]
}
[/block]
Turn debug mode off

# USAGE

Issuing the command with no options will display the current debug mode.

# EXAMPLES

Checking the current debug mode
[block:code]
{
  "codes": [
    {
      "code": "$ distelli debug\nDebug mode is OFF",
      "language": "text"
    }
  ]
}
[/block]

Turning debug mode on
[block:code]
{
  "codes": [
    {
      "code": "$ distelli debug on\nDebug mode ON",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "deploy"
}
[/block]
Deploy an application release to an environment.

You can either push and deploy a local release or deploy an existing release.

# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "distelli deploy -e|--env <environment> [-d|--stagger-delay <stagger-delay>] [-f|--manifest <manifest-filename>] [-m|--description <description>] [-q|--quiet] [-r|--release <release-version>] [-s|--<stagger-size>] [-y|--yes]",
      "language": "text"
    }
  ]
}
[/block]
# OPTIONS
[block:callout]
{
  "type": "danger",
  "body": "The -h|--hosts option has been deprecated. If you need to deploy to a single server, create an environment with just that one server in the environment."
}
[/block]

[block:callout]
{
  "type": "danger",
  "body": "The -e|--env option is required."
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "-e|--env <environment>",
      "language": "text"
    }
  ]
}
[/block]
The name of the application environment you want to deploy to. This option must be specified when using the `distelli deploy` command.
[block:code]
{
  "codes": [
    {
      "code": "-d|--stagger-delay <stagger-delay>",
      "language": "text"
    }
  ]
}
[/block]
This option specifies the stagger delay for the deploy. The stagger delay is the time in seconds to wait between stagger sets when deploying to multiple servers in an environment. If this option is omitted the stagger delay defaults to 60 seconds.
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
With this option the deploy will use an alternate Distelli manifest. If this option is omitted the deploy uses the local ./distelli-manifest.yml.
[block:code]
{
  "codes": [
    {
      "code": "-m|--description <description>",
      "language": "text"
    }
  ]
}
[/block]
Provide a description for this deploy.
[block:code]
{
  "codes": [
    {
      "code": "-q|--quiet",
      "language": "text"
    }
  ]
}
[/block]
This option indicates that the CLI should not monitor the deployment and exit immediately after starting the deployment.
[block:code]
{
  "codes": [
    {
      "code": "-r|--release <release-version>",
      "language": "text"
    }
  ]
}
[/block]
This option will instruct the deploy to use a specific existing application release. For more information on release id's see [Finding a Release ID](finding-a-release-id).
[block:code]
{
  "codes": [
    {
      "code": "-s|--stagger-size <stagger-size>",
      "language": "text"
    }
  ]
}
[/block]
This option specifies the stagger size for the deploy. The stagger size is the number of servers to deploy to at a time, when deploying to multiple servers in an environment. If this option is omitted the stagger size defaults to 10 servers.
[block:code]
{
  "codes": [
    {
      "code": "-y|--yes",
      "language": "text"
    }
  ]
}
[/block]
This option indicates that the CLI should not ask for confirmation and start the deployment immediately.

# USAGE

With no options besides the required -e <environment> the deploy command will look for a local ./distelli-manifest.yml and based on the information in the manifest, [bundle](#bundle) a release and [push](#push) it. The deploy will then coordinate with the Distelli SaaS to deploy this release to the specified <environment>.

# EXAMPLES

Deploy the current local application, in the ./ directory, to the environment SA_Llinux.
[block:code]
{
  "codes": [
    {
      "code": "$ distelli deploy -e SA_Linux\n\n    Starting deployment of jdoe/SimpleApp\n    to 1 Environment(s): \n\n         jdoe/SA_Linux: 2 server(s)\n\n    Release: New Release\n    Stagger Size: 10\n    Stagger Delay: 60\n\n    Ready to start Deployment\n\n    Are you sure? (Yes/NO): Yes\n    Starting Deployments...\n    Packaged 2 files in 2 directories\n    Pushing App: SimpleApp\n    Uploading Bundle: [==========] 100%\n\n    Creating Release... DONE\n    Deploying jdoe/SimpleApp to env: jdoe/SA_Linux\n\n    https://myaccount.distelli.com/deployment/29948\n    Deployment 29948 InProgress: [=         ] Servers: 0 Done, 0 In Progress, 0\n    Deployment 29948 InProgress: [ =        ] Servers: 0 Done, 0 In Progress, 0\n    Deployment 29948 Done: [=         ] Servers: 1 Done, 0 In Progress, 0 Failed\n\n    Deployment 29948 completed Successfully\n    See https://myaccount.distelli.com/deployment/29948",
      "language": "text"
    }
  ]
}
[/block]
Deploy application release version "v50" to environment "SA_Linux" and skip the CLI confirmation answering "Yes".
[block:code]
{
  "codes": [
    {
      "code": "$ distelli deploy -r v50 -e SA_Linux -y \n\n    Starting deployment of jdoe/SimpleApp\n    to 1 Environment(s): \n\n         jdoe/SA_Linux: 1 server(s)\n\n    Release: v50\n    Stagger Size: 10\n    Stagger Delay: 60\n\n    Starting Deployments...\n\n    https://myaccount.distelli.com/deployment/29952\n    Deployment 29952 InProgress: [=         ] Servers: 0 Done, 0 In Progress, 0 \n    Deployment 29952 InProgress: [ =        ] Servers: 0 Done, 0 In Progress, 0 \n        Deployment 29952 Done: [=         ] Servers: 1 Done, 0 In Progress, 0 Failed\n\n    Deployment 29952 completed Successfully\n    See https://myaccount.distelli.com/deployment/29952",
      "language": "text"
    }
  ]
}
[/block]
Deploy the current local application, in the ./ directory, to the environment "SA_Linux" and suppress the CLI monitoring .
[block:code]
{
  "codes": [
    {
      "code": "$ distelli deploy -e SA_Linux -q -y\n\n    Starting deployment of jdoe/SimpleApp\n    to 1 Environment(s): \n\n         jdoe/SA_Linux: 1 server(s)\n\n    Release: New Release\n    Stagger Size: 10\n    Stagger Delay: 60\n\n    Starting Deployments...\n    Packaged 1 files in 1 directories\n    Pushing App: SimpleApp\n    Uploading Bundle: [==========] 100%\n\n    Creating Release... DONE\n    Deploying jdoe/SimpleApp to env: jdoe/SA_Linux\n\n    Deployment 29985: Started\n    See https://myaccount.distelli.com/deployment/29985\n\n",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "help"
}
[/block]
Shows the CLI help.

# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "distelli help [<command>]",
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
      "code": "<command>",
      "language": "text"
    }
  ]
}
[/block]
Any distelli **command** you wish to receive more help for.

# USAGE

Simply issuing a `distelli help` will provide a list of commands. Doing a `distelli help <command>` will provide more help on that specific command.

# EXAMPLES

Get help.
[block:code]
{
  "codes": [
    {
      "code": "$ distelli help\nUsage: distelli COMMAND [command-specific-args]\n\nCommands (distelli help COMMAND for more details):\n\n   debug      Toggle debug mode on/off\n   logout     Logout from your distelli account\n   help       Show this help screen\n   adds3      Adds an S3 Bucket and Credentials for storing releases\n   deploy     Deploy an release pushed earlier or push and deploy a new release\n   push       Bundle your App & upload (push) a new release to your Distelli account\n   login      Login to your distelli account\n   list       List servers, apps, releases and deployments\n   create     Create a new application\n   bundle     Locally bundle an release. Do not push it to your Distelli account.\n",
      "language": "text"
    }
  ]
}
[/block]
Get help on the logout command.
[block:code]
{
  "codes": [
    {
      "code": "$ distelli help logout\n\nClear your credentials and logout from your Distelli Account\nUsage: distelli logout\n\nExample:\n\n  % distelli logout\n  Logout Successful.\n  Distelli Credentials cleared",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "list"
}
[/block]
List servers, apps (applications), deployments, environments, instances, releases, or servers in a Distelli account.

# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "distelli list <apps|deployments|environments|instances|releases|servers> [-f|--format <format>] [-n|--name <name>] [-u|--user <username>]",
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
      "code": "apps",
      "language": "text"
    }
  ]
}
[/block]
Lists the applications. Fields shown include:
* App Name
* Updated (Date)
* Deployed (Date)
* Description
[block:code]
{
  "codes": [
    {
      "code": "deployments",
      "language": "text"
    }
  ]
}
[/block]
Lists the deployments. Fields shown include:
* App Name
* Deployment ID
* Release ID
* Deployed (Date)
* Description
[block:callout]
{
  "type": "warning",
  "body": "Listing deployments requires using the -n application name option."
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "environments",
      "language": "text"
    }
  ]
}
[/block]
Lists the environments. Fields shown include:
* Name
* App Name
* Active Release
* Last Deployment (Date)
* Description
[block:code]
{
  "codes": [
    {
      "code": "instances",
      "language": "text"
    }
  ]
}
[/block]
Lists the instances. Fields shown include:
* App Name
* Server
* State
* Process Count
* Release ID
* Started (Date)

[block:callout]
{
  "type": "warning",
  "body": "Listing instances requires using the -n application name option."
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "releases",
      "language": "text"
    }
  ]
}
[/block]
Lists the releases. Fields shown include:
* App Name
* Release Id (the release version)
* Created (Date)
* Description

[block:callout]
{
  "type": "warning",
  "body": "Listing releases requires using the -n application name option."
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "servers",
      "language": "text"
    }
  ]
}
[/block]
Lists the servers. Fields shown include:
* Hostname
* Started (Date) 
[block:code]
{
  "codes": [
    {
      "code": "-f|--format",
      "language": "text"
    }
  ]
}
[/block]
Lists the items in a specified format. Supported formats are:
* `csv` = Comma separated format
* `none` = Space delimited format
[block:code]
{
  "codes": [
    {
      "code": "-n|--name",
      "language": "text"
    }
  ]
}
[/block]
This option represents application name. The following list commands require this option be included with a valid application name.
* deployments
* instances
* releases
[block:code]
{
  "codes": [
    {
      "code": "-u|--username",
      "language": "text"
    }
  ]
}
[/block]
Will let you list objects from a different Distelli account username. This requires that the user that is logged into the Distelli CLI be a member of a team for the username that is being listed.

If this option is omitted `distelli list` will list objects for the Distelli account that is currently logged into the Distelli CLI.

# USAGE

Use `distelli list` to list objects in the account that is currently logged into the Distelli CLI or an account where you are a team member.

# EXAMPLES

List servers.
[block:code]
{
  "codes": [
    {
      "code": "$ distelli list servers\n+--------------------------------------+----------------------------------------+\n| Hostname                             | Started                                |\n+--------------------------------------+----------------------------------------+\n| 093aacdc-1e12-1544-8b68-0800277a90a4 | 2015-06-09 23:20:11 UTC (22 days ago)  |\n| 0b47fb1f-a847-c440-9763-080027c8277c | 2015-07-01 23:14:47 UTC (22 hours ago) |\n| 1316f64a-f9b0-11e4-8e21-080027460893 | 2015-05-14 18:26:02 UTC (1 month ago)  |\n| 22f6a88f-55ca-1849-bbf2-080027a58651 | 2015-06-24 21:58:54 UTC (7 days ago)   |\n+--------------------------------------+----------------------------------------+\nbmcgehee@distelli-BM:~$ \n distelli list servers\n",
      "language": "text"
    }
  ]
}
[/block]
List releases for application "SimpleApp".
[block:code]
{
  "codes": [
    {
      "code": "$ distelli list releases -n BashSimpleApp\n+---------------+------------+----------------------------------------+-------------+\n| App Name      | Release Id | Created                                | Description |\n+---------------+------------+----------------------------------------+-------------+\n| BashSimpleApp | v1         | 2015-05-08 20:57:42 UTC (3 months ago) | Test1       |\n| BashSimpleApp | v2         | 2015-05-08 21:00:21 UTC (3 months ago) | Test2       |\n| BashSimpleApp | v3         | 2015-05-11 17:03:54 UTC (3 months ago) | Test3       |\n| BashSimpleApp | v4         | 2015-05-12 00:20:58 UTC (3 months ago) | Test4       |\n+---------------+------------+----------------------------------------+-------------+\n",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "login"
}
[/block]
Login (sign in) to your Distelli account.

# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "distelli login",
      "language": "text"
    }
  ]
}
[/block]
# OPTIONS

There are no options.

# USAGE

Use the `distelli login` command to connect the Distelli CLI to your distelli account. You will be prompted for your email and password.

# EXAMPLES
[block:code]
{
  "codes": [
    {
      "code": "$ distelli login\n\nEmail: doc@tavian.com\nPassword:",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "logout"
}
[/block]
Logout (sign out) of your Distelli account.

# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "distelli logout",
      "language": "text"
    }
  ]
}
[/block]
# OPTIONS

There are no options.

# USAGE

Use the `distelli logout` command to log the CLI out of your Distelli account.

# EXAMPLES
[block:code]
{
  "codes": [
    {
      "code": "$ distelli logout",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "push"
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
This option will prompt the user for a multi-line input of text that will be used as the "release notes" in the WebUI. For more information see [Viewing Release Notes](doc:viewing-release-notes).

# USAGE

Use the `distelli push` command to bundle and upload your release for potential future deployments. It is during a push that the distelli-manifest.yml [PreRelease](doc:distelli-manifest#prerelease) section is executed.

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