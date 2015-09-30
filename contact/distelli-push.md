---
title: "Distelli Push"
excerpt: ""
---
The distelli push command pushes a new release for your application to the distelli platform. The pushed release, can then be deployed to your servers via the distelli deploy command or via the web UI.

[block:code]
{
  "codes": [
    {
      "code": "distelli push [-m <description>] [-f <manifest>] [-r]",
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
      "code": "-m, --message <description>",
      "language": "c"
    }
  ]
}
[/block]
Use the supplied message as a description for the release.
[block:code]
{
  "codes": [
    {
      "code": "-r, --release-notes",
      "language": "c"
    }
  ]
}
[/block]
This options prompts you to enter release notes on multiple lines and end your input with a Ctrl-D. The entered release notes will be added to the release notes section of the release.
[block:code]
{
  "codes": [
    {
      "code": "-f, --manifest <manifest-filename>",
      "language": "c"
    }
  ]
}
[/block]
This option will use the specified manifest file from the current working directory when pushing a release. If this option is not supplied the push command uses the manifest file named *distelli-manifest.yml* if it is found in the current directory.
[block:api-header]
{
  "type": "basic",
  "title": "Examples"
}
[/block]
Push a release with a message:
[block:code]
{
  "codes": [
    {
      "code": "distelli push -m \"Initial Release of SimpleApp\"\n    Packaged 48 files in 2 directories\n    Pushing App: SimpleApp\n    Uploading Bundle to S3: [==========] 100%\n    Creating Release... DONE",
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