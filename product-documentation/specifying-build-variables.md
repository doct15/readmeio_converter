---
title: "Specifying Build Variables"
excerpt: ""
---
Build environment variables can be specified:
* [In the application settings page](#build-variables-in-application-settings).
* [During new application creation workflow](#build-variables-in-new-application-workflow).

For more information on build environment variables see [Environment Variables](doc:environment-variables#distelli-specific-build-variables).
[block:api-header]
{
  "type": "basic",
  "title": "Build Variables in Application Settings"
}
[/block]
To view, set, edit, or delete build environment variables:

1. Click the **Applications** link from the top of the Distelli WebUI.
2. Navigate to the application that you want to view the build environment variables.
3. Click **Settings** link.
[block:callout]
{
  "type": "info",
  "body": "The **Automatically build this branch when a new commit is pushed** option must be enabled to view the build environment variables."
}
[/block]
4. Scroll down the screen until you see the build environment variables input textbox.

Here you can view, set, edit, or delete the variables.

Build environment variables syntax:
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

[block:api-header]
{
  "type": "basic",
  "title": "Build Variables in New Application Workflow"
}
[/block]
You can configure build environment variables when creating a new application during the new application workflow. For more information on creating an application with the new application workflow see [Creating an Application from a Repository](doc:creating-an-application-from-a-repository).

During the new application workflow [step 6 - Finish Up](doc:creating-an-application-from-a-repository#6-finish-up).
Click on the **Build Configuration** link and you will be presented with a build configuration window that has a build environment variables input textbox.

Here you can view, set, edit, or delete the variables.

Build environment variables syntax:
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

[block:api-header]
{
  "type": "basic",
  "title": "Distelli Specific Build Environment Variables"
}
[/block]
For more information on Distelli specific build environment variables see [Environment Variables](doc:environment-variables#Distelli-specific-build-variables).
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)