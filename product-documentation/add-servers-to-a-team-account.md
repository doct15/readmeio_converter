---
title: "Adding Servers to a Team Account"
excerpt: ""
---
You can add servers to team accounts you are a member of.

[block:api-header]
{
  "type": "basic",
  "title": "Add Servers to a Team"
}
[/block]
To add a server to a team account you must install the Distelli agent on that server. When you enter your Distelli account email and password, and you are a member of a Distelli team, you will be prompted whether to add the server to your account or a team account.
[block:callout]
{
  "type": "warning",
  "body": "This assumes your Distelli account has been added to a team."
}
[/block]

[block:callout]
{
  "type": "danger",
  "body": "When installing the Distelli agent, you will be prompted for your Distelli account email and password. You will then be asked whether to add this server to your account or a team account."
}
[/block]
An example Distelli agent installation session with teams.
[block:code]
{
  "codes": [
    {
      "code": "# wget -qO- https://www.distelli.com/download/agent/install | sh\nThis script requires superuser privileges to install packages\nPlease enter your password at the sudo prompt\n\n    Installing Distelli Toolkit 3.17 for architecture 'Linux-x86_64'...\n    Downloading https://s3.amazonaws.com/doanload.distelli.com/dtk.Linux-x86_65/dtk.Linux-x86_64-3.17.gz\nSuccessfully installed to /usr/local/bin/dtk\nDistelli Email: **jdoe@distelli.com**\n      Password:\n    1: User: jdoe\n    2: Team: janedoe/jane_doe_team\n    3: Team: briandoe/team_alpha\nTeam [3]: **3**\n\nStarting upstart daemon with name:     dtk-supervise-cc1234c06f7abcdabcd123412342891234567890",
      "language": "text"
    }
  ]
}
[/block]
1. Follow the instructions here to [Install the Agent](doc:installing-the-agent) on a destination server.
[block:api-header]
{
  "type": "basic",
  "title": "Add Servers to a Team using distelli.yml"
}
[/block]
By placing a distelli.yml file in /etc directory before installing the Distelli agent, you can automate the agent connecting to a team and joining application environments.

For instructions on doing this see [Distelli distelli.yml Usage](doc:distelli-distelliyml-usage).
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)