---
title: "Viewing Release Details"
excerpt: ""
---
Release details include:
* The release description.
* The release tags.
* Who created the release.
* When the release was created.
* The repository change id, if a repo is connected.
* The release package (bundle) name.
* The release package (bundle) storage.
[block:api-header]
{
  "type": "basic",
  "title": "View Release Details"
}
[/block]
To view release details:

1. Navigate to the release you wish to see the release details [Navigating to a Release](doc:navigating-to-a-release).

You are now viewing the release details.
[block:api-header]
{
  "type": "basic",
  "title": "Description"
}
[/block]
This represents a user entered description. This can be specified in the WebUI and during the Distelli CLI push process, for example:
[block:code]
{
  "codes": [
    {
      "code": "distelli push -m \"Enter Release Description Here\"",
      "language": "text"
    }
  ]
}
[/block]
To edit the description in the WebUI, click the **Edit Description** link.
[block:api-header]
{
  "type": "basic",
  "title": "Tags"
}
[/block]
You can have up to 3 tags per release. Release tags are searchable. See [Searching for Release Tag or Version](doc:searching-for-release-tag-or-version).

A tag can be added by clicking on the little tag icon.

Tags can be removed by clicking on the **X** on the tag.
[block:api-header]
{
  "type": "basic",
  "title": "Created by"
}
[/block]
This show what Distelli user is attributed to creating the release. 
[block:api-header]
{
  "type": "basic",
  "title": "Change Id"
}
[/block]
This is the repository change id when you have integrated your application with your repository using the [Distelli Manifest CommitData Section](doc:distelli-manifest#commitdata).
[block:api-header]
{
  "type": "basic",
  "title": "Package"
}
[/block]
This is the bundled release file. For more information see [Distelli Bundle](doc:distelli-bundle-1).
[block:api-header]
{
  "type": "basic",
  "title": "Package Storage"
}
[/block]
This shows the location the bundled release is kept. For more information see [Using Amazon S3 Bucket](doc:using-amazon-s3-bucket).
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)