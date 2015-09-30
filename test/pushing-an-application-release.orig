---
title: "Pushing an Application Release"
excerpt: ""
---
This document discusses using the Distelli CLI to push your application. For information on using Distelli's continuous integration (CI) features see [Overview of CI/CD with Distelli](doc:overview-of-cicd-with-distelli).

You must push an application to Distelli to create a release for deployment.

When [integrating with a repository](doc:connecting-a-repository-to-an-application) a push is initiated by the build server. A release is created after successful builds and tests.
[block:api-header]
{
  "type": "basic",
  "title": "Application Manifest"
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "This requires that the application was already created in the Distelli account. See [Creating an Application](creating-an-application-1)"
}
[/block]
To push an application requires a correctly configured distelli-manifest.yml. For more information on the Distelli manifest see the [Distelli Manifest Reference Guide](doc:distelli-manifest). 

The first line of the distelli-manifest.yml must be:
[block:code]
{
  "codes": [
    {
      "code": "USERNAME/APPLICATION_NAME:",
      "language": "text"
    }
  ]
}
[/block]
An example distelli-manifest.yml might look like this:
[block:code]
{
  "codes": [
    {
      "code": "jdoe/SimpleApp:\n  Env:\n    - EXAMPLE: '\"This is an example manifest environment variable.\"'\n  PkgInclude:\n    - application.sh\n  Exec:\n    - './application.sh'",
      "language": "yaml"
    }
  ]
}
[/block]
This manifest will push the application **SimpleApp** to the Distelli account with user name **jdoe**. If pushing to a team account the user name should be the teams user name.

The application name must match the application name in Distelli.
[block:api-header]
{
  "type": "basic",
  "title": "Push a Release"
}
[/block]
To push a release of an application you must use the [Distelli CLI](doc:distelli-cli). First make sure you are logged into the CLI by using the `distelli login` command.
[block:code]
{
  "codes": [
    {
      "code": "$ distelli login\n\nEmail: jdoe@distelli.com\nPassword:",
      "language": "shell"
    }
  ]
}
[/block]
Now you can execute the `distelli push` command. This should be done from the directory where the distelli-manifest.yml file is.
[block:code]
{
  "codes": [
    {
      "code": "jdoe@HostA:~/SimpleApp$ distelli push\n    Packaged 1 files in 1 directories\n    Pushing App: SimpleApp\n    Uploading Bundle: [==========] 100%\n\n    Creating Release... DONE",
      "language": "shell"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Details of a Push"
}
[/block]
When doing a `distelli push` the following occurs:
* The distelli CLI will open and look in the distelli-manifest.yml.
* Any steps specified in the [PreRelease](doc:distelli-manifest#prerelease) section will be executed
* The manifest [PkgInclude](doc:distelli-manifest#pkginclude) and [PkgExclude](doc:distelli-manifest#pkgexclude) sections will define what, if any, files to bundle into the release.
* The release files will be tar'd and gzip'd into a [bundle](doc:distelli-bundle-1).
* The bundle will be uploaded to the distelli account or the [configured AWS S3](doc:using-amazon-s3-bucket) bucket securely.
* The application release number will be incremented.
* A new release will be created.
* Who created the release will be tracked.
* When the release was created will be tracked.

You can see the Release in the Distelli WebUI under the application. Or you can use the [Distelli CLI list](doc:distelli-cli#list) command to list the release.
[block:api-header]
{
  "type": "basic",
  "title": "Also See"
}
[/block]
[Pushing Applications in a Team Account](doc:pushing-applications-in-a-team-account) 
[Distelli CLI push Reference](doc:distelli-cli#push) 
[Distelli Manifest Reference Guide](doc:distelli-manifest) 
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)