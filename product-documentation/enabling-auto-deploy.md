---
title: "Enabling Auto Deploy"
excerpt: ""
---
Auto deploy is a feature that provides [continuous deployment](doc:definitionsterminology#continuous-deployment) in conjunction with auto build. For more information on auto build see [Enabling Auto Build](doc:enabling-auto-build).

Auto deploy functionality is specific to an application.
The auto deploy options can be found in the [application settings](doc:application-settings). 
[block:api-header]
{
  "type": "basic",
  "title": "Enable Auto Deploy"
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "To configure auto deploy you must have an application environment. See [Creating an Environment](doc:creating-an-environment-1). For auto deploy to work, the environment must have 1 or more servers."
}
[/block]
1. In the Distelli WebUI click **Applications** at the top
2. [Navigate to the application](doc:navigating-to-an-application) you wish to enable auto deploy.
3. Click the **Settings** link.
4. Check the **Automatically deploy this branch when a build succeeds**.

A list of environments will be shown.

5. Select the environment(s) you wish auto deploy to be enabled.
6. Click the **Save Repo Settings** button.
[block:api-header]
{
  "type": "basic",
  "title": "Disable Auto Deploy"
}
[/block]
1. In the Distelli WebUI click **Applications** at the top
2. [Navigate to the application](doc:navigating-to-an-application) you wish to disable auto deploy.
3. Click the **Settings** link.
4. Un-check the **Automatically deploy this branch when a build succeeds**.
5. Click the **Save Repo Settings** button.
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)