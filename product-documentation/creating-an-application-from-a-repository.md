---
title: "Creating an Application from a Repository"
excerpt: ""
---
With the **new application** workflow you can easily create an application in the Distelli WebUI from an existing public repository. Distelli currently supports the following public repositories:
* <a href="https://github.com/" target="_blank">https://github.com/</a>
* <a href="https://bitbucket.org/" target="_blank">https://bitbucket.org/</a>
[block:api-header]
{
  "type": "basic",
  "title": "Repository Integration"
}
[/block]
The master settings for integrating your Distelli account to your repository can be found in [Account Settings](doc:account-settings). To navigate to your repository integration settings see [Integrating with a Repository](doc:integrating-with-a-repository).
[block:callout]
{
  "type": "info",
  "body": "You can setup the repository integration in the new application workflow below."
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

This will take you to the new application page
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

[block:api-header]
{
  "type": "basic",
  "title": "2. Choose a Repo"
}
[/block]
If you have not integrated your repository with Distelli, the buttons will say:
* Connect Bitbucket
* Connect Github

If you have already integrated your repository with Distelli, skip forward to [Repo Integrated](#section-repo-integrated).

### Connect Repo

1. Click the **Connect Repo** button for the repository that you wish to connect to.
2. You may be prompted to login to your repository account.
3. When prompted, click **Grant access**.

### Repo Integrated

Once you have integrated your repository with Distelli, the button(s) will say **Use Repo**. For example, if you have integrated your Github account with Distelli, the button on the right will say **Use Github**.

4. Click the **Use Repo** button for the repository that contains the application you wish to create in Distelli.

Next you will be presented a list of repository applications.

5. Click the repository application you wish to use.

You have chosen your repository. 
[block:api-header]
{
  "type": "basic",
  "title": "3. Choose a Branch"
}
[/block]
Next you will be prompted for the repository branch.

Click the **branch** you wish to use, and continue.
[block:api-header]
{
  "type": "basic",
  "title": "4. Create Environments"
}
[/block]
The next step is to create an application environment. By default, two environments are created:
* APPLICATION_NAME-beta
* APPLICATION_NAME-prod

### Add Another Environment

You can add another environment by:
1. Enter the environment name in the **Enter Environment Name** field.
2. Click the **+ Add Environment** button.

### Delete an Environment

You can remove an environment by:
1. Clicking the **trash-can** icon to the right of the environment name.

### Done
**Click** the **All Done** button when you have the environments you would like created.
[block:api-header]
{
  "type": "basic",
  "title": "5. Distelli Manifest"
}
[/block]
The next step is to insure your application has a distelli-manifest file checked into your repository. A skeleton distelli-manifest is provided for you.

The manifest file provides the instructions for building and deploying your application. For more information see [Distelli Manifest](doc:distelli-manifest).

1. Download the skeleton distelli-manifest.yml file.
2. Save the file in your repo directory with the name **distelli-manifest.yml**.
3. Add, commit, and push your repo with the distelli-manifest.yml file.
4. Click the **I've pushed my Repo** button.
[block:api-header]
{
  "type": "basic",
  "title": "6. Finish Up"
}
[/block]
Check to make sure that everything is correct. You can backup to any step and restart at that step.

During the Finish Up step you may:
* [Enable auto build](#section-enable-auto-build).
* [Add build environment variables](#section-add-build-environment-variables).

## Enable Auto Build
To enable auto-build:
1. Check the **Auto Build** option.
[block:callout]
{
  "type": "info",
  "body": "Auto build is enabled by default."
}
[/block]
## Add Build Environment Variables
To set any build environment variables:
1. Click the **Build Configuration**.
2. Enter your build environment variables in the text entry box. Enter the variables in this format:
[block:code]
{
  "codes": [
    {
      "code": "KEY=value",
      "language": "text"
    }
  ]
}
[/block]
3. Click **Save Variables** button.

## Done
When you are ready, click the **Sounds good.** button. The button may say:
* **Sounds good. Create App!** if you did not enable auto build.
* **Looks good. Start Build!** if you did enable auto build.
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