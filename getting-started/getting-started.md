---
title: "Getting Started"
excerpt: "Getting Started with Deployments using Distelli"
---
This document outlines the basic steps to get started using Distelli for application deployments.
[block:callout]
{
  "type": "warning",
  "body": "This getting started guide provides useful information on manually pushing your release up to Distelli and manually starting deployments.\n\nFor more information on continuous deployment and new features see the new [Getting Started Builds and Deploys](doc:getting-started-builds-and-deploys) document"
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
  1. [Distelli SaaS](#distelli-saas)
  2. [Destination Server](#destination-server)
  3. [Distelli Agent](#distelli-agent)
  4. [Development System](#development-system) 
  5. [Distelli CLI](#distelli-cli)
2. Technical Steps
  1. [Creating an Account](doc:creating-an-account)
  2. [Installing the Agent](doc:installing-the-agent)
  3. [Installing the CLI](doc:installing-the-cli)
  4. [Building an Application](doc:building-an-application)
  5. [Editing the Manifest](doc:editing-the-manifest) 
  6. [Creating an Application](doc:creating-an-application)
  7. [Creating an Environment](doc:creating-an-environment)
  8. [Adding a Server](doc:adding-a-server)
  9. [Deploying an Application](doc:deploying-an-application)
  10. [Terminating an Application](doc:terminating-an-application) 
[block:api-header]
{
  "type": "basic",
  "title": "An Overview of the Distelli Components"
}
[/block]
There are 3 system components used in doing a basic Distelli deployment. They are:
- Development Server
- Distelli SaaS
- Destination Server
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/QNXY7vwhSBOZrvEm8f9F",
        "distelli-components.png",
        "998",
        "247",
        "#5a96cc",
        ""
      ]
    }
  ]
}
[/block]
Using these components, and software, Distelli makes it easy to deploy applications to  Destination Servers.
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
  "title": "Development System"
}
[/block]
<img style="float: left; margin: 0px 20px 0px 0px;" src="https://www.filepicker.io/api/file/6EKWtGo4Qn68smMCCZyS" width="145" height="100"> 

A development system is any system that may be used for development or cloning of software applications.

To create, push, bundle, and deploy software via Distelli from the development system, it must have the Distelli CLI installed.
[block:api-header]
{
  "type": "basic",
  "title": "Distelli CLI"
}
[/block]
The Distelli CLI is a tool to perform tasks using the Distelli SaaS from a system. These tasks include:
- Creating an application on Distelli
- Bundling an application
- Pushing an application release up to Distelli
- Deploying an application
[block:api-header]
{
  "type": "basic",
  "title": "Next"
}
[/block]
Get started following the step by step guide by first creating a Distelli Account here [Creating an Account](doc:creating-an-account)