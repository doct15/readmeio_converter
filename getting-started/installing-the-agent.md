---
title: "Installing the Agent"
excerpt: ""
---
<div><div style="float: left;">**<- go back to [Creating an Account](doc:creating-an-account)**</div><div style="float: right;">**go forward to [Installing the CLI](doc:installing-the-cli) ->**</div></div>
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/zanUqcT0TYqVTUmGL14V",
        "distelli-components.png",
        "998",
        "247",
        "",
        ""
      ]
    }
  ]
}
[/block]
The Distelli agent connects your destination server to Distelli for consuming application deployments.

To install the agent on your destination server run the command below that is appropriate for your servers OS.
[block:callout]
{
  "type": "warning",
  "body": "This installation requires root (administrator) permissions."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Linux and MAC OS X"
}
[/block]
To install on Linux or MAC OS X you can use either curl **or** wget with one of the following syntaxes.

##wget example
[block:code]
{
  "codes": [
    {
      "code": "wget -qO- https://www.distelli.com/download/agent/install | sh",
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
      "code": "curl -sSL https://www.distelli.com/download/agent/install | sh",
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
To install on Windows copy and paste the following powershell command into a command (cmd) window.
[block:code]
{
  "codes": [
    {
      "code": "powershell -NoProfile -ExecutionPolicy Bypass -Command \"iex ((new-object net.webclient).DownloadString('https://www.distelli.com/download/cli/install.ps1'))\" & SET PATH=%PATH%;%ProgramFiles%\\Distelli",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Verify the Install"
}
[/block]
To validate the agent is installed and working use the `dagent status` command.
[block:callout]
{
  "type": "warning",
  "body": "This command requires root (administrator) access to run."
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "# dagent status\nDistelli Agent (serverA) is Running with id 766b88c8-e925-11e4-ae8b-080027cc07f7\n",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Next"
}
[/block]
You now have the Distelli agent installed and this server can be added to an environment for application deployments.

For more information on the Distelli Agent, see the [Distelli Agent Reference Guide](doc:distelli-agent).

To continue the Getting Started step by step guide continue on to [Installing the CLI](doc:installing-the-cli) 

<br>
<div><div style="float: left;">**<- go back to [Creating an Account](doc:creating-an-account)**</div><div style="float: right;">**go forward to [Installing the CLI](doc:installing-the-cli) ->**</div></div>