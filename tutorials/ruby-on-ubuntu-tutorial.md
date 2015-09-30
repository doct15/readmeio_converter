---
title: "Ruby on Ubuntu Tutorial"
excerpt: ""
---
This is an **Advanced** Tutorial that exemplifies validating prerequisites and installs them if necessary.

The tutorial assumes you have already:
* [Created a free Distelli account](https://www.distelli.com/signup)
* Completed the [initial setup](https://www.distelli.com/docs/getting-started/initial-setup)
* Have Git installed on your **Development** server. 

The scenario also expects that you have a **Destination** server available to do deployments of the example application.
[block:api-header]
{
  "type": "basic",
  "title": "Step 1: Creating an Application"
}
[/block]
In this step, you'll clone a simple sample application from GitHub. These steps should be completed on the Development server where you installed the Distelli CLI.

Enter the following command to clone the sample Ruby application from GitHub:
[block:code]
{
  "codes": [
    {
      "code": "#Clone a sample app repo from GitHub to your local machine\ngit clone https://github.com/Distelli/RubyUbuntuSimpleApp.git\n\n#Then, CD into the sample repo\ncd RubyUbuntuSimpleApp",
      "language": "c"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 2: Inspecting the Manifest File"
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
      "code": "YourUserName/RubyUbuntuSimpleApp:\n  # This Basic Distelli Manifest assumes the following\n  # has been provisioned on the destination deploy server:\n  #\n  # OS: Ubuntu\n  #\n\n  Env:\n    - PORT: 8003\n    - STAGE: production\n\n  PreInstall:\n    #\n    # Check to see if rvm is already installed\n    #\n    - if [ -a ~/.rvm/scripts/rvm ]; then\n    #\n    #   It is already installed\n    #\n    -   echo \"rvm exists\"\n    #\n    - else\n    #\n    #   Install RVM from rvm.io\n    #\n    -   echo \"rvm does not exist. Installing...\"\n    -   gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3\n    -   curl -sSL https://get.rvm.io | bash -s stable --ruby\n    - fi\n    - source ~/.rvm/scripts/rvm\n    #\n    # If ruby 1.9.3 is already installed, next command won't actually re-install, so OK.\n    #\n    - rvm install ruby-1.9.3\n    - rvm use 1.9.3\n    - gem install bundle\n\n  Exec:\n    - source ~/.rvm/scripts/rvm\n    - rvm use 1.9.3\n    - exec ./bundle/bin/thin start -p $PORT -e $STAGE\n\n  PostInstall:\n    - source ~/.rvm/scripts/rvm\n    - rvm use 1.9.3\n    - bundle install --binstubs $DISTELLI_APPHOME/bundle/bin --standalone --path $DISTELLI_APPHOME/bundle/lib\n\n  PkgInclude:\n    - lib/simplerubyapp/*.rb\n    - Gemfile\n    - config.ru\n    - SimpleRubyApp.gemspec",
      "language": "c"
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
  "title": "Step 3: Creating a Version of the Application on Distelli"
}
[/block]
In this step, you'll create a remote version of your application on Distelli using the `distelli create` command. You only need to create the application once, after that you can push the application, and subsequent versions, up to Distelli.

To create an application in Distelli, enter the following command replacing YourUserName with your Distelli username:
[block:code]
{
  "codes": [
    {
      "code": "distelli create YourUserName/RubyUbuntuSimpleApp",
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
  "title": "Step 4: Pushing your First Version"
}
[/block]
In this step, you'll push your first application version to Distelli using the `distelli push` command.

Enter the following command in the terminal:
[block:code]
{
  "codes": [
    {
      "code": "$ distelli push -m \"Initial Release of RubyUbuntuSimpleApp\"\n\nPushing App: RubyUbuntuSimpleApp\nUploading Bundle: [==========] 100%\n\nCreating Release... DONE",
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
  "title": "Step 5: Creating an Environment"
}
[/block]
When you deploy an application with Distelli, you can deploy the application to an Environment which may contain 1 or more servers. You can imagine this in relation to the Software Development Life Cycle where you have several environments which may include; Dev, Test, Staging, and Production. And each of these environments may have 1 or more servers.

In this step, you'll create an environment and add the destination server. To do this:

1. Login to the Distelli WebUI at [https://www.distelli.com/login](https://www.distelli.com/login).
2. Click the **RubyUbuntuSimpleApp** application name.
3. Click the **Environments** link.
4. Click the **Create Environment** button.
5. Enter the **Name** *Production-ruby-ubuntu*.
6. Click **Create Environment**

You have just created an environment named Production-ruby-ubuntu.

7. Click the **Servers** link.
8. Click **Add Servers** link.
9. Select the **Add Server** checkbox for the server you installed the agent on.
10. Click the **Add Selected Servers** link.

You have added server(s) to the environment.
[block:api-header]
{
  "type": "basic",
  "title": "Step 6: Deploying your Release"
}
[/block]
In this step, you'll deploy your release to the Production-ruby-ubuntu environment which includes your destination server. On the development server where you installed the Distelli CLI and the sample application ensure you are in the RubyUbuntuSimpleApp root directory where the Distelli Manifest file is and use the `distelli deploy` command.
[block:code]
{
  "codes": [
    {
      "code": "distelli deploy RubyUbuntuSimpleApp -m \"Initial Release\" -e Production-ruby-ubuntu",
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
To further validate the application is up and running you can browse to your destination server on port 8003 and you should see a "Hello World" message!
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
Try adding more servers to the Production-ruby-ubuntu environment and do a deploy to Production-ruby-ubuntu. You will see the deployment will go to all servers in the environment.

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