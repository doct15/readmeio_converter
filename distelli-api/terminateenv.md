---
title: "TerminateEnv"
excerpt: ""
---
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