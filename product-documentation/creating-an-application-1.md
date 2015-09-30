---
title: "Creating an Application"
excerpt: ""
---
You create applications in your Distelli account for the purpose of deploying them. Applications can be created with the Distelli CLI or via the Distelli WebUI.
[block:api-header]
{
  "type": "basic",
  "title": "Create an Application with the WebUI"
}
[/block]
Using the Distelli WebUI you can create an application in your account.

1. Ensure you are signed in to Distelli [https://www.distelli.com/login](https://www.distelli.com/login).
2. If you are not on the Applications page, click the **Applications** link in the top left.
3. Click the **New App** button.
4. In the **App Name** field give your application a name.
5. Click the **Create Application without linking a repository** link.

You will be forwarded to the Create Environments section.

#### Add Environment

To add an environment enter the environment name and click the **Add Environment** button.

#### Remove Environment

To remove an environment click the trash can icon next to the environment you want to remove.

6. When all done configuring environments, click the **All Done** button.

An application in Distelli requires a `distelli-manifest.yml` file. This file contains the instructions for building and deploying your application.

In the WebUI you are presented with a skeleton manifest to get you started. You should copy this and add this file to the root directory of your application.

7. Click **I've added the Manifest** button.
8. Click **Sounds good. Create App!** button.

You are now on the new application page.

Next steps may include:
* [Adding Servers to an Environment](doc:adding-servers-to-an-environment) 
* [Pushing an Application Release](pushing-an-application-release)
* [Deploying an Application](doc:deploying-an-application) 
[block:api-header]
{
  "type": "basic",
  "title": "Create an Application with the CLI"
}
[/block]
You can use the Distelli CLI to create applications. For more information on the Distelli CLI see [Distelli CLI](doc:distelli-cli) reference guide.

Using `distelli create` from the Distelli CLI you can create an application in your account.
[block:code]
{
  "codes": [
    {
      "code": "distelli create <username>/<appname>",
      "language": "text"
    }
  ]
}
[/block]
If your username is "jdoe" and your application name is "SimpleApp" your interaction would look like this.
[block:code]
{
  "codes": [
    {
      "code": "# distelli create jdoe/SimpleApp\n    Creating App: jdoe/SimpleApp\n    App jdoe/SimpleApp created successfully",
      "language": "text"
    }
  ]
}
[/block]
Once you've entered the `distelli create` command you will have created a new application in your account on Distelli.

Next step may be [Pushing an Application Release](pushing-an-application-release) up to your account in Distelli.
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation](doc:product-documentation-index)