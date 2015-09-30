---
title: "Trigger a Build"
excerpt: ""
---
<div><div style="float: left;">**<- go back to [Add Server to Environment](doc:add-server-to-environment)**</div><div style="float: right;">**go forward to [Watch Build and Deploy](doc:watch-build-and-deploy) ->**</div></div>
<br>

In a previous step you edited and saved the distelli-manifest.yml file in the nodejsbuilddeploy application directory. This constitutes a code change. You will now commit and push that code change up to your repository.

When the repository changes it will notify Distelli that a change occurred. This will trigger a build by Distelli.

Distelli will grab a copy of the repository; build it, test it, and if it is successful will create a release.

When a release is created this will trigger an auto deploy of the application to the nodejsbuilddeploy-beta environment with the server you installed the agent on earlier.
[block:api-header]
{
  "type": "basic",
  "title": "Trigger a Build"
}
[/block]
If you are using:
* Github see [Push with Github](#section-push-with-github)
* Bitbucket see [Push with Bitbucket](#section-push-with-bitbucket)

## Push with Github

Enter the following commands in the `nodejsbuilddeploy` directory:
[block:code]
{
  "codes": [
    {
      "code": "git add .\ngit commit -m \"Set username in manifest\"\ngit push -u origin master",
      "language": "text"
    }
  ]
}
[/block]
This will push your code change up to the repository.

Continue on to [Step 9. Watch the Build and Deploy Process](#step-9-watch-the-build-and-deploy-process).

## Push with Bitbucket

Enter the following commands in the `nodejsbuilddeploy` directory:
[block:code]
{
  "codes": [
    {
      "code": "hg commit -m \"Set username in manifest\"\nhg push",
      "language": "text"
    }
  ]
}
[/block]
This will push your code change up to the repository. This change will trigger a build, so hurry to the next step so you can watch the live logs.
[block:api-header]
{
  "type": "basic",
  "title": "Next"
}
[/block]
<div><div style="float: left;">**<- go back to [Add Server to Environment](doc:add-server-to-environment)**</div><div style="float: right;">**go forward to [Watch Build and Deploy](doc:watch-build-and-deploy) ->**</div></div>