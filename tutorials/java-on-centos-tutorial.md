---
title: "Java on CentOS Tutorial"
excerpt: ""
---
This tutorial will get you setup and deploying a simple Java application with Distelli in minutes. 

The tutorial assumes you have already:
* [Created a free Distelli account](https://www.distelli.com/signup).
* Completed the [Tutorial Setup (do this first)](doc:tutorial-setup).
* Java JDK 1.7 + and Git installed on your **Development** server.
 
The scenario also expects that you have a **Destination** server available to do deployments of the example application.
[block:api-header]
{
  "type": "basic",
  "title": "Step 1. Creating an Application"
}
[/block]
In this step, you'll clone a simple sample application from GitHub. These steps should be completed on the Development server where you installed the Distelli CLI.

Enter the following command to clone the sample Java application from GitHub:
[block:code]
{
  "codes": [
    {
      "code": "#Clone a sample app repo from GitHub to your local machine\ngit clone https://github.com/Distelli/JavaCentOSSimpleApp.git\n\n#Then, CD into the sample repo\ncd JavaCentOSSimpleApp",
      "language": "c"
    }
  ]
}
[/block]
Now that you have cloned the application you will have to build it using the Java JDK.

Use the included build.sh script to build the sample Java application:
[block:code]
{
  "codes": [
    {
      "code": "./build.sh",
      "language": "c"
    }
  ]
}
[/block]
You can validate the build by looking in the **target** directory for **SimpleJavaApp.jar** 
[block:api-header]
{
  "type": "basic",
  "title": "Step 2. Inspecting the Manifest File"
}
[/block]
The Distelli Manifest file provides the Distelli Platform with the needed information to successfully deploy your application. This file must exist before pushing your application to Distelli.

The sample application you cloned will already have an existing `distelli-manifest.yml` file in the application root directory. You will need to make a small change to this file before you can push the application up to Distelli.

Edit the `distelli-manifest.yml` file. On the first line you will see a <username> placeholder, and then the name of the sample application.
Replace the <username> placeholder with your Distelli username. For example if your username is 'YourUserName' your `distelli-manifest.yml` should look like this:
[block:code]
{
  "codes": [
    {
      "code": "YourUserName/JavaCentOSSimpleApp:\n  # This Basic Distelli Manifest assumes the following\n  # has been provisioned on the destination deploy server:\n  #\n  # OS: CentOS\n  # Installed Packages:\n  #   Java JRE >= 1.7   [sudo yum install java]\n  #\n  # Set the JAVA_HOME (below) for your JRE install directory\n  #\n  # This also requires that the Java JDK be installed on\n  # the development server to compile the java code.\n  #\n  # There is a build.sh script to compile the code for you.\n  #\n\n  Env:\n    - CLASSPATH: 'target/*:lib/*'\n    #\n    # Set the JAVA_HOME below for the destination\n    # deployment server JRE directory.\n    #\n    - JAVA_HOME: \"/usr/lib/jvm/jre\"\n    #\n    - JVM_ARGS: '\"-Duser.timezone=UTC -Xmx128M -Xms128M\"'\n    - PORT: \"8001\"\n    - ARGS: \"$PORT\"\n\n  Exec:\n    - exec $JAVA_HOME/bin/java -cp $CLASSPATH $JVM_ARGS com.example.app.JavaCentOSSimpleApp $ARGS\n\n  PkgInclude:\n    - target/*.jar\n    - lib/*.jar",
      "language": "yaml"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "In .yml (YAML format) files correct indentation is important."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 3. Creating a Version of the Application on Distelli"
}
[/block]
In this step, you'll create a remote version of your application on Distelli using the `distelli create` command. You only need to create the application once, after that you can push the application, and subsequent versions, up to Distelli.

To create an application in Distelli, enter the following command replacing YourUserName with your Distelli username:
[block:code]
{
  "codes": [
    {
      "code": "distelli create YourUserName/JavaCentOSSimpleApp",
      "language": "c"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "The application name must match the application name in the Distelli Manifest."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 4. Pushing your First Version"
}
[/block]
In this step, you'll push your first application version to Distelli using the `distelli push` command.

Enter the following command in the terminal:
[block:code]
{
  "codes": [
    {
      "code": "distelli push -m \"Initial Release of JavaCentOSSimpleApp\"\n\nPushing App: JavaCentOSSimpleApp\nUploading Bundle: [==========] 100%\n\nCreating Release... DONE",
      "language": "c"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "Just as it is important to have a succinct comment for software repository checkins, it is best-practice to include a relevant message when pushing or deploying your application up to Distelli."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 5. Creating an Environment"
}
[/block]
When you deploy an application with Distelli, you can deploy the application to an Environment which may contain 1 or more servers. You can imagine this in relation to the Software Development Life Cycle where you have several environments which may include; Dev, Test, Staging, and Production. And each of these environments may have 1 or more servers.

In this step, you'll create an environment and add the destination server. To do this:

1. Login to the Distelli WebUI at [https://www.distelli.com/login](https://www.distelli.com/login).
2. Click the **JavaCentOSSimpleApp** application name.
3. Click the **Environments** link.
4. Click the **Create Environment** button.
5. Enter the **Name** *Production-java-centos*.
6. Click **Create Environment**

You have just created an environment named Production-java-centos.

7. Click the **Servers** link.
8. Click **Add Servers** link.
9. Select the **Add Server** checkbox for the server you installed the agent on.
10. Click the **Add Selected Servers** link.

You have added server(s) to the environment.
[block:api-header]
{
  "type": "basic",
  "title": "Step 6. Deploying your Release"
}
[/block]
In this step, you'll deploy your release to the Production-java-centos environment which includes your destination server. On the development server where you installed the Distelli CLI and the sample application ensure you are in the JavaCentOSSimpleApp root directory where the Distelli Manifest file is and use the `distelli deploy` command.
[block:code]
{
  "codes": [
    {
      "code": "distelli deploy JavaCentOSSimpleApp -m \"Initial Release\" -e Production-java-centos",
      "language": "c"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "Environment names are case sensitive."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 7. Validation"
}
[/block]
During the deployment you will see Deployment In Progress messages and when it is complete you should see:
[block:code]
{
  "codes": [
    {
      "code": "Deployment ##### Done: [=         ] Servers: 1 Done, 0 In Progress, 0 Failed",
      "language": "c"
    }
  ]
}
[/block]
To further validate the application is up and running you can browse to your destination server on port 8001 and you should see a "Hello World" message!
[block:api-header]
{
  "type": "basic",
  "title": "Troubleshooting"
}
[/block]
For information on troubleshooting deployments, see [Troubleshooting Deploys](doc:troubleshooting-deploys).
[block:api-header]
{
  "type": "basic",
  "title": "Next Steps"
}
[/block]
Try adding more servers to the Production-java-centos environment and do a deploy to Production-java-centos. You will see the application will be deployed to all servers in the environment.

Also check out the other Getting Started tutorials for different examples.
[block:api-header]
{
  "type": "basic",
  "title": "Need More Help?"
}
[/block]
* [Tutorials Index](doc:tutorials-index)
* [Manifest Library of Examples](doc:distelli-manifest-library-of-examples)
* Read the Knowledge Base articles
* Check out the Reference Guides

We're always available to help. Contact [support](http://www.distelli.com/support).