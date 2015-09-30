---
title: "Creating Release Notes"
excerpt: ""
---
When doing a `distelli push` you can provide textual release notes. 

These instructions are specific to creating release notes when creating a new release. If you want to add release notes to an existing release see [Editing Release Notes](doc:editing-release-notes).

You can create release notes when doing a `distelli push` from:
* [The command line](#create-release-notes-from-cli).
* [The Distelli manifest ReleaseNotesCmd](#create-release-notes-from-manifest).
[block:api-header]
{
  "type": "basic",
  "title": "Create Release Notes from CLI"
}
[/block]
When pushing a new release to a Distelli account you can use the option `--release-notes`.
[block:code]
{
  "codes": [
    {
      "code": "distelli push --release-notes",
      "language": "text"
    }
  ]
}
[/block]
When using this option, the Distelli CLI will provide a mechanism for entering text release notes.

Here is an example session:
[block:code]
{
  "codes": [
    {
      "code": "$ distelli push --release-notes\nEnter Release Notes (Ctrl-D to Finish):\n\nThis release fixes issues found in the following bugs:\n* Bug #4373\n* Bug #4201\n* Bug #3293\n\n    Packaged 1 files in 1 directories\n    Pushing App: SimpleApp\n    Uploading Bundle: [=========] 100%\n    \n    Creating Release... DONE\n    Uploading Release Notes... DONE",
      "language": "text"
    }
  ]
}
[/block]
You can edit the release notes after the release is created. See [Editing Release Notes](doc:editing-release-notes)

For more information on pushing releases see [Distelli CLI](doc:distelli-cli#push) 
[block:api-header]
{
  "type": "basic",
  "title": "Create Release Notes from Manifest"
}
[/block]
You can automate the creation of release notes with the Distelli manifest ReleaseNotesCmd section. This step occurs during a `distelli push` after the `PreRelease` section. If using builds on Distelli, this step occurs after the build and test have completed successfully. This step will occur on the build server.

An example manifest with ReleaseNotesCmd:
[block:code]
{
  "codes": [
    {
      "code": "  ReleaseNotesCmd:\n    - echo \"Application X Release Notes\"\n    - echo \"===========================\"\n    - echo \"\"\n    - 'hg log -l 10 -b default'",
      "language": "text"
    }
  ]
}
[/block]
For more information see [Distelli Manifest](doc:distelli-manifest#releasenotescmd).
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)