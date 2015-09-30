---
title: "Pushing Applications in a Team Account"
excerpt: ""
---
Once you are a member of a team, you can create, bundle, push, and deploy applications in the team account using the [Distelli CLI](doc:distelli-cli).

Also see [Pushing an Application Release](doc:pushing-an-application-release).
[block:api-header]
{
  "type": "basic",
  "title": "Push Application in a Team"
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "This requires that the application was already created in the team account. See [Creating Applications in a Team Account](doc:creating-applications-in-a-team-account)"
}
[/block]
To push an application requires a correctly configured distelli-manifest.yml. For more information on the Distelli manifest see the [Distelli Manifest Reference Guide](doc:distelli-manifest). 

The first line of the distelli-manifest.yml must be:
[block:code]
{
  "codes": [
    {
      "code": "TEAM_USERNAME/APPLICATION_NAME:",
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
      "code": "exampleprojectx/SimpleApp:\n  Env:\n    - EXAMPLE: '\"This is an example manifest environment variable.\"'\n  PkgInclude:\n    - application.sh\n  Exec:\n    - './application.sh'",
      "language": "yaml"
    }
  ]
}
[/block]
This manifest will push the application **SimpleApp** to the Distelli account with team user name **exampleprojectx**. 
[block:api-header]
{
  "type": "basic",
  "title": "Push a Release"
}
[/block]
To push a release of an application you must use the [Distelli CLI](doc:distelli-cli). You can execute the `distelli push` command. This should be done from the directory where the distelli-manifest.yml file is.
[block:code]
{
  "codes": [
    {
      "code": "$ distelli push\n    Packaged 1 files in 1 directories\n    Pushing App: SimpleApp\n    Uploading Bundle: [==========] 100%\n\n    Creating Release... DONE",
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
* The manifest PkgInclude and PkgExclude sections will define what, if any, files to bundle into the release.
* The release files will be tar'd and gzip'd into a bundle.
* The bundle will be uploaded to the distelli account or the configured AWS S3 bucket securely.
* The application release number will be incremented.
* A new release will be created.
* Who created the release will be tracked.
* When the release was created will be tracked.

You can see the Release in the Distelli WebUI under the application. Or you can use the [Distelli CLI list](doc:distelli-cli#list) command to list the release.
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation](doc:product-documentation-index)