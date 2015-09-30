---
title: "Distelli Agent-OLD"
excerpt: ""
---
The Distelli Agent runs on your server and enables it to consume deployments from the Distelli Platform. The agent is currently supported on Linux, Windows, and  Mac OS.
[block:api-header]
{
  "type": "basic",
  "title": "Installing the Agent"
}
[/block]
Installing the Distelli Agent is a simple matter of running the simple install script. You'll need root access (sudo) on your server. To install the agent simply run the install command below:
[block:code]
{
  "codes": [
    {
      "code": "wget -qO- https://www.distelli.com/download/agent/install | sh\n    Installing DistelliAgent-1.81...\n    Downloading Agent Package\n    Starting the Distelli Agent...\n\n    Distelli Agent Started Successfully\n    See https://myaccount.distelli.com/servers",
      "language": "c"
    }
  ]
}
[/block]
The agent runs as user **distelli** and uses the FQDN of the host (or the EC2 public hostname on AWS) as the server Id. You can also install the agent and use a custom name as a serverId by using the -s option with the install script:
[block:code]
{
  "codes": [
    {
      "code": "wget -qO- https://www.distelli.com/download/agent/install | sh -s your-custom-server-id\n    Installing DistelliAgent-1.81...\n    Downloading Agent Package\n    Starting the Distelli Agent...\n\n    Distelli Agent Started Successfully\n    See https://myaccount.distelli.com/servers",
      "language": "c"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Agent Status"
}
[/block]
You can check the status of the Agent via the **status** command:
[block:code]
{
  "codes": [
    {
      "code": "sudo dagent status\n  Distelli Agent (zen.desktop.distelli.com) is Running",
      "language": "c"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Starting the Agent"
}
[/block]
If the agent is not running, it can be started with the start command. The agent can only be run as the **distelli** user so you must switch to that user before starting the agent:
[block:code]
{
  "codes": [
    {
      "code": "sudo dagent start",
      "language": "c"
    }
  ]
}
[/block]
You can also specify a custom name to use as the serverId when starting the agent
[block:code]
{
  "codes": [
    {
      "code": "sudo dagent start some-custom-server-id",
      "language": "c"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Restarting the Agent"
}
[/block]
The agent can be restarted using the **restart** command. This will not affect any running applications
[block:code]
{
  "codes": [
    {
      "code": "sudo dagent restart\nAgent scheduled for restart",
      "language": "c"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Stopping the Agent"
}
[/block]
The agent can be stopped using the stop command. 
[block:callout]
{
  "type": "warning",
  "body": "*NOTE: stopping the agent will result in all your application processes terminating and will cause your application to stop running. We don't recommend stopping the agent on a production machine.*"
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "sudo dagent stop",
      "language": "c"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Renaming the Agent"
}
[/block]
You can rename the agent to a custom name of your choice via the **rename** command. The agent will restart automatically for the new name to take effect and the new name will be reflected in the Distelli console.
[block:code]
{
  "codes": [
    {
      "code": "sudo dagent rename test-name-1101\nRenaming Agent to: test-name-1101\nAgent scheduled for restart",
      "language": "c"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Resetting the Agent Name"
}
[/block]
You can reset the agent name and revert the agent back to using the FQDN of the host (or the EC2 public hostname on AWS) using the reset command:
[block:code]
{
  "codes": [
    {
      "code": "sudo dagent reset name\nReset agent name to: zen.desktop.distelli.com\nAgent scheduled for restart",
      "language": "c"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Upgrading the Agent"
}
[/block]
If a new version of the agent is available you can upgrade it by running the install script:
[block:code]
{
  "codes": [
    {
      "code": "wget -qO- https://www.distelli.com/download/agent/install | sh\n  Installing DistelliAgent-1.81...\n  Downloading Agent Package\n  Starting the Distelli Agent...\n\n  Distelli Agent Started Successfully\n  See https://myaccount.distelli.com/servers",
      "language": "c"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Questions or Comments?"
}
[/block]
We're always available to help you with your deployments. Feel free to [contact us](mailto:ping@distelli.com) with any questions or comments. [Go to top](#installing-the-agent)