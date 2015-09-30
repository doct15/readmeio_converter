---
title: "Tutorial Creating an Application from a Repository"
excerpt: ""
---
This document is a Distelli "builddeploy" tutorial support document.

Follow through the steps below then return to the tutorial that brought you here.
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
For your application name use the application name given to you in the tutorial.
[block:callout]
{
  "type": "warning",
  "body": "Application names are case sensitive, so enter the name exactly as the tutorial specified."
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

5. Click the repository name you are using for the tutorial.

You have chosen your repository. 
[block:api-header]
{
  "type": "basic",
  "title": "Choose a Branch"
}
[/block]
Next you will be prompted for the repository branch.

Click the **branch** appropriate for your tutorial. This is typically **master**.
[block:api-header]
{
  "type": "basic",
  "title": "Create Environments"
}
[/block]
By default, two application environments are automatically created:
* APPLICATION_NAME-beta
* APPLICATION_NAME-prod

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
[block:api-header]
{
  "type": "basic",
  "title": "Return"
}
[/block]
Return to the tutorial document that brought you here.