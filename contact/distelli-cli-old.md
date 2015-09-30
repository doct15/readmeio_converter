---
title: "Distelli CLI OLD"
excerpt: ""
---
The Distelli CLI is a command line tool that is installed on your desktop or laptop and makes it easy to add servers, upload your application releases and work with the distelli platform from the command line so you can deploy your applications to your servers.

The Distelli CLI is available on Linux and Mac OS and requires Python 2.6+. For installation instructions see the [initial setup guide](https://www.distelli.com/docs/setup).
[block:api-header]
{
  "type": "basic",
  "title": "CLI Commands"
}
[/block]
## Distelli Create
The `distelli create` command creates a new application on the distelli platform. 

This command accepts the username of the application owner and the application name separated by a slash. 

To create an application owned by another user, you must be on a team created by that user.
[block:code]
{
  "codes": [
    {
      "code": "distelli create <username>/<appname>",
      "language": "c"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "[See all `distelli create` options and examples: Here.](https://www.distelli.com/docs/distelli-create-reference)"
}
[/block]
## Distelli Push
The `distelli push` command pushes a new release for your application to the Distelli platform. 
The pushed release, can then be deployed to your servers via the `distelli deploy` command or via the web UI.
[block:code]
{
  "codes": [
    {
      "code": "distelli push [-m <desc>] [-f <manifest>] [-r]",
      "language": "c"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "[See all `distelli push` options and examples: Here.](https://www.distelli.com/docs/distelli-push-reference)"
}
[/block]
## Distelli Bundle
The `distelli bundle` command creates new bundle on the local machine of all your code and files specified in the manifest file.
[block:code]
{
  "codes": [
    {
      "code": "distelli bundle [-f <manifest>] [-o <output-file]",
      "language": "c"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "[See all `distelli bundle` options and examples: Here.](https://www.distelli.com/docs/distelli-bundle-reference)"
}
[/block]
##Distelli Deploy
The `distelli deploy` command deploys a release of your application to your server(s) or environment.
[block:code]
{
  "codes": [
    {
      "code": "$ distelli deploy [-f <manifest>] [-m <desc>] [-r <release-id>] [-e <environment>]",
      "language": "c"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "[See all `distelli deploy` options and examples: Here.](https://www.distelli.com/docs/distelli-deploy-reference)"
}
[/block]
## Distelli Login
The `distelli login` command logs you into your Distelli account so you can push releases and deploy code to your servers.
[block:code]
{
  "codes": [
    {
      "code": "distelli login",
      "language": "c"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "[See all `distelli login` options and examples: Here.](https://www.distelli.com/docs/distelli-login-reference)"
}
[/block]
## Distelli Logout
The `distelli logout` command clears your credentials from your local machine and logs you out of your Distelli account.
[block:code]
{
  "codes": [
    {
      "code": "distelli logout",
      "language": "c"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "[See all `distelli logout` options and examples: Here.](https://www.distelli.com/docs/distelli-logout-reference)"
}
[/block]
## Distelli Version
The `distelli version` command prints the version of the Distelli CLI installed on your machine.
[block:code]
{
  "codes": [
    {
      "code": "distelli version",
      "language": "c"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "[See all `distelli version` options and examples: Here.](https://www.distelli.com/docs/distelli-version-reference)"
}
[/block]
##Distelli List
The `distelli list` command lists your servers, environments, apps, instances and deployments.
[block:code]
{
  "codes": [
    {
      "code": "distelli list <servers | environments | apps | instances | deployments> [OPTIONS]",
      "language": "c"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "[See all `distelli list` options and examples: Here.](https://www.distelli.com/docs/distelli-list-reference)"
}
[/block]