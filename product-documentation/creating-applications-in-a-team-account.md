---
title: "Creating Applications in a Team Account"
excerpt: ""
---
Once you are a member of a team, you can create, bundle, push, and deploy applications in the team account using the [Distelli CLI](doc:distelli-cli). This application will be available to all team members.
[block:api-header]
{
  "type": "basic",
  "title": "Create an Application in a Team Account"
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "If you have never created an application it is recommended that you go through the [Getting Started Technical Steps](getting-started) first."
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "You must have the username associated with the team to complete these steps. If you do not have the username see [Finding a Teams Distelli Username](finding-a-teams-distelli-username)."
}
[/block]
Using `distelli create` you can create an application in a team account.
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
If the team username is **janedoe** your interaction would look like this.
[block:code]
{
  "codes": [
    {
      "code": "# distelli create janedoe/SimpleApp\n    Creating App: janedoe/SimpleApp\n    App janedoe/SimpleApp created successfully",
      "language": "text"
    }
  ]
}
[/block]
You can now push a release to the created application.
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)