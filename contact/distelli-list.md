---
title: "Distelli List"
excerpt: ""
---
[block:code]
{
  "codes": [
    {
      "code": "distelli list <servers | environments | apps | instances | deployments> [OPTIONS]",
      "language": "c"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Options"
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "-u, --user <username>",
      "language": "c"
    }
  ]
}
[/block]
List items for the specified user. You must be a member of the team created by the user in order to list items owned by that user.
[block:code]
{
  "codes": [
    {
      "code": "-f, --format <format>",
      "language": "c"
    }
  ]
}
[/block]
List the items in the specified format. The supported formats are csv for comma separated values or none for space delimited.
[block:code]
{
  "codes": [
    {
      "code": "-n, --name <name>",
      "language": "c"
    }
  ]
}
[/block]
List the items for the specified application name. This option is required for the list releases, instances and deployments commands.
[block:api-header]
{
  "type": "basic",
  "title": "Examples"
}
[/block]
List Servers:
[block:code]
{
  "codes": [
    {
      "code": "distelli list servers\n+-------------------------------------------+---------------------------------------+\n| Hostname                                  | Started                               |\n+-------------------------------------------+---------------------------------------+\n| ec2-184-73-89-154.compute-1.amazonaws.com | 2014-04-29 01:10:05 UTC (1 month ago) |\n| ec2-181-72-19-124.compute-1.amazonaws.com | 2014-06-10 01:20:46 UTC (6 days ago)  |\n| ec2-182-71-29-131.compute-1.amazonaws.com | 2014-06-12 02:55:37 UTC (4 days ago)  |\n+-------------------------------------------+---------------------------------------+",
      "language": "c"
    }
  ]
}
[/block]
List Applications:
[block:code]
{
  "codes": [
    {
      "code": "distelli list apps\n+--------------------------+-----------------------------------------+-----------------------------------------+------------------------------------+\n| App Name                 | Updated                                 | Deployed                                | Description                        |\n+--------------------------+-----------------------------------------+-----------------------------------------+------------------------------------+\n| SimpleApplication        | 2014-06-11 21:49:23 UTC (4 days ago)    | 2014-06-14 20:11:45 UTC (1 day ago)     | A Simple Application               |\n| Apache2                  | 2014-04-05 22:17:03 UTC (2 months ago)  | 2014-04-05 22:17:04 UTC (2 months ago)  | Apache Webserver                   |\n| Nginx                    | 2013-04-22 21:19:01 UTC (1 year ago)    | 2013-04-22 21:19:02 UTC (1 year ago)    | Nginx Webserver                    |\n| SimpleDjangoApp          | 2014-03-02 20:26:56 UTC (3 months ago)  | 2014-03-05 00:54:01 UTC (3 months ago)  | A Python Django Application        |\n| SimpleJavaApp            | 2014-06-08 15:03:20 UTC (8 days ago)    | 2014-06-13 01:47:32 UTC (3 days ago)    | A Simple Application in Java       |\n| SimpleMeteorApp          | 2014-03-01 19:18:11 UTC (3 months ago)  | 2013-11-24 17:22:24 UTC (6 months ago)  | A Simple Meteor Application        |\n| SimpleNodeJSApp          | 2013-10-11 18:44:06 UTC (8 months ago)  | 2013-10-11 18:47:25 UTC (8 months ago)  | A Simple NodeJS Application        |\n| SimplePythonApp          | 2014-04-24 18:32:50 UTC (1 month ago)   | 2014-03-10 01:39:44 UTC (3 months ago)  | A Simple Python Application        |\n+--------------------------+-----------------------------------------+-----------------------------------------+------------------------------------+",
      "language": "c"
    }
  ]
}
[/block]
List releases:
[block:code]
{
  "codes": [
    {
      "code": "distelli list releases -n SimpleJavaApp\n+---------------+------------------------+-----------------------------------------+----------------------------------------+\n| App Name      | Release Id             | Created                                 | Description                            |\n+---------------+------------------------+-----------------------------------------+----------------------------------------+\n| SimpleJavaApp | a-nogzv61ura45cd62c58  | 2013-03-19 02:49:47 UTC (1 year ago)    | Initial release of SimpleJavaApp       |\n| SimpleJavaApp | a-736plosyy48a29af9726 | 2013-03-19 02:54:17 UTC (1 year ago)    | Update the classpath                   |\n| SimpleJavaApp | a-a6bec0qeho02c99b088b | 2013-03-19 02:55:13 UTC (1 year ago)    | Update the port                        |\n| SimpleJavaApp | a-x3s799zmxo6a313d974a | 2013-03-19 16:51:26 UTC (1 year ago)    | Changed the message                    |\n| SimpleJavaApp | a-46ie8vh6ny728f90c418 | 2013-03-19 16:55:30 UTC (1 year ago)    | Updated the response HTML              |\n+---------------+------------------------+-----------------------------------------+----------------------------------------+",
      "language": "c"
    }
  ]
}
[/block]
List deployments:
[block:code]
{
  "codes": [
    {
      "code": "distelli list deployments -n SimpleJavaApp\n+---------------+------------------------+------------------------+-----------------------------------------+---------------------------------+\n| App Name      | Deployment Id          | Release Id             | Deployed                                | Description                     |\n+---------------+------------------------+------------------------+-----------------------------------------+---------------------------------+\n| SimpleJavaApp | d-66hy2ffkdq2f6a1ff48f | a-nogzv61ura45cd62c58  | 2013-03-19 02:50:24 UTC (1 year ago)    | Initial Release                 |\n| SimpleJavaApp | d-h9g4bng0l883148a25aa | a-736plosyy48a29af9726 | 2013-03-19 02:54:40 UTC (1 year ago)    | Use a specific port             |\n| SimpleJavaApp | d-737l67ulzh05b06bcc96 | a-a6bec0qeho02c99b088b | 2013-03-19 02:58:31 UTC (1 year ago)    | Added better logging            |\n| SimpleJavaApp | d-s9u46ywee6185c92c1be | a-a6bec0qeho02c99b088b | 2013-03-19 15:35:04 UTC (1 year ago)    | Demo Deployment                 |\n| SimpleJavaApp | d-eoc7zjda6a7b4b18f8c  | a-e9ept6apcv2fa753ff3c | 2013-03-19 17:10:32 UTC (1 year ago)    | Added ThreadPool                |\n| SimpleJavaApp | d-4hcuqnb3zb1947490a1  | a-e9ept6apcv2fa753ff3c | 2013-03-20 02:49:07 UTC (1 year ago)    | Prestart all Threads            |\n+---------------+------------------------+------------------------+-----------------------------------------+---------------------------------+\n%",
      "language": "c"
    }
  ]
}
[/block]
List instances:
[block:code]
{
  "codes": [
    {
      "code": "distelli list instances -n SimpleJavaApp\n+----------------+-------------------------------------------+---------+---------------+------------------------+--------------------------------------+\n| App Name       | Server                                    | State   | Process Count | Release Id             | Started                              |\n+----------------+-------------------------------------------+---------+---------------+------------------------+--------------------------------------+\n| SimpleJavaApp  | ec2-184-73-89-154.compute-1.amazonaws.com | Running | 1             | a-v9hiq5thd2ad111b8b8d | 2014-06-12 03:18:08 UTC (4 days ago) |\n| SimpleJavaApp  | ec2-181-72-19-124.compute-1.amazonaws.com | Running | 1             | a-v9hiq5thd2ad111b8b8d | 2014-06-08 21:05:12 UTC (7 days ago) |\n| SimpleJavaApp  | ec2-182-71-29-131.compute-1.amazonaws.com | Running | 1             | a-v9hiq5thd2ad111b8b8d | 2014-06-08 21:07:04 UTC (7 days ago) |\n+----------------+-------------------------------------------+---------+---------------+------------------------+--------------------------------------+",
      "language": "c"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Questions or Comments?"
}
[/block]
We're always available to help you with your deployments. Feel free to [contact us](mailto:ping@distelli.com) with any questions or comments.