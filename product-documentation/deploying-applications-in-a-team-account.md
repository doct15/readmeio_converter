---
title: "Deploying Applications in a Team Account"
excerpt: ""
---
Once you are a member of a team, you can create, bundle, push, and deploy applications in the team account using the [Distelli CLI](doc:distelli-cli).

For more information on using organization teams see [Using an Organization Team Account](doc:using-an-organization-team-account).
[block:api-header]
{
  "type": "basic",
  "title": "Deploy an Application"
}
[/block]
You can deploy applications from the [Distelli CLI](doc:distelli-cli) and the [Distelli WebUI](#deploying-with-the-distelli-webui).
* [Deploying with the Distelli CLI](#deploying-with-the-distelli-cli)
* [Deploying with the Distelli WebUI](#deploying-with-the-distelli-webui)
[block:api-header]
{
  "type": "basic",
  "title": "Deploying with the Distelli CLI"
}
[/block]
To deploy with the CLI, you must have:
1. Created the application in your Distelli team. [Creating Applications in a Team Account](doc:creating-applications-in-a-team-account)
2. Pushed a release version of the application. [Pushing Applications in a Team Account](doc:pushing-applications-in-a-team-account)
3. Created an environment for the application. [Creating an Environment](creating-an-environment-1)
4. Added one or more servers to the environment. [Adding Servers to a Team Account](doc:add-servers-to-a-team-account)

To do the deploy ensure you are in the application directory and have a configured distelli-manifest.yml file.
[block:callout]
{
  "type": "warning",
  "body": "To deploy to a team account you must have the team user name in the distelli-manifest.yml."
}
[/block]
# Deploy to an Environment
[block:code]
{
  "codes": [
    {
      "code": "distelli deploy --env PRODUCTION",
      "language": "text"
    }
  ]
}
[/block]
# Deploy a Specific Release
[block:code]
{
  "codes": [
    {
      "code": "distelli deploy --env BETATEST --release v50",
      "language": "text"
    }
  ]
}
[/block]
# Deploy with Stagger Settings
[block:code]
{
  "codes": [
    {
      "code": "distelli deploy --env TEST --stagger-delay 10 --stagger-size 2",
      "language": "text"
    }
  ]
}
[/block]
For more information on the Distelli CLI deploy see [Distelli CLI](doc:distelli-cli#deploy).
[block:api-header]
{
  "type": "basic",
  "title": "Deploying with the Distelli WebUI"
}
[/block]
To deploy with the WebUI, you must:
1. Create the application in your Distelli account. [Creating Applications in a Team Account](doc:creating-applications-in-a-team-account)
2. Push a release version of the application. [Pushing Applications in a Team Account](doc:pushing-applications-in-a-team-account)
3. Create an environment for the application. [Creating an Environment](creating-an-environment-1)
4. Add one or more servers to the environment. [Adding Servers to a Team Account](doc:add-servers-to-a-team-account)
5. Ensure you are signed into the Distelli WebUI. [Signing in to Distelli](doc:signing-in-to-distelli) 
6. Navigate to the team you wish to use. [Using a Team](doc:using-a-team) 
7. Navigate to the application you wish to deploy. [Navigating to an Application](doc:navigating-to-an-application) 
8. Navigate to the environment you wish to deploy to. [Navigating to an Environment](doc:navigating-to-an-environment) 

Once you have completed the above steps you are ready to click the **Deploy** button for the Release you wish to deploy to this teams application environment.

You will be presented a dialog box.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/8oQfOXNUQRCOfJ1zBJF0",
        "webui_newdeploy_dialog.png",
        "556",
        "414",
        "#a76943",
        ""
      ]
    }
  ]
}
[/block]
Note you can set the stagger options for the deploy in this dialog.

Click the **Deploy** button to deploy your application.
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)