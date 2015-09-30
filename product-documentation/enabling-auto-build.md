---
title: "Enabling Auto Build"
excerpt: ""
---
Auto build is a feature that provides [continuous integration](doc:definitionsterminology#continuous-integration) and is the first part of [continuous deployment](doc:definitionsterminology#continuous-deployment).
[block:callout]
{
  "type": "info",
  "body": "To enable auto build you must first connect a repository to your application in Distelli."
}
[/block]
For integrating a repository with Distelli, see:
* [Integrating with a Repository](doc:integrating-with-a-repository)
* [Connecting a Repository to an Application](doc:connecting-a-repository-to-an-application) 

Auto build functionality is specific to an application.
The auto build options can be found in the [application settings](doc:application-settings).
[block:api-header]
{
  "type": "basic",
  "title": "Enable Auto Build"
}
[/block]
If you have not connected your application to a repository see [Connecting a Repository to an Application](doc:connecting-a-repository-to-an-application).

1. In the Distelli WebUI click **Applications** at the top
2. [Navigate to the application](doc:navigating-to-an-application) you wish to enable auto build.
3. Click the **Settings** link.
4. If you have not connected a repository to this application see [Connecting a Repository to an Application](doc:connecting-a-repository-to-an-application).

Once your application is connected to a repository you will have an option to enable auto builds.

5. Check the **Automatically build this branch when a new commit is pushed** box.
6. Set any build environment variables.
7. Click **Save Repo Settings**

You have enabled auto build.

For continuous deployments see [Enabling Auto Deploy](doc:enabling-auto-deploy).
[block:api-header]
{
  "type": "basic",
  "title": "Disable Auto Build"
}
[/block]
1. In the Distelli WebUI click **Applications** at the top
2. [Navigate to the application](doc:navigating-to-an-application) you wish to disable auto build.
3. Click the **Settings** link.
4. Un-check the **Automatically build this branch when a new commit is pushed** box.
5. Click **Save Repo Settings**

You have disabled auto build.


[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)