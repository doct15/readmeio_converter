---
title: "Terminating an Application"
excerpt: ""
---
A terminate will stop the existing application process that was started with a manifest Exec section. Then remove the application from the server.

The following manifest sections will be processed in this order.

1. PreTerminate
2. Terminate
3. PostTerminate

For more information see:
* [Distelli Manifest](doc:distelli-manifest) 
* [Deployment Types](doc:deployment-types) 
[block:api-header]
{
  "type": "basic",
  "title": "Terminate an Application"
}
[/block]
Applications can be terminated by environment. To terminate an application:

1. Navigate to the environment that the application is to be terminated in. [Navigating to an Environment](doc:navigating-to-an-environment) 
2. At the top right click the **Terminate** icon.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/6F5EaRyYTaSyFH3NzjWP",
        "drt.png",
        "289",
        "99",
        "#4798d6",
        ""
      ]
    }
  ]
}
[/block]
You will be presented with a Terminate dialog where you can adjust the stagger settings.

3. Click **Terminate**.

The application is being terminated on the servers in the environment. This will not remove the application files from the server.
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)