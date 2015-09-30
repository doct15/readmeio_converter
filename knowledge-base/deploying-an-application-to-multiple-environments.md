---
title: "Deploying an Application to Multiple Environments"
excerpt: ""
---
This document describes using an application in Distelli and best practice for supplying differing deployment instructions based on the environment being deployed to.
[block:api-header]
{
  "type": "basic",
  "title": "The Example Scenario"
}
[/block]
To exemplify this we will take a simple application called **exa1** with the goal of deploying it to differing groups of servers. 
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/V97EGyM9RMqHMqGuNyLD",
        "dame-app-servers.png",
        "623",
        "500",
        "#7b95a1",
        ""
      ]
    }
  ]
}
[/block]
These servers have been grouped by functionality into environments. Each environment has different directory structure, mount points, database access, and dependencies/requirements.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/EnqeDHb7QhOiGMRlRX7n",
        "dame-servers-reqs.png",
        "448",
        "500",
        "#77442d",
        ""
      ]
    }
  ]
}
[/block]
To accommodate this scenario we must specify deployment instructions in such a way that the instructions can conditionally deploy appropriate setup and code to the appropriate environment.

The instructions must be able to:
* Mount the correct mount point.
* Connect to the correct Database and DB Port .
* Install special requirements as necessary (i.e. python-dev).
[block:api-header]
{
  "type": "basic",
  "title": "Deploy Instructions"
}
[/block]
With Distelli, deployment instructions are defined in the distelli-manifest.yml file. This file will reside with your application. For more detailed information on the Distelli manifest, see the [Distelli Manifest](doc:distelli-manifest) reference guide.

The first line of the distelli-manifest.yml file must be a Distelli username and the application name, like so:
[block:code]
{
  "codes": [
    {
      "code": "jdoe/exa1:",
      "language": "text"
    }
  ]
}
[/block]
Next we will configure the environment variables and define their defaults.
[block:code]
{
  "codes": [
    {
      "code": "  Env:\n    - MOUNT_POINT: /mnt/media\n    - DB_NAME: unknown\n    - DB_PORT: 3306\n    - DB_USER: unknown\n    - DB_PASSWORD: unknown\n    - ENVIRONMENT: unknown",
      "language": "text"
    }
  ]
}
[/block]
Let's check to see if the $ENVIRONMENT variable has been set appropriately.
[block:callout]
{
  "type": "info",
  "body": "We will look at setting this at the environment level in the Distelli WebUI. This is described later in this doc."
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "  PreInstall:\n    - if [[ \"$ENVIRONMENT\" == 'unknown' ]]; then\n    -   echo \"This environment deploy is not configured correctly.\"\n    -   echo \"The environment in Distelli should have an environment\"\n    -   echo \" variable $ENVIRONMENT set to one of the following:\"\n    -   echo \"  * TEST\"\n    -   echo \"  * STAGE\"\n    -   echo \"  * PRODUCTION\"\n    -   echo \"\"\n    -   echo \"Exiting...\"\n    -   exit 1\n    - fi",
      "language": "text"
    }
  ]
}
[/block]
Next we will check and link the $MOUNT_POINT, if it exists.
[block:code]
{
  "codes": [
    {
      "code": "    - sudo mkdir -p /var/www\n    - if [ ! -d \"$MOUNT_POINT\" ]; then\n    -   echo \"The mount point specified, $MOUNT_POINT, does not exist.\"\n    -   echo \"Exiting...\"\n    -   exit 1\n    - else\n    -   mkdir -p /var/www\n    -   sudo ln -s $MOUNT_POINT /var/www/media_mount\n    - fi",
      "language": "text"
    }
  ]
}
[/block]
Specifying database name, credentials, and port in my.cnf. This assumes there is already a my.cnf file that contains at least the following
[block:code]
{
  "codes": [
    {
      "code": "# my.cnf\n[client]\nport=\nuser=\npassword=\ndatabase=",
      "language": "text"
    }
  ]
}
[/block]
The deploy instructions to populate the correct data into the my.cnf file.
[block:code]
{
  "codes": [
    {
      "code": "    - sed -i 's/user=.*/user='$DB_USER'/' my.cnf\n    - sed -i 's/port=.*/port='$DB_PORT'/' my.cnf\n    - sed -i 's/password=.*/password='$DB_PASSWORD'/' my.cnf\n    - sed -i 's/database=.*/database='$DB_NAME'/' my.cnf",
      "language": "text"
    }
  ]
}
[/block]
And finally the instructions to install dependencies/prerequisites.
[block:code]
{
  "codes": [
    {
      "code": "    - if [[ \"$ENVIRONMENT\" == 'PRODUCTION' ]]; then\n    -   echo \"Deployed to Production\"\n    - elif [[ $ENVIRONMENT\" == 'STAGE' ]]; then\n    -   echo \"Deployed to Staging\"\n    -   sudo apt-get install -y python-dev\n    - elif [[ $ENVIRONMENT\" == 'TEST' ]]; then\n    -   echo \"Deployed to Test\"\n    -   sudo apt-get install -y python-dev\n    - fi    ",
      "language": "text"
    }
  ]
}
[/block]
Note, this could also be accomplished with using the Distelli provided environment variable DISTELLI_ENV.
[block:api-header]
{
  "type": "basic",
  "title": "Setting Environment Variables"
}
[/block]
The following steps will be completed in the Distelli WebUI.

#### 1. Create the Application in Distelli

We must ensure that we have packaged the distelli-manifest.yml file with the application, then create and push the application to Distelli. There are several ways to create an application in Distelli. See:
* [Creating an Application](doc:creating-an-application-1)
* [Creating an Application from a Repository](doc:creating-an-application-from-a-repository)
* [Creating Applications in a Team Account](doc:creating-applications-in-a-team-account)

#### 2. Create 3 Application Environments 

In this step we will create the application environments to support the example scenario. To create an environment in the Distelli WebUI see [Creating an Environment](doc:creating-an-environment-1).

We will create three environments. These are:
* Test
* Stage
* Production
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/aR0dmaMJTk2vEqHcXrkT",
        "webui_app_exa1_environments.png",
        "914",
        "512",
        "#3474ac",
        ""
      ]
    }
  ]
}
[/block]
You can see in the above image the three environments:
* exa1_production
* exa1_stage
* exa1_test

#### 3. Set the Application Environment Environment Variables

The application environment environment variables override the environment variables in the distelli-manifest.yml file. For more information on environment variables in Distelli see [Environment Variables](doc:environment-variables) reference guide.

In this step we will set the environment variables specific to each environment. You can do this from the application environment overview page.

The below screenshot exemplifies setting the environment variables for the **exa1_test** environment.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/te3j1XTLTl2BO9cOmnLL",
        "webui_app_exa1_environment_vars.png",
        "914",
        "445",
        "#ae3a4d",
        ""
      ]
    }
  ]
}
[/block]
We will do the same thing for the other two environments.

You should note that we are using the same environment variables in the distelli-manifest.yml and in the application environment environment variables. When you do this, the application environment environment variables will override the distelli-manifest.yml environment variables.

In other words, when you deploy to the **exa1_test** environment, the environment variable ENVIRONMENT will be populated with "TEST" and override the definition in the distelli-manifest.yml where ENVIRONMENT is set to "unknown".
[block:api-header]
{
  "type": "basic",
  "title": "The Full Distelli Manifest"
}
[/block]
Here is the full set of deployment instructions.
[block:code]
{
  "codes": [
    {
      "code": "jdoe/exa1:\n  Env:\n    - MOUNT_POINT: /mnt/media\n    - DB_NAME: unknown\n    - DB_PORT: 3306\n    - DB_USER: unknown\n    - DB_PASSWORD: unknown\n    - ENVIRONMENT: unknown\n  PreInstall:\n    - if [[ \"$ENVIRONMENT\" == 'unknown' ]]; then\n    -   echo \"This environment deploy is not configured correctly.\"\n    -   echo \"The application environment in Distelli should have an\"\n    -   echo \"environment variable $ENVIRONMENT set to one of the following:\"\n    -   echo \"  * TEST\"\n    -   echo \"  * STAGE\"\n    -   echo \"  * PRODUCTION\"\n    -   echo \"\"\n    -   echo \"Exiting...\"\n    -   exit 1\n    - fi\n    - sudo mkdir -p /var/www\n    - if [ ! -d \"$MOUNT_POINT\" ]; then\n    -   echo \"The mount point specified, $MOUNT_POINT, does not exist.\"\n    -   echo \"Exiting...\"\n    -   exit 1\n    - else\n    -   mkdir -p /var/www\n    -   sudo ln -s $MOUNT_POINT /var/www/media_mount\n    - fi\n    - sed -i 's/user=.*/user='$DB_USER'/' my.cnf\n    - sed -i 's/port=.*/port='$DB_PORT'/' my.cnf\n    - sed -i 's/password=.*/password='$DB_PASSWORD'/' my.cnf\n    - sed -i 's/database=.*/database='$DB_NAME'/' my.cnf\n    - if [[ \"$ENVIRONMENT\" == 'PRODUCTION' ]]; then\n    -   echo \"Deployed to Production\"\n    - elif [[ $ENVIRONMENT\" == 'STAGE' ]]; then\n    -   echo \"Deployed to Staging\"\n    -   sudo apt-get install -y python-dev\n    - elif [[ $ENVIRONMENT\" == 'TEST' ]]; then\n    -   echo \"Deployed to Test\"\n    -   sudo apt-get install -y python-dev\n    - fi    ",
      "language": "text"
    }
  ]
}
[/block]
If instead of using $ENVIRONMENT we could use $DISTELLI_ENV. If so, then the last section would look like this.
[block:code]
{
  "codes": [
    {
      "code": "    - if [[ \"$DISTELLI_ENV\" == 'exa1_production' ]]; then\n    -   echo \"Deployed to Production\"\n    - elif [[ $DISTELLI_ENV\" == 'exa1_stage' ]]; then\n    -   echo \"Deployed to Staging\"\n    -   sudo apt-get install -y python-dev\n    - elif [[ $DISTELLI_ENV\" == 'exa1_test' ]]; then\n    -   echo \"Deployed to Test\"\n    -   sudo apt-get install -y python-dev\n    - fi    ",
      "language": "text"
    }
  ]
}
[/block]