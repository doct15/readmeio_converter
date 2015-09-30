---
title: "CreateEnv"
excerpt: "Create Environment"
---
### username

Your Distelli user name can be found:
* In the Distelli webUI [Finding Your Distelli Username](doc:finding-your-distelli-username).
* If you are using a Team [Finding a Teams Username](doc:finding-a-teams-distelli-username).

### apiToken

Your Distelli API token can be found:
* In the Distelli webUI [Distelli API](doc:distelli-api#authentication).

### app_name

Application name can be found:
* In the Distelli webUI [Viewing an Application](doc:viewing-an-application).
* In the Distelli API [ListApps](doc:listapps).

### env_name

Enter a unique name for your new environment.

### tags

Environment tags are an array of strings and must not contain more than 3 tags.
[block:code]
{
  "codes": [
    {
      "code": "{\n  \"tags\": [\n    \"DEV\",\n    \"GOLD\"\n  ]\n}",
      "language": "json"
    }
  ]
}
[/block]
### vars

Environment variables must be specified as an array of objects. Each object has 2 pairs; **name** and **value**. 
[block:code]
{
  "codes": [
    {
      "code": "{\n\t\"vars\": [\n      {\n          \"name\": \"JAVA_HOME\",\n          \"value\": \"\\\"/usr/lib/jvm/default-java/jre\\\"\"\n      },\n      {\n          \"name\": \"TEST\",\n          \"value\": \"\\\"Deploy to test\\\"\"\n      }       \n  ]\n}",
      "language": "json"
    }
  ]
}
[/block]