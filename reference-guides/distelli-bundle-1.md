---
title: "Distelli Bundle"
excerpt: ""
---
A bundle is a packaged application release. For more information on releases see [Releases](doc:releases).

A bundle is created when:
* Executing a [distelli bundle](doc:distelli-cli#bundle) command.
* Executing a [distelli push](doc:distelli-cli#push) command.
* Executing a [distelli deploy](doc:distelli-cli#deploy) without the --release option.
[block:api-header]
{
  "type": "basic",
  "title": "Bundle Criteria"
}
[/block]
The criteria that defines the contents of a bundle are in the [Distelli Manifest](doc:distelli-manifest) PkgInclude and PkgExclude sections. These define what files to include and exclude in the bundle. If these sections are omitted, nothing will be bundled.
[block:api-header]
{
  "type": "basic",
  "title": "Bundle File Format"
}
[/block]
A bundle is a gzip'd tarball of the files to include. For example:
[block:code]
{
  "codes": [
    {
      "code": "jdoeApp1-2015-06-20-17-11-38-a5d5efaf8a8236c5dea543dfe3ded6d07.tar.gz",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Bundle Naming"
}
[/block]
By default, Distelli will use the following schema to name the bundle.
[block:code]
{
  "codes": [
    {
      "code": "APPNAME-YYYY-MM-DD-HH-MM-SS-MD5SUM.tar.gz",
      "language": "text"
    }
  ]
}
[/block]
* APPNAME - The Distelli application name
* YYYY - The full year
* MM - The month
* DD - The date
* HH - The hour
* MM - The minute
* SS - The second
* MD5SUM - The MD5 checksum of the files contents
* tar - The files are tar'd
* gz - The file is compressed using gzip
[block:api-header]
{
  "type": "basic",
  "title": "Bundle Storage"
}
[/block]
By default the release bundle is stored in your Distelli account in the cloud. If you prefer to store your release bundle in your AWS S3 bucket you can do so. For more information on storing Distelli application release bundles on S3 see [Using Amazon S3 Bucket](doc:using-amazon-s3-bucket).