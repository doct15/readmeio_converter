---
title: "Viewing Application Deployments"
excerpt: ""
---
Application deployments can be viewed while in progress or after completion.

Application deployments can be viewed in the Distelli WebUI or listed with the Distelli CLI.

Viewing an application deployment via:
* [Distelli WebUI](#view-an-application-deployment-with-distelli-webui)
* [Distelli CLI](#list-an-application-deployment-with-distelli-cli)
[block:api-header]
{
  "type": "basic",
  "title": "View an Application Deployment with Distelli WebUI"
}
[/block]
Viewing an application deployment in the Distelli WebUI will give you access to logs, including live logs for deployments currently in progress. 

To view your deployment:

1. [Navigate to the application](doc:navigating-to-an-application) you wish to see a deployment.
2. Click the **Deployments** link.
3. Find the deployment in the list and click the link for it on the left.

You are now viewing a deployment. For more information see [Viewing a Deployment](doc:viewing-a-deployment).
[block:api-header]
{
  "type": "basic",
  "title": "List an Application Deployment with Distelli CLI"
}
[/block]
You can list deployments for a specific application with the Distelli CLI. The syntax is:
[block:code]
{
  "codes": [
    {
      "code": "distelli list deployments -n APPLICATION_NAME",
      "language": "text"
    }
  ]
}
[/block]
Here is an example session:
[block:code]
{
  "codes": [
    {
      "code": "$ distelli list deployments -n BashSimpleApp\n+---------------+------------------------+------------------------+------------------------------------------+-------------+\n| App Name      | Deployment Id          | Release Id             | Deployed                                 | Description |\n+---------------+------------------------+------------------------+------------------------------------------+-------------+\n| BashSimpleApp | d-338ifi5owr769793a9f1 | a-o3tyk6v71pd096f5e609 | 2015-05-08 20:57:43 UTC (3 months ago)   | Test1       |\n| BashSimpleApp | d-y6d5z3wswq9b52c636f4 | a-q6qadg0zta455f189d0d | 2015-05-11 16:53:46 UTC (3 months ago)   | Test2       |\n| BashSimpleApp | d-ba1k0e1ahldb648a548d | a-038hp3d0fvf90e86b823 | 2015-05-11 17:03:55 UTC (3 months ago)   | Test3       |\n| BashSimpleApp | d-z9gyxktri772d5ba60f6 | a-e6qao45n5me8cfe5ae27 | 2015-05-29 23:07:22 UTC (2 months ago)   | Test4       |\n| BashSimpleApp | d-k6qwo6lphmde9f364e5d | a-e6qao45n5me8cfe5ae27 | 2015-08-17 15:58:49 UTC (40 minutes ago) |             |\n+---------------+------------------------+------------------------+------------------------------------------+-------------+\nbmcgehee@distelli-BM:~/Applications/BashSimpleApp$ ",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)