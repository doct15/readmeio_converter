---
title: "Overview of CI/CD with Distelli"
excerpt: ""
---
This document covers the steps, from a high level, in understanding and setting up [continuous integration](#continuous-integration) and [continuous deployment](#continuous-deployment) with Distelli.
[block:api-header]
{
  "type": "basic",
  "title": "Continuous Integration (CI)"
}
[/block]
Continuous integration is a development practice that requires developers to integrate code into a shared repository on a regular basis. Each check-in is then verified by an automated build, allowing teams to detect problems early.

With Distelli you attach your software repository to a Distelli application to enable auto builds. When the software repository has a check-in of new/updated code, Distelli can grab a copy of the code and auto-build it.
[block:api-header]
{
  "type": "basic",
  "title": "Continuous Deployment (CD)"
}
[/block]
Continuous deployment is a software engineering approach in which teams keep producing valuable software in short cycles and ensure that the software can be reliably built, tested, and deployed.
The build, test, and deploy processes are automated.

The first step of enabling continuous deployment in Distelli is to enable continuous integration (auto builds). Once that is enabled you can enable continuous deployments (auto deploy).
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/NUBbfF12RI6GXGIGe3h2",
        "CD-circle-flow.2.png",
        "940",
        "642",
        "#20314d",
        ""
      ]
    }
  ]
}
[/block]
Continuous integration ends at step 4 in the above diagram.
[block:api-header]
{
  "type": "basic",
  "title": "Setting up CI in Distelli"
}
[/block]
For continuous integration to work, your Distelli application must be integrated with a software repository.

The easiest way to setup continuous integration with Distelli is to use the new application workflow and connect the application to a repository during creation. See [Creating an Application from a Repository](doc:creating-an-application-from-a-repository).

If your application already exists but is not integrated with a repository, you can integrate it. See [Connecting a Repository to an Application](doc:connecting-a-repository-to-an-application).

For automated continuous integration, the auto build feature must be enabled. See [Enabling Auto Build](doc:enabling-auto-build).
[block:api-header]
{
  "type": "basic",
  "title": "Setting up CD in Distelli"
}
[/block]
Continuous deployment in Distelli is the automated process of deploying an application release.

Automated deploys are triggered by successful builds. Continuous deployment requires setup of continuous integration. Once you have setup continuous integration you can setup continuous deployment by [Enabling Auto Deploy](doc:enabling-auto-deploy).
[block:callout]
{
  "type": "warning",
  "body": "To auto deploy you must have an application environment with 1 or more servers."
}
[/block]