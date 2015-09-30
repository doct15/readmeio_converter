---
title: "Using your own Build Server"
excerpt: ""
---
When building your application with Distelli you can specify Distelli to use your own build servers wherever they may exist.
[block:api-header]
{
  "type": "basic",
  "title": "Step 1. Install the Distelli Agent"
}
[/block]
To correctly function as a build server in Distelli you must first install the Distelli agent on the build server.

Instructions for installing the Distelli agent can be found here [Installing the Agent](doc:installing-the-agent).
[block:callout]
{
  "type": "danger",
  "body": "For build server functionality, the server must be running Distelli agent version 3.35 or greater. To see your Distelli agent version see [Distelli agent version](doc:distelli-agent#dagent-version)."
}
[/block]
For more information on the Distelli agent see [Distelli Agent](doc:distelli-agent) reference guide.
[block:api-header]
{
  "type": "basic",
  "title": "Step 2. Install the Distelli CLI"
}
[/block]
One of the tools required on the build server is the Distelli CLI. Install the CLI on your build server.

Instructions for installing the Distelli CLI can be found here [Installing the CLI](doc:installing-the-cli).

For more information on the Distelli CLI see [Distelli CLI](doc:distelli-cli) reference guide.
[block:callout]
{
  "type": "danger",
  "body": "You must run the following command, after installing the Distelli CLI, for the build process to function correctly."
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "sudo ln -s /usr/local/bin/distelli /usr/bin/",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 3. Mark Server as Build Server"
}
[/block]
From the Distelli WebUI you mark the server as a build server.
[block:callout]
{
  "type": "info",
  "body": "A server marked as a build server can still consume deployments from Distelli."
}
[/block]
1. In the Distelli WebUI click the **Servers** link from the top.
2. In the server list find the server you wish to make a build server and click the server name.
3. On the server page check the **Build Server** box in the top right.

You have enabled this server to build your applications.
[block:api-header]
{
  "type": "basic",
  "title": "Step 4. Enable Application to use Build Server"
}
[/block]
For an application to use a build server it must be integrated with a repository. To integrate your application with a repository see:
* [Connecting a Repository to an Application](doc:connecting-a-repository-to-an-application).
* [Creating an Application from a Repository](doc:creating-an-application-from-a-repository).
[block:callout]
{
  "type": "warning",
  "body": "If your application is not integrated with a repository, this option will not be available."
}
[/block]
To enable an application to use a build server:
1. [Navigate to the Application](doc:navigating-to-an-application). 
2. Click the **Settings** link.
3. Expand the **Repository** section.
4. For the **branch** you wish to build on your own build servers, click the icon on the right.

This will show the branch settings.

5. Check the **Build on my own hardware.** box.

You have enabled this application to build on your build servers.
[block:api-header]
{
  "type": "basic",
  "title": "Next"
}
[/block]
You have now enabled your application to build on your own build server(s).

When the integrated software repository changes (code is committed) Distelli will build your application on your build server.

Next steps:
* [Enabling Auto Deploy](doc:enabling-auto-deploy).