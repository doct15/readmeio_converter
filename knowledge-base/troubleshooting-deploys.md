---
title: "Troubleshooting Deploys"
excerpt: ""
---
In this post I will explore best practice, tips, and tricks for troubleshooting failed deployments and convey an understanding of the distelli deployment steps and structure.

This article assumes the reader has knowledge of navigating a linux operating system.

It can be frustrating when a deployment fails. Especially when not knowing where to start looking for the problem. Let’s take a look at the best way to approach troubleshooting deployment issues.
[block:api-header]
{
  "type": "basic",
  "title": "Log Files"
}
[/block]
On a deploy failure you should first look at the log files. Logs are captured during each phase of the Deployment. 

The logs are easily viewed in the Distelli WebUI. Execute the following steps to see the logs:

1. Log into your account on Distelli.
2. In the Applications list click on the **application** that failed deployment.
3. Click the **Deployments** link
4. Find the failed **Deployment #####** number and click on it.

You will find yourself at the deployment screen. For each Server in the deployment there will be 2 buttons. A **View Log** and **Stdout** button. The **View Log** logs during the following phases of deployments:

  * PreInstall
  * Install
  * PostInstall
  * PreStart
  * Start
  * PostStart
  * PreTerminate
  * Terminate
  * PostTerminate    
  * PreRestart
  * PostRestart

In the **Stdout** log the following phase is logged:

  * Exec

Click on the View Log or Stdout button to look at the logs.
[block:api-header]
{
  "type": "basic",
  "title": "Log Debugging with Distelli Manifest"
}
[/block]
It is helpful to include echo statements in your distelli-manifest.yml to quickly identify which step in which phase you are in while viewing the logs. Here is an example Distelli Manifest file with echo statements:
Note, some sections do not log.
[block:code]
{
  "codes": [
    {
      "code": "jdoe/SimpleNodeApp:\n  PkgInclude:\n    # This section does not log\n    - server.js\n  PkgExclude:\n    # This section does not log\n    - node_modules/\n  PreInstall:\n    - echo \"Distelli PreInstall Starting.\"\n    # Check to see if node is already installed\n    - if [ -a /usr/local/bin/node ]; then\n    #   node is already installed\n    -   echo \"node exists\"\n    - else\n    #   Install node from nodejs.org\n    -   echo \"node does not exist. Installing...\"\n    -   wget http://nodejs.org/dist/v0.12.2/node-v0.12.2-linux-x64.tar.gz\n    -   sudo tar -C /usr/local --strip-components 1 -zxvf node-v0.12.2-linux-x64.tar.gz\n    - fi\n    - echo \"Distelli PreInstall Complete.\"\n  PostInstall:\n    - echo \"Distelli PostInstall Starting.\"\n    - sudo npm config set loglevel verbose\n    - echo \"Distelli PostInstall Complete.\"\n  Exec:\n    - echo \"Distelli Exec Starting.\"\n    - node server.js",
      "language": "yaml"
    }
  ]
}
[/block]
Now when you view the logs you can easily identify which step of which phase an issue may have occurred in.

Look in the Log for errors. There typically is some indication of what may have failed. Also look in the Stdout to see why the application may have failed to execute.

Some other commands that may be helpful to include in a distelli-manifest.yml for troubleshooting might be:

**pwd** - Show the present working directory the deployment phase is in.
**env** - Show the current environment variables during the deployment phase.
**set** - Show the current environment variables and aliases during the deployment phase.
**df** - Show the current free disk space.
**netstat -plnt** - Show the current tcp ports being listened to.

You can include these commands in the distelli-manifest.yml phases. For example:
[block:code]
{
  "codes": [
    {
      "code": "jdoe/SimpleJavaApp:\n  Env:\n    - CLASSPATH: 'target/*:lib/*'\n    - JAVA_HOME: \"/usr/local/jre\"\n    - JVM_ARGS: '\"-Duser.timezone=UTC -Xmx128M -Xms128M\"'\n    - PORT: \"8080\"\n    - ARGS: \"$PORT\"\n  PreInstall:\n    - echo \"Starting PreInstall Section\"\n    - pwd\n    - env\n    - echo \"End PreInstall Section”\n  PostInstall:\n    - echo \"Starting PreInstall Section\"\n    - pwd\n    - env\n    - echo \"End PreInstall Section”\n  Exec:\n    - echo \"Starting Exec Section\"\n    - echo \"Check what is Listening on tcp\"\n    - echo \"------------------------------\"\n    - netstat -plnt\n    - echo \"------------------------------\"\n    - echo \"Starting Java App using java at $JAVA_HOME\"\n    - exec $JAVA_HOME/bin/java -cp $CLASSPATH $JVM_ARGS com.example.app.SimpleJavaApp $ARGS\n  PkgInclude:\n    - target/*.jar\n    - lib/*.jar",
      "language": "yaml"
    }
  ]
}
[/block]
The above steps can assist with troubleshooting a deployment problem by adding debugging to the Distelli manifest and looking at the logs.
[block:api-header]
{
  "type": "basic",
  "title": "Distelli Deployment Directory Structure"
}
[/block]
When you install the Distelli agent a directory structure is built to accommodate deployments. It is helpful to understand this structure when troubleshooting. This structure sits at the root in a directory called “distelli” owned by the user and group “distelli”. 

With an application called SimplePHPApp deployed to an environment called TEST_PHP the directory structure will look similar to this:
[block:code]
{
  "codes": [
    {
      "code": "/distelli\n├── _agent\n│   ├── agent_data.yml\n│   ├── agent-stdout.log\n│   ├── distelli-agent.2015-04-22.log\n│   ├── distelli-agent.log\n│   ├── dtk\n│   ├── dtk-stdout.log\n│   ├── logs\n│   ├── manifests\n│   ├── server-id.yml\n│   └── supervisor\n│          ├── supervisord.conf\n│          ├── supervisord.log\n│          ├── supervisord.pid\n│          └── supervisor.sock\n├── apps\n├── _apps\n│   └── SimplePHPApp.TEST_PHP.d-e6kksc38lmed3764772c\n│       ├── bin\n│       │   ├── distelli-env.sh\n│       │   ├── distelli-preinstall.sh\n│       │   └── distelli-run.sh\n│       └── simpleapp.php\n├── envs\n│   └── TEST_PHP\n│       ├── bin -> /distelli/_apps/SimplePHPApp.TEST_PHP.d-e6kksc38lmed3764772c/bin\n│       ├── distelli-stdout.log\n│       └── simpleapp.php -> /distelli/_apps/SimplePHPApp.TEST_PHP.d-e6kksc38lmed3764772c/simpleapp.php\n└── _packages",
      "language": "text"
    }
  ]
}
[/block]
On windows the Distelli root directory can be found at:
[block:code]
{
  "codes": [
    {
      "code": "%SYSTEMROOT%\\distelli",
      "language": "text"
    }
  ]
}
[/block]
Let’s first look at the naming structure that is created on a deploy. You can see the below naming included in several places in the directory hierarchy above.
[block:code]
{
  "codes": [
    {
      "code": " SimplePHPApp.TEST_PHP.d-e6kksc38lmed3764772c\n|            |        |                      |\n|application |  env   |    deployment ID     |",
      "language": "text"
    }
  ]
}
[/block]
Remember, this example directory structure is based on deploying one application called SimplePHPApp to environment TEST_PHP.

In this scenario, the Distelli specific environment variable DISTELLI_INSTALLHOME is the below directory. It is this directory where your application release is unbundled during the Install phase.
[block:code]
{
  "codes": [
    {
      "code": "/distelli/_apps/SimplePHPApp.TEST_PHP.d-e6kksc38lmed3764772c",
      "language": "text"
    }
  ]
}
[/block]
The Distelli specific environment variable DISTELLI_APPHOME is below. It is here that a symlink to the contents of the above directory is created after PostInstall.
[block:code]
{
  "codes": [
    {
      "code": "/distelli/env/TEST_PHP",
      "language": "text"
    }
  ]
}
[/block]
For more information on deployment environment variables see [Environment Variables](doc:environment-variables) reference guide.

When doing a deployment the distelli-manifest.yml shell scripts will be here:
[block:code]
{
  "codes": [
    {
      "code": "/distelli/_apps/SimplePHPApp.TEST_PHP.d-e6kksc38lmed3764772c/bin",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Change to User Distelli"
}
[/block]
You can switch your user to the Distelli user with the following command:
[block:code]
{
  "codes": [
    {
      "code": "$ sudo su - distelli",
      "language": "text"
    }
  ]
}
[/block]
This will cause you to become user **distelli** so that when you execute any deployment scripts, you will be executing them with the same user and permissions that are used when Distelli does the deploy; and you can see the exact behavior.
[block:api-header]
{
  "type": "basic",
  "title": "Check Environment Variables"
}
[/block]
The file below holds the script that initializes the deployment environment variables. For more information on using environment variables with Distelli see the [Environment Variables Reference Guide](doc:environment-variables).
[block:code]
{
  "codes": [
    {
      "code": "/distelli/_apps/SimplePHPApp.TEST_PHP.d-e6kksc38lmed3764772c/bin/distelli-env.sh",
      "language": "text"
    }
  ]
}
[/block]
Using the cat command you can look at the contents of this file and the environment variables used for this applications deployment.
[block:code]
{
  "codes": [
    {
      "code": "$ cat distelli-env.sh",
      "language": "text"
    }
  ]
}
[/block]
For example:
[block:code]
{
  "codes": [
    {
      "code": "export DISTELLI_APPNAME=SimplePHPApp\nexport DISTELLI_INSTALLHOME=/distelli/_apps/SimplePHPApp.TEST_PHP.d-e6kksc38lmed3764772c\nexport DISTELLI_APPHOME=/distelli/envs/TEST_PHP\n# Variable Injected from Manifest\nexport PORT=8006",
      "language": "shell"
    }
  ]
}
[/block]
When troubleshooting it is helpful to “source” the distelli-env.sh file to your environment so that the environment variables are populated in your shell:
[block:code]
{
  "codes": [
    {
      "code": "$ source bin/distelli-env.sh",
      "language": "text"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "When Distelli runs the various scripts ‘getconf PATH’ is called. This is important to note as the PATH may not be what you expect."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "distelli-manifest.yml Phase Files"
}
[/block]
Each phase of the deployment, for example PreInstall, PostInstall, Run (Exec), Restart, Terminate, and others will have an individual bash shell script (or batch on windows) file in:
[block:code]
{
  "codes": [
    {
      "code": "/distelli/_apps/SimplePHPApp.TEST_PHP.d-e6kksc38lmed3764772c/bin/",
      "language": "text"
    }
  ]
}
[/block]
The naming format for these files is:
[block:code]
{
  "codes": [
    {
      "code": "distelli-MANIFESTSECTION.sh",
      "language": "text"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "success",
  "body": "This naming format is true except for the “Exec” section which is instead “run”."
}
[/block]
For example:
[block:code]
{
  "codes": [
    {
      "code": "distelli-preinstall.sh\ndistelli-install.sh\ndistelli-postinstall.sh\ndistelli-run.sh            <Exec phase\ndistelli-preterminate.sh\ndistelli-start.sh\n…and more",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Inspecting Deploy Steps"
}
[/block]
You can view and execute the various deployment phase scripts manually. It is suggested that if you do run a script, ensure you have switched to [user distelli](#change-to-user-distelli). For example:
[block:code]
{
  "codes": [
    {
      "code": "$ cat bin/distelli-preinstall.sh\n\nexport DISTELLI_APPNAME=SimplePHPApp\nexport DISTELLI_INSTALLHOME=/distelli/_apps/SimplePHPApp.TEST_PHP.d-e6kksc38lmed3764772c\nexport DISTELLI_APPHOME=/distelli/envs/TEST_PHP\nset -e\n# Variable Injected from Manifest\nexport PORT=8006\nsudo apt-get -y install php5-cli",
      "language": "shell"
    }
  ]
}
[/block]
Note that Distelli inserts the “set -e” option. This causes the entire script to exit on any single failure. It may be helpful in troubleshooting to add an option:
  * set +e        Revert the set -e behavior so that a single failure does not cause the entire script to end
  * set -e        Change the behavior back to Distelli default
  * set -x        Bash will provide debugging information on commands being executed
  * set +x        Turn off Bash debugging

An alternative may be to use the `|| true` at the end of a command that may fail. Here is an example:
[block:code]
{
  "codes": [
    {
      "code": "eval \"$(~/.rbenv/bin/rbenv init -) || true\"",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "The distelli-manifest.yml Exec"
}
[/block]
Some notes regarding the Exec: section in the distelli-manifest.yml file. Here is an example:
[block:code]
{
  "codes": [
    {
      "code": "  Exec:\n    - echo \"Distelli Exec Starting.\"\n    - node server.js",
      "language": "yaml"
    }
  ]
}
[/block]
The last line of this section will be the process that is monitored by Distelli. In the above example, the “node server.js” process will be monitored by Distelli. That is why I did not include a final echo statement in this section.

On Windows, the Exec: section should only have 1 line (entry).
[block:api-header]
{
  "type": "basic",
  "title": "Which Step Occurs in Which Directory"
}
[/block]
DISTELLI_INSTALLHOME
/distelli/_apps/SimplePHPApp.TEST_PHP.d-e6kksc38lmed3764772c/
[block:parameters]
{
  "data": {
    "0-0": "PreInstall",
    "0-1": "bin/distelli-preinstall.sh",
    "1-0": "Install",
    "1-1": "bin/distelli-install.sh",
    "2-0": "PostInstall",
    "2-1": "bin/distelli-postinstall.sh"
  },
  "cols": 2,
  "rows": 3
}
[/block]
DISTELLI_APPHOME
/distelli/envs/TEST_PHP/
[block:parameters]
{
  "data": {
    "0-0": "Exec",
    "1-0": "PreStart",
    "2-0": "Start",
    "3-0": "PostStart",
    "4-0": "PreTerminate",
    "5-0": "Terminate",
    "6-0": "PostTerminate",
    "7-0": "PreRestart",
    "8-0": "PostRestart",
    "0-1": "bin/distelli-run.sh",
    "1-1": "bin/distell-prestart.sh",
    "2-1": "bin/distelli-start.sh",
    "3-1": "bin/distelli-poststart.sh",
    "4-1": "distelli-preterminate.sh",
    "5-1": "distelli-terminate.sh",
    "6-1": "distelli-postterminate.sh",
    "7-1": "distelli-prerestart.sh",
    "8-1": "distelli-postrestart.sh"
  },
  "cols": 2,
  "rows": 9
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Other Sources of Help"
}
[/block]
First and foremost, remember we are always here to help. You can contact Distelli [support](http://www.distelli.com/support).

Our library of example deployment tutorials is steadily growing. You can find them here [Tutorials Index](doc:tutorials-index).

Our library of example manifest can be found here [Manifest Library of Examples](doc:distelli-manifest-library-of-examples).

A great reference for Bash scripting can be found [here](http://www.tldp.org/LDP/abs/html/).