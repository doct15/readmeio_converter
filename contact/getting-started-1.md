---
title: "Getting Started-1"
excerpt: ""
---
This tutorial will get you setup for deploying applications with Distelli. The tutorial assumes you have already [created a free Distelli account](https://www.distelli.com/signup) and have Python 2.6+ and Git installed on what we will call your 'Development' server. The scenario also expects that you have a destination server available to do deployments of the example applications.
[block:callout]
{
  "type": "warning",
  "body": "*You must complete these steps first before you can deploy an application.*"
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 1: Installing the CLI Tool"
}
[/block]
In this step, you'll install the Distelli Command Line Interface (CLI) tool on your **Development Server**. The Distelli CLI provides you an interface to the Distelli platform from the command line. With this tool you can push your applications to your Distelli account and deploy applications to environments and servers right from the command line.

Follow the instructions below to install the Distelli CLI:
[block:code]
{
  "codes": [
    {
      "code": "#Clone a sample app repo from GitHub to your local machine\ngit clone https://github.com/Distelli/PHPCentOSSimpleApp.git\n\n#Then, CD into the sample repo\ncd PHPCentOSSimpleApp",
      "language": "c",
      "name": "Mac OS X"
    },
    {
      "code": "#Clone a sample app repo from GitHub to your local machine\ngit clone https://github.com/Distelli/PHPCentOSSimpleApp.git\n\n#Then, CD into the sample repo\ncd PHPCentOSSimpleApp",
      "language": "c",
      "name": "Linux"
    }
  ]
}
[/block]
Once installed, open a terminal and enter the CLI `distelli login` command to login to your already created Distelli account.

You'll be prompted to enter the credentials associated with your Distelli account. Replace the email address with the one you used to sign in to Distelli:
[block:code]
{
  "codes": [
    {
      "code": "distelli login\nEmail: example@distelli.com\nPassword:",
      "language": "c"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 2: Adding a Server to Distelli"
}
[/block]
In this step you'll add a **Destination** server to Distelli for deployments. Adding a server to Distelli will allow you to deploy your application from Distelli to that server. Typically this server is not the same server you developed the application on.

Using virtualized hosts is an easy way to quickly create a server, break it down, reset it back to a known good point, and deploy again. One option for virtualized host is [Oracle's VirtualBox](https://www.virtualbox.org/) Virtualization software.

To add a server you'll install the Distelli Agent on the server which will allow Distelli to communicate with the server.

To install the Distelli Agent, connect to your **Destination** server and enter **one** of the following commands suitable for your OS:
[block:code]
{
  "codes": [
    {
      "code": "wget -qO- https://www.distelli.com/download/agent/install | sh\n    -OR-\ncurl -sSL https://www.distelli.com/download/agent/install | sh",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 3: Deploying Your First Application"
}
[/block]
Below are tutorials to exemplify application deployment for various application languages to various operating systems. These are designed so that you can deploy all languages to the same host. Please ensure, before attempting any of these, you have completed the Initial Setup steps above.