---
title: "Adding a New Server"
excerpt: ""
---
Adding servers to Distelli, can be accomplished via several methods.
* Installing the Distelli Agent on the server.
* Using the distelli.yml to automate the Distelli Agent install.
* Using the new server workflow.
* Using Distelli to provision EC2 servers.

This document documents using the **new server workflow** for adding servers to Distelli. For more information on other methods see:
* [Distelli Agent](doc:distelli-agent)
* [Distelli distelli.yml Usage](doc:distelli-distelliyml-usage) 
* [Provisioning EC2 Servers](doc:provisioning-ec2-servers) 
[block:api-header]
{
  "type": "basic",
  "title": "New Server Workflow"
}
[/block]
To begin the new server workflow:

1. Click the **Servers** link at the top of the Distelli WebUI.
2. Click the **New Server** button at the top right.
[block:api-header]
{
  "type": "basic",
  "title": "1. Add an existing server or launch a new one"
}
[/block]
1. Click the **Add Existing Server** button.
[block:api-header]
{
  "type": "basic",
  "title": "2. Install the Distelli Agent"
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "You must login to your server and install the agent."
}
[/block]
1. Login to the server and use the [Distelli Agent](doc:distelli-agent) install command for your Operating System.

MAC and Linux use the wget or curl. Windows, copy and paste the powershell snippet in a command (cmd) prompt.

2. After installing the agent, in the Distelli WebUI click the **Install Complete** button.
[block:api-header]
{
  "type": "basic",
  "title": "3. Confirm server installation"
}
[/block]
1. Click the **Refresh Server List** button to refresh the list.
2. When you see the server that you installed the Distelli agent on, click the server.
[block:api-header]
{
  "type": "basic",
  "title": "4. Add server to environment"
}
[/block]
1. Select the environment(s) you wish the server to join.
2. Click **Add Environments**.
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index).