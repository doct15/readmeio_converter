---
title: "Starting a Build"
excerpt: ""
---
Builds are enqueued when an application is integrated with a software repository and there is a commit change to that repository.

If a build is successful and:
* [auto deploy](doc:enabling-auto-deploy) is enabled,
* the auto deploy environment has 1 or more servers,
A deploy task will be enqueued.
[block:api-header]
{
  "type": "basic",
  "title": "Start a Build"
}
[/block]
To start a build, commit a change to the repository that is integrated with an application in Distelli.

For more information see:
* [Enabling Auto Build](doc:enabling-auto-build) 
* [Connecting a Repository to an Application](doc:connecting-a-repository-to-an-application) 
* [Creating an Application from a Repository](creating-an-application-from-a-repository)
[block:api-header]
{
  "type": "basic",
  "title": "Rebuild a Build"
}
[/block]
Another way to start a build is to rebuild from an existing build in the build list page. See [Rebuilding a Build](doc:rebuilding-a-build).
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)