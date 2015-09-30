---
title: "Getting Started Builds and Deploys"
excerpt: ""
---
This document outlines the basic steps to get started using Distelli for continuous deployment.

[block:callout]
{
  "type": "success",
  "body": "To go directly to the getting started exercises, click [here](doc:creating-an-account-1)."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Getting Started Table of Contents"
}
[/block]
### Table of Contents:
1. [An Overview of the Distelli Components](#an-overview-of-the-distelli-components)
  1. [Developer](#developer)
  2. [Software Repository](#software-repository)
  3. [Distelli Saas](#distelli-saas)
  4. [Build Server](#build-server)
  5. [Application Environment](#application-environment)
  6. [Destination Server](#destination-server)
  7. [Distelli Agent](#distelli-agent)
  8. [Next](#next)
2. Technical Steps
  1. [Creating an Account](doc:creating-an-account-1)
  2. [Installing the Agent](doc:installing-the-agent-1) 
  3. [Using a Repository](doc:using-a-repository) 
  4. [Editing the Manifest](doc:editing-the-manifest-1) 
  5. [Creating the Application](doc:creating-the-application) 
  6. [Enable Auto Deploy](doc:enable-auto-deploy) 
  7. [Add Server to Environment](doc:add-server-to-environment) 
  8. [Trigger a Build](doc:trigger-a-build) 
  9. [Watch Build and Deploy](doc:watch-build-and-deploy) 
  10. [Validate Deploy](doc:validate-deploy) 
  11. [Terminate the Application](doc:terminate-the-application) 
  12. [More Information](doc:more-information) 
[block:api-header]
{
  "type": "basic",
  "title": "An Overview of the Distelli Components"
}
[/block]
To do complete auto build and auto deployment, continuous deployment, the following components exist:
- Developer who develops and check-in code
- A software repository (i.e. Github or Bitbucket)
- Distelli SaaS
- Build Server
- Destination environment (Production) with 1 or more destination servers for deployment
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/kVjYuazrQZmzAHqw63ka",
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
Using these components, and software, Distelli makes it easy to provide continuous deployment integration.
[block:api-header]
{
  "type": "basic",
  "title": "Developer"
}
[/block]
The developer is the beginning of the continuous deployment chain. The developer is responsible for updating the software code, and checking it into a software repository.
[block:api-header]
{
  "type": "basic",
  "title": "Software Repository"
}
[/block]
A software repository is a public location where software is stored and archived. When integrated with Distelli and a check-in occurs, Distelli will be notified of the software change.
[block:api-header]
{
  "type": "basic",
  "title": "Distelli Saas"
}
[/block]
<img style="float: right; margin: 0px 0px 0px 20px;" src="https://www.filepicker.io/api/file/Fq1HGksmT9ekeNeIqqJP" width="163" height="48"> 
 
The Distelli SaaS (Software as a Service) provides the infrastructure to create and warehouse your application releases, track application deployments, configure servers into environments for deployments, deploy your applications, and more.


[block:api-header]
{
  "type": "basic",
  "title": "Build Server"
}
[/block]
A build server is used to compile, link, transform, build, and/or test software. With Distelli you can automate builds to occur when code is changed.
[block:api-header]
{
  "type": "basic",
  "title": "Application Environment"
}
[/block]
A grouping of servers for doing application deployments. With Distelli you can automate deployments to environments when builds are successful.
[block:api-header]
{
  "type": "basic",
  "title": "Destination Server"
}
[/block]
<img style="float: left; margin: 0px 20px 0px 0px;" src="https://www.filepicker.io/api/file/tkpI8nxQz210n9TY8amg" width="132" height="124"> 

A destination server is any server that will be consuming deployed software. Supported destination server OS includes varieties of Linux, Mac OS X, and Windows.

To enable deployments to the destination server, the destination server must have the Distelli Agent installed on it.


[block:api-header]
{
  "type": "basic",
  "title": "Distelli Agent"
}
[/block]
The Distelli agent is installed on a destination server for consuming software deployments.

The Distelli agent facilitates communication to the Distelli SaaS. The agent may monitor deployed applications to ensure they continue to run.


[block:api-header]
{
  "type": "basic",
  "title": "Next"
}
[/block]
Get started following the step by step guide by first creating a Distelli Account here [Creating an Account](doc:creating-an-account-1)