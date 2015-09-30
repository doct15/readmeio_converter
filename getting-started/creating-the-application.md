---
title: "Creating the Application"
excerpt: ""
---
<div><div style="float: left;">**<- go back to [Editing the Manifest](doc:editing-the-manifest-1)**</div><div style="float: right;">**go forward to [Enable Auto Deploy](doc:enable-auto-deploy) ->**</div></div>
<br>
[block:api-header]
{
  "type": "basic",
  "title": "New Application"
}
[/block]
To begin the new application workflow:
1. Click **Applications** from the top of the Distelli WebUI
2. Click the **New App** button on the right.

This will take you to the new application page.
[block:api-header]
{
  "type": "basic",
  "title": "Name your Application"
}
[/block]
Use **nodejsbuilddeploy** as your application name.
[block:callout]
{
  "type": "warning",
  "body": "This name must match the application name in the Distelli manifest file."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Choose a Repo"
}
[/block]
If you have not integrated your repository with Distelli, the buttons will say:
* Connect Bitbucket
* Connect Github

If you have already integrated your repository with Distelli, skip forward to [Repo Integrated](#section-repo-integrated).

### Connect Repo

1. Click the **Connect Repo** button for the repository that you are using for the tutorial.
2. You may be prompted to login to your repository account.
3. When prompted, click **Grant access**.

### Repo Integrated

Once you have integrated your repository with Distelli, the button(s) will say **Use Repo**. For example, if you have integrated your Github account with Distelli, the button on the right will say **Use Github**.

4. Click the **Use Repo** button for the repository that you are using for the tutorial.

Next you will be presented a list of repository names.

5. Click the repository **nodejsbiulddeploy**.

You have chosen your repository. 
[block:api-header]
{
  "type": "basic",
  "title": "Choose a Branch"
}
[/block]
Next you will be prompted for the repository branch.

Click the branch **master**.
[block:api-header]
{
  "type": "basic",
  "title": "Create Environments"
}
[/block]
By default, two application environments are automatically created:
* nodejsbuilddeploy-beta
* nodejsbuilddeploy-prod

For the tutorial these 2 environments will be more than enough.

Click the **All Done** button.
[block:api-header]
{
  "type": "basic",
  "title": "Distelli Manifest"
}
[/block]
Your tutorial has already provided a distelli-manifest.yml file. There is no need to do anything here.

Click the **I've pushed my Repo** button.
[block:api-header]
{
  "type": "basic",
  "title": "Finish Up"
}
[/block]
Check to make sure that everything is correct. You can backup to any step and restart at that step.

Click the **Looks good. Start Build!** button.
[block:callout]
{
  "type": "info",
  "body": "This will kick off an initial auto-build. Take a moment to look at the build list page and click on the build to look at the build page. You can watch the live logs from this page."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Next"
}
[/block]
<div><div style="float: left;">**<- go back to [Editing the Manifest](doc:editing-the-manifest-1)**</div><div style="float: right;">**go forward to [Enable Auto Deploy](doc:enable-auto-deploy) ->**</div></div>
<br>