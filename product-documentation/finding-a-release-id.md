---
title: "Finding a Release ID"
excerpt: ""
---
To deploy a specific application release from the Distelli CLI you will need the release ID. You can list releases with the CLI or find the release in the Distelli WebUI.

An application release ID is in the form of:
[block:code]
{
  "codes": [
    {
      "code": "v##",
      "language": "text"
    }
  ]
}
[/block]
Find your Release ID:
* [With the Distelli CLI](#distelli-cli).
* [With the Distelli WebUI](#distelli-webui).
[block:api-header]
{
  "type": "basic",
  "title": "Distelli CLI"
}
[/block]
The Distelli CLI provides [list](doc:distelli-cli#list) commands to list releases. To use this command you must have the [Distelli CLI](doc:distelli-cli) installed.

The syntax to use this command is:
[block:code]
{
  "codes": [
    {
      "code": "distelli list releases -n APPLICATION_NAME",
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
      "code": "$ distelli list releases -n BashSimpleApp\n+---------------+------------+----------------------------------------+-------------+\n| App Name      | Release Id | Created                                | Description |\n+---------------+------------+----------------------------------------+-------------+\n| BashSimpleApp | v1         | 2015-05-08 20:57:42 UTC (3 months ago) | Test1       |\n| BashSimpleApp | v2         | 2015-05-08 21:00:21 UTC (3 months ago) | Test2       |\n| BashSimpleApp | v3         | 2015-05-11 17:03:54 UTC (3 months ago) | Test3       |\n| BashSimpleApp | v4         | 2015-05-12 00:20:58 UTC (3 months ago) | Test4       |\n+---------------+------------+----------------------------------------+-------------+\n",
      "language": "text"
    }
  ]
}
[/block]
For more information on deploying a specific release from the Distelli CLI see [Distelli CLI](doc:distelli-cli#deploy).
[block:api-header]
{
  "type": "basic",
  "title": "Distelli WebUI"
}
[/block]
To find a specific release ID via the Distelli WebUI.

1. First [Navigate to the Application] that contains the release(doc:navigating-to-an-application).
2. Click the **Releases** link.
3. Locate the **Release** you wish to see its ID.
[block:callout]
{
  "type": "info",
  "body": "You can search for releases by tags or version. See [Searching for release tag or version](doc:searching-for-release-tag-or-version)."
}
[/block]
You can find the release ID at the beginning of the release entry. It is in the form of **v##**.
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)