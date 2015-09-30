---
title: "Chapter - New App"
excerpt: ""
---
In this chapter you will walk through the new application workflow to create an application from a repository.

This chapter is mostly lab work where you will use the repository you forked earlier and  create an application in Distelli.
[block:api-header]
{
  "type": "basic",
  "title": "New Application Workflow"
}
[/block]
The new application workflow will step you through the application creation process. There are six steps:
1. Name your App
  - Here you will give your Distelli application a name. This may be the same or differ from the repository name.
2. Choose a Repo
  - During this step you will choose what repository to use to create the application.
3. Choose a Branch
  - In this step you will choose which repository branch you wish to use for the application.
4. Create Environments
  - Environments are for deploying applications to. Later we will add a server to your environment and setup auto deploy.
5. Distelli Manifest
  - Every application needs a Distelli manifest file with instructions on how to build and/or how to deploy the application. More on this topic later.
6. Finish up
  - Make sure everything is correct and specify any build environment variables.

After creating the application you will enable auto build and auto deploy features to see the full continuous deployment integration.
[block:api-header]
{
  "type": "basic",
  "title": "Lab 4.1 - Creating a New Application from a Repository"
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "New Application"
}
[/block]
To begin the new application workflow:
1. Click **Applications** from the top of the Distelli WebUI
2. Click the **New App** button on the right.

This will take you to the new application workflow page.
[block:api-header]
{
  "type": "basic",
  "title": "1. Name your Application"
}
[/block]
Enter a name for your application. This application name must not already be in use.
[block:callout]
{
  "type": "warning",
  "body": "Application name can only contain alphanumerics, dashes, and underscores, and can't begin or end with a dash."
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "The application name must match the application name in the distelli-manifest.yml file."
}
[/block]
For training purposes enter the name **training_app1**.
[block:api-header]
{
  "type": "basic",
  "title": "2. Choose a Repo"
}
[/block]
1. Click the **Connect Github** button
2. You may be prompted to login to the trainingstudent# Github account.
3. When prompted, click **Grant access**.

You have connected your Distelli account to Github.

4. Click the **Use Github** button.
5. Click the Training_App1 repository.

You have chosen your repository. 
[block:api-header]
{
  "type": "basic",
  "title": "3. Choose a Branch"
}
[/block]
Next you will be prompted for the repository branch.

1. Click the **master** branch and continue.
[block:api-header]
{
  "type": "basic",
  "title": "4. Create Environments"
}
[/block]
The next step is to create an application environment. By default, two environments are created:
* training_app1-beta
* training_app1-prod

Add another environment by:
1. Enter the name **training_app1-stage** in the *Enter Environment Name* field.
2. Click the **+ Add Environment** button.
3. Click the **All Done** button.
[block:api-header]
{
  "type": "basic",
  "title": "5. Distelli Manifest"
}
[/block]
Because you already have a correct distelli-manifest.yml file in your repository, you will skip this step.

1. Click the **I've pushed my Repo** button.
[block:api-header]
{
  "type": "basic",
  "title": "6. Finish Up"
}
[/block]
Check to make sure that everything is correct. You can backup to any step and restart at that step.
[block:callout]
{
  "type": "info",
  "body": "Do not enable Auto Build at this time."
}
[/block]
1. Click the **Build Configuration** link.

Show and Tell: This is where you would configure any build environment variables that are needed.

2. Click the **X** in the top right to close the dialog box.
3. Click **Sounds good. Create App!**
[block:api-header]
{
  "type": "basic",
  "title": "Next"
}
[/block]
Congratulations.

If you enabled the **auto build** option you will find yourself at the builds list page with the auto build at or near the top of the list. You can click on the bar to view the build. See [Viewing Builds](doc:viewing-builds) for more info.

If you did not enable auto build then you will find yourself at the new application page. See [Viewing an Application](doc:viewing-an-application) for more info.
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)
[block:api-header]
{
  "type": "basic",
  "title": "Training Table of Contents"
}
[/block]
[TOC](doc:toc)