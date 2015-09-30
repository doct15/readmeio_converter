---
title: "Deploying an Application"
excerpt: ""
---
<div><div style="float: left;">**&lt;- go back to [Adding a Server](doc:adding-a-server)**</div><div style="float: right;"></div><div style="float: right;">**go forward to [Terminating an Application](doc:terminating-an-application) -&gt;**</div></div>
<br>

These steps pick up where you left off in the last step [Adding a Server](doc:adding-a-server); in the Distelli WebUI at the application environment **SimpleApp_Env** page.
[block:api-header]
{
  "type": "basic",
  "title": "Deploy the Application"
}
[/block]
1. On the Environment SimpleApp_Env page click the **Details** link.

In the Release list, below, you should see your **v1 First Release** release that you [pushed](doc:creating-an-application#push) when [Creating an Application](doc:creating-an-application).
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/1W5fvLeLT6iBRwWr56iM",
        "webui_envs_details.png",
        "608",
        "480",
        "#428ccc",
        ""
      ]
    }
  ]
}
[/block]
2. Click the **Deploy** button for your v1 First Release.

You will be presented with a **New Deployment** dialog box.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/OsxkQy8NSjueBxTtWGTJ",
        "webui_deploy_dialog.png",
        "555",
        "416",
        "#ab683d",
        ""
      ]
    }
  ]
}
[/block]
3. Click the **Deploy** button.

The SimpleApp is now being deployed to your destination server.
[block:api-header]
{
  "type": "basic",
  "title": "Validate the Deploy"
}
[/block]

This SimpleApp should not take long to deploy.

You can monitor the deploy logs by clicking the **View Log** button. Since this is such a small script application the logs should show something similar to this.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/9Gnn07g6Q6q4cQ7lefbw",
        "webui_deployment_simpleapp2.png",
        "869",
        "686",
        "#3c8dcf",
        ""
      ]
    }
  ]
}
[/block]
When the deploy is complete the deploy state will change to **Done**.

Click the **View stdout** button to watch the SimpleApp script run.

The SimpleApp simple application script will output the following to stdout.
[block:code]
{
  "codes": [
    {
      "code": "Hello World from Distelli.\nYou have successfully deployed a simple application script.\nServer: serverA\nServer Architecture: x86_64\nServer Time: 5 06/26/2015 14:35:51.992490857\nManifest Environment Variable: This is an example manifest environment variable.\n",
      "language": "text"
    }
  ]
}
[/block]
The script will then wait 10 seconds and end.

But the behavior you will see in the stdout log is that after the script ends, it will restart again. This exemplifies how the Distelli agent will monitor an application and restart it if it exits.
For more information on this behavior see the [Distelli Manifest Reference Guide **Exec** section](doc:distelli-manifest#exec).
[block:api-header]
{
  "type": "basic",
  "title": "Next"
}
[/block]
This basic getting started SimpleApp application barely touches on the features and strength of the Distelli manifest. Now that you have an understanding of the basic elements you may want to take a look at other example [Tutorials](doc:tutorials-index).

If your deploy failed there are troubleshooting tips, techniques, and tricks in the [Troubleshooting Deploys documentation](doc:troubleshooting-deploys). Remember that if you make a change to the application or manifest files you will have to [push](doc:creating-an-application#push) an updated release.

To continue the Getting Started step by step guide continue on to [Terminating an Application](doc:terminating-an-application).

<br>
<div><div style="float: left;">**&lt;- go back to [Adding a Server](doc:adding-a-server)**</div><div style="float: right;"></div><div style="float: right;">**go forward to [Terminating an Application](doc:terminating-an-application) -&gt;**</div></div>