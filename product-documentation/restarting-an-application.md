---
title: "Restarting an Application"
excerpt: ""
---
A restart will stop the existing application process that was started with a manifest Exec section. Then start the process again.

During a restart, the following distelli-manifest.yml sections will be processed in this order.
1. PreRestart
2. PreStart
3. Start or Exec
4. PostStart
5. PostRestart

For more information see:
* [Distelli Manifest](doc:distelli-manifest) 
* [Deployment Types](doc:deployment-types) 
[block:api-header]
{
  "type": "basic",
  "title": "Restart an Application"
}
[/block]
Applications are restarted on servers in an environment. To restart an application:

1. Navigate to the application that is to be restarted. [Navigating to an Application](doc:navigating-to-an-application) 
2. Navigate to the environment that is to be restarted. [Navigating to an Environment](doc:navigating-to-an-environment) 
3. At the top right click the **Restart** icon.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/CJMknYFSeSihfxjo7Wow",
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
You will be presented with a Restart dialog where you can adjust the stagger settings.

4. Click **Restart**.

The application is being restarted on the servers in the environment.
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)