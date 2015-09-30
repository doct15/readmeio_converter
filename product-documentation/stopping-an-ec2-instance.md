---
title: "Stopping an EC2 Instance"
excerpt: ""
---
An EC2 server that has been provisioned by Distelli can be managed by Distelli. In particular you can:
* [Provision EC2 Servers](doc:provisioning-ec2-servers) 
* [Start an EC2 Instance](doc:starting-an-ec2-instance) 
* [Stop an EC2 Instance](doc:stopping-an-ec2-instance) 
* [Terminate an EC2 Instance](doc:terminating-an-ec2-instance) 
* [Reboot an EC2 Instance](doc:rebooting-an-ec2-instance)
[block:api-header]
{
  "type": "basic",
  "title": "Stop an EC2 Instance"
}
[/block]
This assume the EC2 instance has been previously started. You can not stop an already stopped EC2 instance.

1. Click **Servers** link from the to[p of the Distelli WebUI.
2. Find the server you wish to stop and click the server link.

This will take you to the server page.

3. Click the blue gear icon on the right.
4. Click the **Stop** button.

[block:callout]
{
  "type": "warning",
  "body": "If the EC2 instance is already stopped there will be no stop button."
}
[/block]
You have stopped the EC2 instance.
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)