---
title: "Using an Organization Team Account"
excerpt: ""
---
This document defines best practice for using an Organization Team Account with Distelli.

Teams in Distelli allow collaboration on applications, environments, servers, deployments, and more.
[block:api-header]
{
  "type": "basic",
  "title": "What is an Organization Account in Distelli"
}
[/block]
An organization account in Distelli is an account that will be shared among multiple team members. When you sign-up for a Distelli account you will decide whether you are creating an individual or organization account. For more information on creating an account see [Creating an Account](doc:creating-an-account1).
[block:api-header]
{
  "type": "basic",
  "title": "What is a Team in Distelli"
}
[/block]
A team allows you to grant access to your Distelli organization account. This includes the applications, environments, servers, and more in this Distelli account. The members of your team must also have an individual Distelli account to be added to the team. For more information see [Creating a Team](doc:creating-a-team).
[block:api-header]
{
  "type": "basic",
  "title": "Example Organization"
}
[/block]
To exemplify best practice usage of teams in Distelli, let's look at a sample scenario team.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/drEtrH8kRnOWC8xreF50",
        "sample_team_org.png",
        "837",
        "358",
        "#93382c",
        ""
      ]
    }
  ]
}
[/block]
This small team of four is responsible for an application code named *projectx*. They will be using features of Distelli to build, test, and deploy their application.

The team has a shared email *projectx@example.com* that everyone on the team receives and has access to.
[block:api-header]
{
  "type": "basic",
  "title": "Sign up for Individual Accounts"
}
[/block]
The first step is for each team member to sign up for their individual Distelli accounts at this link [https://www.distelli.com/signup](https://www.distelli.com/signup).
[block:callout]
{
  "type": "warning",
  "title": "username",
  "body": "When creating individual user names for use in Distelli, best practice is to use a naming nomenclature that includes your organization."
}
[/block]
# Username

In the example scenario, the team has decided to use the following schema for their Distelli user names. This schema is based on their email address and organization.
[block:code]
{
  "codes": [
    {
      "code": "exampleNAME",
      "language": "text"
    }
  ]
}
[/block]

[block:parameters]
{
  "data": {
    "h-0": "User",
    "h-1": "email",
    "h-2": "User name",
    "0-0": "Bob",
    "0-1": "bob@example.com",
    "0-2": "examplebob",
    "1-0": "Joe",
    "2-0": "Alice",
    "2-1": "alice@example.com",
    "2-2": "examplealice",
    "1-1": "joe@example.com",
    "1-2": "examplejoe",
    "3-0": "Steve",
    "3-1": "steve@example.com",
    "3-2": "examplesteve"
  },
  "cols": 3,
  "rows": 4
}
[/block]
Have each person sign up for their individual Distelli Account.
[block:api-header]
{
  "type": "basic",
  "title": "Signing up for Organization Account"
}
[/block]
After the team has their individual accounts, someone must sign up for an organization account. 

In this scenario, the team *projectx@example.com* email will be used for the organization account.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/gq7DjoeQuOH9bE2ONAAO",
        "webui_signup_projectx.png",
        "519",
        "526",
        "#429cd9",
        ""
      ]
    }
  ]
}
[/block]
The organization account will need a unique user name. This example will use *exampleprojectx* as the Distelli user name.

Note the **Check if this is an organization account** box is checked.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/rK19DErnTjmftRldkx9G",
        "webui_signup_projectx_2.png",
        "513",
        "493",
        "#59a8e0",
        ""
      ]
    }
  ]
}
[/block]
Click the **Take Me To My Account** button and you have finished creating an organization account.
[block:api-header]
{
  "type": "basic",
  "title": "Create a Team"
}
[/block]
Next step is to create a team. This team should be created in the organization account.

You can find instructions for creating a team here [Creating a Team](doc:creating-a-team).
[block:api-header]
{
  "type": "basic",
  "title": "Add Team Members"
}
[/block]
After the team is created the next step is to add members to the team. Instructions for adding members to a team can be found here [Adding Members to a Team](doc:add-members-to-a-team).
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/W3HBKCrTzCGMHkXiNuUh",
        "webui_team_projectx.png",
        "849",
        "477",
        "",
        ""
      ]
    }
  ]
}
[/block]
Your organization is now ready to use the team.
[block:api-header]
{
  "type": "basic",
  "title": "Using the Team"
}
[/block]
Now that everyone is in the team, the members can now login to Distelli and use the team. Below is an example of *joe* selecting the team for use.

1. Hover the mouse over the word **Owner** in the top right of the Distelli WebUI.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/iUOdM75uSFqgrhkZgYeZ",
        "webui_team_examplejoe.png",
        "383",
        "144",
        "#7795ae",
        ""
      ]
    }
  ]
}
[/block]
2. Click on the team you wish to use.

The word Owner will change to the team you are currently using.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/aT9ysrbfRY25Mkrk3yWN",
        "webui_team_joeprojectx.png",
        "384",
        "129",
        "#7794ac",
        ""
      ]
    }
  ]
}
[/block]
At this point Joe now has access to all the applications, environments, servers, and more in the organization account via the team.
[block:api-header]
{
  "type": "basic",
  "title": "Further Reading"
}
[/block]
[Teams](doc:teams) 

[Creating a Team](doc:creating-a-team) 
[Adding Members to a Team](doc:add-members-to-a-team) 
[Remove Members from a Team](doc:remove-members-from-a-team) 
[Using a Team](doc:using-a-team) 
[Viewing my Team Membership](doc:viewing-my-team-membership) 
[Finding a Teams Username](doc:finding-a-teams-distelli-username) 
[Adding Servers to a Team](doc:add-servers-to-a-team-account) 
[Creating Applications in a Team](doc:creating-applications-in-a-team-account)
[Pushing Applications in a Team Account](doc:pushing-applications-in-a-team-account) 
[Deploying Applications in a Team Account](doc:deploying-applications-in-a-team-account)
[Deleting a Team](doc:deleting-a-team) 

[Teams FAQ](doc:teams-faq)