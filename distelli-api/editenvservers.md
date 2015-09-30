---
title: "EditEnvServers"
excerpt: "Edit Environment Servers"
---
This API call will allow you to add or remove servers from an application environment in Distelli. While adding servers you can specify to also deploy a release to the newly added servers.

### username

Your Distelli user name can be found:
* In the Distelli webUI [Finding Your Distelli Username](doc:finding-your-distelli-username).
* If you are using a Team [Finding a Teams Username](doc:finding-a-teams-distelli-username).

### apiToken

Your Distelli API token can be found:
* In the Distelli webUI [Distelli API](doc:distelli-api).

### env_name

Environment name can be found:
* In the Distelli webUI [Viewing an Environments Deployments](doc:viewing-an-environments-deployments).
* In the Distelli API [ListEnvs](doc:listenvs).
* In the Distelli API [ListAppEnvs](doc:listappenvs).

### servers

Servers is an array of server_id.
[block:code]
{
  "codes": [
    {
      "code": "{\n  \t\"5eab3056-8529-964a-811e-0800277a90a4\",\n  \t\"a4d253a3-1668-e64b-86be-122d4227c561\"\n}",
      "language": "json"
    }
  ]
}
[/block]

### action

Action specifies whether you wish to **add** or **remove** the servers from the environment.
[block:code]
{
  "codes": [
    {
      "code": "{\n  \t\"action\": \"add\"\n}",
      "language": "json"
    }
  ]
}
[/block]
### deploy

true|false, do you want to **deploy** to the newly added servers or **terminate** to the newly removed servers.
[block:code]
{
  "codes": [
    {
      "code": "{\n    \"deploy\": true\n}",
      "language": "json"
    }
  ]
}
[/block]
### description

Enter a description string for the deploy.
[block:code]
{
  "codes": [
    {
      "code": "{\n    \"description\": \"This is a description\"\n}",
      "language": "text"
    }
  ]
}
[/block]
### stagger_size

The number of servers to deploy to at a time.
[block:code]
{
  "codes": [
    {
      "code": "{\n    \"stagger_size\": 2\n}",
      "language": "text"
    }
  ]
}
[/block]
### stagger_delay

The delay to wait, in seconds, between deploys.
[block:code]
{
  "codes": [
    {
      "code": "{\n    \"stagger_size\": 15\n}",
      "language": "text"
    }
  ]
}
[/block]
### release_version

The application release version that you wish to deploy on adding servers.
[block:code]
{
  "codes": [
    {
      "code": "{\n    \"release_version\": \"v76\"\n}",
      "language": "text"
    }
  ]
}
[/block]