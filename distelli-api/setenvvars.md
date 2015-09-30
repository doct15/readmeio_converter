---
title: "SetEnvVars"
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

### vars

Specify environment variables as an array of objects. Each object has 2 pairs; **name** and **value**
[block:code]
{
  "codes": [
    {
      "code": "{\n    \"vars\": [\n        {\n            \"name\": \"EXAMPLE\",\n            \"value\": \"\\\"This is example variable\\\"\"\n        },\n        {\n            \"name\": \"JAVA_HOME\",\n            \"value\": \"\\\"/usr/local/jre\\\"\"\n        }\n    ]\n}",
      "language": "json"
    }
  ]
}
[/block]