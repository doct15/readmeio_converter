---
title: "Amazon EC2"
excerpt: ""
---
While installing the agent manually is easy, there may be several cases where its desirable to have the agent installed automatically when a new instance is launched on Amazon EC2. In this guide, we'll walk through the steps required to configure the EC2 User Data so that the Distelli agent is automatically installed when a new EC2 Instance is started. This can be especially useful when instances are started via AWS Auto Scaling.

Amazon EC2 allows you to specify shell scripts or commands in the User Data section, that run on your Linux instance at launch. To automatically install the agent on instance launch add the following commands to the User Data section of your launch configuration or in the AWS Console when launching a new instance:
[block:code]
{
  "codes": [
    {
      "code": "#!/bin/bash\n\necho \"\nDistelliAccessToken: 'DISTELLI_ACCESS_TOKEN'\nDistelliSecretKey: 'DISTELLI_SECRET_KEY'\n\" > /etc/distelli.yml\n\nwget -qO- http://download.distelli.com/agent/install | sh",
      "language": "shell"
    }
  ]
}
[/block]
The Distelli Access Token and the Distelli Secret Key register this agent with your Distelli account. You can obtain your distelli access token and secret key from your Distelli Account by clicking **Settings () > Credentials > Agent Credentials**. The wget command installs the agent and starts it.

With the script in the User Data, section, launch your EC2 instance and it will automatically install the agent and start it. Once the agent is installed and running, the server will appear in your Distelli Console under servers and you can add it to an environment and deploy your code to it.
[block:api-header]
{
  "type": "basic",
  "title": "Auto Deploy from an Environment"
}
[/block]
In addition to installing an agent on a new EC2 Instance, you can also specify a list of environments the new server should join and Distelli will automatically add the server to those environments and deploy the correct release for the applications associated with those environments.

To specify the environments that the server should add itself to, add the Environments entry to the distelli.yml config file in the User Data. Here is a complete example:
[block:code]
{
  "codes": [
    {
      "code": "#!/bin/bash\n\necho \"\nDistelliAccessToken: 'DISTELLI_ACCESS_TOKEN'\nDistelliSecretKey: 'DISTELLI_SECRET_KEY'\n\nEnvironments:\n  - node-js-runtime-prod\n  - app-dependencies-prod\n  - web-server-prod\n\" > /etc/distelli.yml\n\nwget -qO- http://download.distelli.com/agent/install | sh",
      "language": "shell"
    }
  ]
}
[/block]
In the example above, we included the Environments section in the distelli.yml config file that specifies that this EC2 instance should be added to the three environments specified (node-js-runtime-prod, app-dependencies-prod and web-server-prod) in that order. Distelli will then automatically start deployments from each environment in turn and wait for each deployment to complete before starting the next one.

Auto deployments deploy the active release associated with each environment. The active release is the last release deployed within that environment. If an environment has received no deployments, then the auto deployments will have no effect. To ensure that your auto deployments are successful, please ensure that the last deployment to an environment completes successfully.
[block:api-header]
{
  "type": "basic",
  "title": "Questions or Comments?"
}
[/block]
We're always available to help you with your deployments. Feel free to contact [support](http://www.distelli.com/support) with any questions or comments.