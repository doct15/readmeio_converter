---
title: "Creating an Application"
excerpt: ""
---
<div><div style="float: left;">**<- go back to [Editing the Manifest](doc:editing-the-manifest)**</div><div style="float: right;">**go forward to [Creating an Environment](doc:creating-an-environment) ->**</div></div>
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/uHJcZLCQA204sS6Na7ui",
        "distelli-components.png",
        "998",
        "247",
        "#5a96cc",
        ""
      ]
    }
  ]
}
[/block]
You can now create and push your application to your Distelli account. These steps will be done on your **development system** using the [Distelli CLI.](doc:installing-the-cli)
[block:api-header]
{
  "type": "basic",
  "title": "Create"
}
[/block]
While in the SimpleApp directory, use the `distelli create` command to create the SimpleApp application in your Distelli account.
[block:callout]
{
  "type": "warning",
  "body": "You must change <username> to your Distelli username, not email."
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "distelli create <username>/SimpleApp",
      "language": "text"
    }
  ]
}
[/block]
If your username is johndoe your interaction would look like this.
[block:code]
{
  "codes": [
    {
      "code": "# distelli create johndoe/SimpleApp\n    Creating App: johndoe/SimpleApp\n    App johndoe/SimpleApp created successfully",
      "language": "shell"
    }
  ]
}
[/block]
You have now created an application in your Distelli account on the Distelli SaaS platform.
[block:api-header]
{
  "type": "basic",
  "title": "Push"
}
[/block]
Once the application is created in your Distelli account, you an use `distelli push` to bundle and push a release version of the application to your Distelli account.

The `distelli push -m [message]` option allows you to specify a description for this release of the application.

Push your application release now by entering the following command.
[block:code]
{
  "codes": [
    {
      "code": "distelli push -m \"First Release\"",
      "language": "text"
    }
  ]
}
[/block]
Your push interaction should look like this.
[block:code]
{
  "codes": [
    {
      "code": "# distelli push -m \"First Release\"\n    Packaged 1 files in 1 directories\n    Pushing App: SimpleApp\n    Uploading Bundle: [==========] 100%\n    \n    Creating Release... DONE",
      "language": "shell"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Next"
}
[/block]
You have successfully created, bundled, and pushed your first release of the SimpleApp application up to your Distelli account on the Distelli SaaS platform.

You are ready to log into the Distelli WebUI and interact with your application.

To continue the Getting Started step by step guide continue on to [Creating an Environment](doc:creating-an-environment). 

<br>
<div><div style="float: left;">**&lt;- go back to [Editing the Manifest](doc:editing-the-manifest)**</div><div style="float: right;">**go forward to [Creating an Environment](doc:creating-an-environment) -&gt;**</div></div>