---
title: "Editing the Manifest"
excerpt: ""
---
<div><div style="float: left;">**&lt;- go back to [Building an Application](doc:building-an-application)**</div><div style="float: right;">**go forward to [Creating an Application](doc:creating-an-application) -&gt;**</div></div>
<br>

The Distelli application manifest is a YAML configuration file that is saved with your application code that describes how your application is to be packaged and the commands to be run when it is deployed. A manifest is required for each application that is going to be deployed using Distelli.
[block:api-header]
{
  "type": "basic",
  "title": "Edit the Manifest"
}
[/block]
Using you favorite text editor, edit the distelli-manifest.yml file you created or cloned in the [Creating an Application](doc:creating-an-application) section.

The only change you need to make is to change the first field <username> to your Distelli username. This is your Distelli username, not your Distelli email.

For example, if your username is **johndoe** the first line of your distelli-manifest.yml file would be.
[block:code]
{
  "codes": [
    {
      "code": "johndoe/SimpleApp:",
      "language": "yaml"
    }
  ]
}
[/block]
Save the file distelli-manifest.yml
[block:api-header]
{
  "type": "basic",
  "title": "Next"
}
[/block]
You are now ready to create, push, and deploy your application.

For more information on the Distelli manifest file see the [Distelli Manifest Reference Guide](doc:distelli-manifest).

There are many example Distelli manifest files in the [Tutorials](doc:tutorials-index) and the [Manifest Library](doc:manifest-library-of-examples).

To continue the Getting Started step by step guide continue on to [Creating an Application](doc:creating-an-application).

<br>
<div><div style="float: left;">**&lt;- go back to [Building an Application](doc:building-an-application)**</div><div style="float: right;">**go forward to [Creating an Application](doc:creating-an-application) -&gt;**</div></div>