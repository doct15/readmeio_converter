---
title: "Add Server to Environment"
excerpt: ""
---
<div><div style="float: left;">**<- go back to [Enable Auto Deploy](doc:enable-auto-deploy)**</div><div style="float: right;">**go forward to [Trigger a Build](doc:trigger-a-build) ->**</div></div>
<br>

In the last step you enabled auto deploy for the application environment, but this environment currently has no servers in it to deploy to.

In this step you will add the server, that you installed the agent on earlier, to the -beta environment.
[block:api-header]
{
  "type": "basic",
  "title": "Add the Server to the Environment"
}
[/block]
1. In the Distelli WebUI click the **Applications** link at the top.
2. In the application list click **nodejsbuilddeploy** name to navigate to the application page.
3. Click the **Environments** link.
4. Click the **nodejsbuilddeploy-beta** environment.

You are now at the environment page.

5. Click the **Servers** link in the environment section.
6. Click **Add Servers**.

You should see the server you installed the agent on earlier in the server list.

7. Check the **Add Server** check-box for the server.
8. Click the **Add Selected Servers** link near the top left

You have added a server to the environment.
[block:api-header]
{
  "type": "basic",
  "title": "Next"
}
[/block]
<div><div style="float: left;">**<- go back to [Enable Auto Deploy](doc:enable-auto-deploy)**</div><div style="float: right;">**go forward to [Trigger a Build](doc:trigger-a-build) ->**</div></div>