---
title: "corp D Workflow in Distelli v1.0"
excerpt: ""
---
This document attempts to align the process outlined in document GitWorkflow.pdf to Distelli.
[block:api-header]
{
  "type": "basic",
  "title": "Pre-Setup"
}
[/block]
1. Add application to Distelli [Creating an Application from a Repository](doc:creating-an-application-from-a-repository).
 1a. Create environments (this can be done during application creation)
  - QA
  - UAT
  - PROD
 1b. Enable auto build for the application (this can be done during application creation)
2. Enable build notifications:
 - [Creating 'Build begins' Notification](doc:creating-build-begins-notification) 
 - [Creating 'Build completes' Notification](doc:creating-build-completes-notification) 
3. Enable auto deploy of master branch to QA env [Enabling Auto Deploy](doc:enabling-auto-deploy) 
4. Enable deploy notifications:
 - [Creating 'Deploy begins' Notification](doc:creating-deploy-begins-notification) 
 - [Creating 'Deploy completes' Notification](doc:creating-deploy-completes-notification) 
[block:api-header]
{
  "type": "basic",
  "title": "Developer branches from develop"
}
[/block]
1. Create new branch in Github
2. Add branch to Distelli [Connecting a Branch to an Application](doc:connecting-a-branch-to-an-application) 
3. Create application environment DEV [Creating an Environment](doc:creating-an-environment-1)
4. Add server(s) to the environment [Adding Servers to an Environment](doc:adding-servers-to-an-environment) 
5. Enable auto-deploy for branch to environment [Enabling Auto Deploy](doc:enabling-auto-deploy) 
6. Enable deploy notifications:
 - [Creating 'Deploy begins' Notification](doc:creating-deploy-begins-notification) 
 - [Creating 'Deploy completes' Notification](doc:creating-deploy-completes-notification) 
[block:api-header]
{
  "type": "basic",
  "title": "Developer commits code"
}
[/block]
1. Distelli detects commit
2. Distelli builds code on your or Distelli servers [Using your own Build Server](doc:using-your-own-build-server) 
3. Distelli runs "build" tests
4. Build completion triggers notifications
5. On build and test success, Distelli auto-deploys to DEV environment
6. Deploy completion triggers notifications
[block:api-header]
{
  "type": "basic",
  "title": "QA feature acceptance"
}
[/block]
1. QA acceptance process

This assumes QA accepts the code

2. QA accepts pull request into branch master
3. Distelli detects commit
4. Distelli builds code on your or Distelli servers [Using your own Build Server](doc:using-your-own-build-server) 
5. Distelli runs "build" tests
6. Build completion triggers notifications
7. On build and test success, Distelli auto-deploys to QA environment
8. Deploy completion triggers notifications
[block:api-header]
{
  "type": "basic",
  "title": "QA validation"
}
[/block]
1. QA validation process

This assumes QA validates the code

2. QA promotes the release to UAT **DOCUMENT MISSING**
3. Distelli deploys release to UAT environment [Deploying an Application](doc:deploying-an-application-1) 
[block:api-header]
{
  "type": "basic",
  "title": "UAT Release"
}
[/block]
1. UAT validation and acceptance process

This assumes UAT validates the application

2. UAT promotes the release to PROD  **DOCUMENT MISSING**
3. Distelli deploys release to PROD environment [Deploying an Application](doc:deploying-an-application-1) 
[block:api-header]
{
  "type": "basic",
  "title": "Product Release"
}
[/block]
The application is deployed to production