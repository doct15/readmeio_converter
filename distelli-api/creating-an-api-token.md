---
title: "Creating an API Token"
excerpt: ""
---
Before beginning these steps ensure you are using the correct team or account. For more information on Distelli teams see [Using an Organization Team Account](doc:using-an-organization-team-account).  To see if you are using a team or not see [Using a Team](doc:using-a-team).
[block:api-header]
{
  "type": "basic",
  "title": "Create an API Token"
}
[/block]
1. In the Distelli WebUI click the **gear** icon on the top right.
2. Click the **API** link on the left.
3. Click the **Create API Token** button.
4. Give the token a meaningful **Description**.
5. Click the **Create Token** button.

You have created an API token. You can now test the token with the following ListApps call.
[block:code]
{
  "codes": [
    {
      "code": "curl -i \"https://api.distelli.com/USERNAME/apps?apiToken=TOKEN\"",
      "language": "text"
    }
  ]
}
[/block]
Replace **USERNAME** with your Distelli user name or team user name.
Replace **TOKEN** with the Distelli API token.

You should be returned a list of applications. If you do not get a **200 OK** ensure you are using the correct user name with the correct token.

If necessary, see [Finding Your Distelli Username](doc:finding-your-distelli-username).