---
title: "Distelli distelli.yml Usage"
excerpt: ""
---
The distelli.yml provides authentication credentials for automated use of the Distelli agent and the Distelli CLI.
[block:api-header]
{
  "type": "basic",
  "title": "Using distelli.yml with Distell Agent"
}
[/block]
The distelli.yml file allows automated installation of the [Distelli Agent](doc:distelli-agent). To use this feature:

1. Create the file in the appropriate location.
2. Add the correct credentials.
3. Install the Distelli Agent.

When the agent installs, it will use the specified credentials to add the server to the specified Distelli account. You can also specify options to automate adding the server to specific environments.

# Linux

To use the distelli.yml for automating authentication and installation features of the Distelli agent, the distelli.yml must be placed in the /etc directory.
[block:code]
{
  "codes": [
    {
      "code": "/etc/distelli.yml",
      "language": "text"
    }
  ]
}
[/block]
# Windows

In a Windows environment the distelli.yml should be in the %SystemDrive%.
[block:code]
{
  "codes": [
    {
      "code": "%SystemDrive%\\distelli.yml",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Using distelli.yml with Distelli CLI"
}
[/block]
To use the distelli.yml for automating authentication with the Distelli CLI, the distelli.yml file must be placed in the user home directory.
[block:code]
{
  "codes": [
    {
      "code": "~/distelli.yml",
      "language": "text"
    }
  ]
}
[/block]
To view an example of this, see [Auto Deploy from your CI Platform](doc:auto-deploy-from-your-ci-platform).
[block:api-header]
{
  "type": "basic",
  "title": "Specifying Credentials"
}
[/block]
When using the distelli.yml file the following fields are required:
[block:code]
{
  "codes": [
    {
      "code": "DistelliAccessToken:\nDistelliSecretKey:",
      "language": "yaml"
    }
  ]
}
[/block]
These fields are tied to a Distelli account. If you are using teams, ensure you are [Using a Team](doc:using-a-team) account when retrieving these values.

# Retrieving Credentials

1. Click the **gear** icon from the top right.
2. Click the **Credentials** link on the left.
3. Under *Agent Credentials* click the **Show** button.

Here you will find the Distelli Agent Access Token and Secret Key. Add them to the distelli.yml. For example:
[block:code]
{
  "codes": [
    {
      "code": "DistelliAccessToken: '12345678901234567890123456'\nDistelliSecretKey: '1234567890123456789012345678901234567'",
      "language": "yaml"
    }
  ]
}
[/block]
With this file in place, when you do a Distelli agent install, you will not be prompted for manual entry of your Distelli email credentials. Instead the agent will use the credentials in the distelli.yml file to connect the server to a Distelli account.
[block:api-header]
{
  "type": "basic",
  "title": "Specifying Environment"
}
[/block]
You can specify one or more application environments for this server to join automatically when installing the Distelli agent and using a distelli.yml. This assumes the environment(s) specified belong to the Distelli account associated with the agent access token and secret key.

This feature is enabled in the **Environments:** section of the /etc/distelli.yml file.
[block:code]
{
  "codes": [
    {
      "code": "Environments:\n  - ENVIRONMENT1\n  - ENVIRONMENT2",
      "language": "yaml"
    }
  ]
}
[/block]
Here is a full example. Access token and secret key are required.
[block:code]
{
  "codes": [
    {
      "code": "DistelliAccessToken: '12345678901234567890123456'\nDistelliSecretKey: '1234567890123456789012345678901234567'\nEnvironments:\n  - ENVIRONMENT1\n  - ENVIRONMENT2",
      "language": "yaml"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "danger",
  "body": "If the environment setting \"Auto Deploy the Active Release when a new Server joins this environment\" is enabled (checked) and there is an active release, an auto deploy will occur when servers join an environment using distelli.yml.\n\nFor more info, see [Environment Settings](doc:environment-settings)."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "DistelliAccessToken"
}
[/block]
This is the Distelli access token associated with a specific Distelli account, whether it be an individual account or a team account. Provide this, and the secret key, to have the Distelli agent automatically connect the server to a Distelli account on agent installation.
[block:code]
{
  "codes": [
    {
      "code": "DistelliAccessToken:",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "DistelliSecretKey"
}
[/block]
This is the Distelli secret key associated with a specific Distelli account. Provide this to have the Distelli agent automatically connect the server to a Distelli account on agent installation.
[block:code]
{
  "codes": [
    {
      "code": "DistelliSecretKey:",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Environments"
}
[/block]
This section of the file allows the user to specify application environment(s) that the server should be automatically be added to when installing the Distelli agent.
[block:code]
{
  "codes": [
    {
      "code": "Environments:\n  - ENVIRONMENT_NAME_1\n  - ENVIRONMENT_NAME_2",
      "language": "text"
    }
  ]
}
[/block]