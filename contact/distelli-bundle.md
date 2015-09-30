---
title: "Distelli Bundle"
excerpt: ""
---
The distelli bundle command creates new bundle on the local machine of all your code and files specified in the manifest file. This can be useful when debugging what's included in a release before it's pushed.
[block:code]
{
  "codes": [
    {
      "code": "$ distelli bundle [-f <manifest>] [-o <output-file] [-b <build-dir>]",
      "language": "text"
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
      "code": "-f, --manifest <manifest-filename>",
      "language": "c"
    }
  ]
}
[/block]
This option will use the specified manifest file from the current working directory when pushing a release. If this option is not supplied the bundle command uses the manifest file named *distelli-manifest.yml* if it is found in the current directory
[block:code]
{
  "codes": [
    {
      "code": "-o, --output-file <output-filename>",
      "language": "c"
    }
  ]
}
[/block]
This option will create the bundle and save it at the path specified. If this option is omitted, the bundle is stored in the ./.distelli directory using the package name and MD5 of the package.
[block:api-header]
{
  "type": "basic",
  "title": "Examples"
}
[/block]
Bundle a release:
[block:code]
{
  "codes": [
    {
      "code": "distelli bundle\n    Packaging App: SimpleApplication\n    Packaged 12 files in 2 directories\n    Packaged: ./.distelli/pkgbuild/SimpleApplication-2014-06-16-04-02-04-e4a498d87e92547ab424cf57ae2f705d.tar.gz",
      "language": "c"
    }
  ]
}
[/block]
Bundle a release using a different manifest and output filename:
[block:code]
{
  "codes": [
    {
      "code": "distelli bundle -o MyBundle.tar.gz -f other-manifest.yml\n\n    Packaging App: OtherApplication\n    Packaged 11 files in 4 directories\n\n    Packaged: MyBundle.tar.gz",
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