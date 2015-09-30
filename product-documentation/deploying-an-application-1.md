---
title: "Deploying an Application"
excerpt: ""
---
Deploying applications is a cornerstone of the Distelli SaaS. Once you have created a release of an application in your Distelli account you can use Distelli to deploy the application to servers in an environment.
[block:callout]
{
  "type": "info",
  "body": "If you are new to Distelli you may benefit from looking at the [Getting Started Guide](getting-started) first."
}
[/block]
A deploy will deploy the application release to the servers in the application environment.
The following manifest sections will be processed in this order.

1. PreInstall
2. PkgInclude or Install
3. PostInstall
4. PreStart
5. Start or Exec
6. PostStart

For more information see:
* [Distelli Manifest](doc:distelli-manifest) 
* [Deployment Types](doc:deployment-types) 
[block:api-header]
{
  "type": "basic",
  "title": "Deploy an Application"
}
[/block]
You can deploy applications from the [Distelli CLI](doc:distelli-cli) and the [Distelli WebUI](doc:distelli-webui).
* [Deploying with the Distelli CLI](#deploying-with-the-distelli-cli)
* [Deploying with the Distelli WebUI](#deploying-with-the-distelli-webui)
* [Auto Deploy with Distelli](#auto-deploy-with-distelli)
[block:api-header]
{
  "type": "basic",
  "title": "Deploying with the Distelli CLI"
}
[/block]
To deploy with the CLI, you must:
1. Create the application in your Distelli account. [Creating an Application](doc:creating-an-application-1)
2. Push a release version of the application. [Pushing an Application Release](doc:pushing-an-application-release) 
3. Create an environment for the application. [Creating an Environment](creating-an-environment-1)
4. Add one or more servers to the environment. [Adding Servers to an Environment](doc:adding-servers-to-an-environment) 

To do the deploy ensure you are in the application directory and have a configured distelli-manifest.yml file.

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
1. Create the application in your Distelli account. [Creating an Application](doc:creating-an-application-1)
2. Push a release version of the application. [Pushing an Application Release](doc:pushing-an-application-release) 
3. Create an environment for the application. [Creating an Environment](creating-an-environment-1)
4. Add one or more servers to the environment. [Adding Servers to an Environment](doc:adding-servers-to-an-environment)
5. Ensure you are signed into the Distelli WebUI. [Signing in to Distelli](doc:signing-in-to-distelli) 
6. Navigate to the application you wish to deploy. [Navigating to an Application](doc:navigating-to-an-application) 
7. Navigate to the environment you wish to deploy to. [Navigating to an Environment](doc:navigating-to-an-environment) 

Once you have completed the above steps you are ready to click the **Deploy** button for the Release you wish to deploy to this environment.

You will be presented a dialog box.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/hTfI2BCATy2rgLPXBCWp",
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
  "title": "Auto Deploy with Distelli"
}
[/block]
You can trigger an auto deploy when an application completes a successful deploy.
See [Enabling Auto Deploy](doc:enabling-auto-deploy).
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)