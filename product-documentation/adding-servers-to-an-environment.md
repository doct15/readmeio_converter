---
title: "Adding Servers to an Environment"
excerpt: ""
---
Before you can deploy to a server the server must first have the Distelli agent installed and added to an application environment.
[block:api-header]
{
  "type": "basic",
  "title": "Add a Server to an Environment"
}
[/block]
To add a server to an environment the server must first have the [Distelli Agent](doc:distelli-agent) installed on it. Also see [Installing the Agent](doc:installing-the-agent)

To add a server to an environment:
1. First, have a server. If you don't have a server, you could use a virtual server. [Building Virtual Servers](doc:building-virtual-servers) 
2. The Distelli agent will need to be installed on the server. [Distelli Agent](doc:distelli-agent) 
3. Navigate to the environment you want to add the server to. [Navigating to an Environment](doc:navigating-to-an-environment) 
4. Click the **Add Servers** link.

In the WebUI, below, you should see the server you installed the [Distelli Agent](doc:installing-the-agent) on in step 2 above.

5. Click the **Add Server** check box to the right of the server.
6. Click the **Add Selected Servers** link.

You now have a Server in your application environment.
[block:api-header]
{
  "type": "basic",
  "title": "Adding Servers with /etc/distelli.yml"
}
[/block]
You can also **automate** the Distelli agent install, including; logging the agent into a specific Distelli account, automatically joining environment(s), and initiating an automatic initial deploy.

For more information see [Distelli distelli.yml Usage](doc:distelli-distelliyml-usage).
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)