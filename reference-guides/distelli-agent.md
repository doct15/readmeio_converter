---
title: "Distelli Agent"
excerpt: ""
---
The Distelli Agent runs on your server and enables it to build and test your code, and consume deployments from the Distelli Platform. The agent is currently supported on Linux, Windows, and  Mac OS.
[block:api-header]
{
  "type": "basic",
  "title": "Contents"
}
[/block]
[Installing the Agent](#installing-the-agent)
[Installation Options](#installation-options)
[Automating the Install](#automating-install-with-etcdistelliyml)
[Upgrading the Agent](#upgrading-the-agent)
[Agent Commands](#agent-commands)
[block:api-header]
{
  "type": "basic",
  "title": "Installing the Agent"
}
[/block]
The Distelli agent connects your destination server to Distelli for consuming application deployments. The agent is also required if you will be using Distelli to build on your own servers. For more info see [Using your own Build Server](doc:using-your-own-build-server).

To install the agent on your destination server run the command below that is appropriate for your servers OS.
[block:callout]
{
  "type": "warning",
  "body": "This installation requires root (administrator) permissions."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Linux and MAC OS X"
}
[/block]
To install on Linux or MAC OS X you can use either curl **or** wget with one of the following syntaxes.

##wget example
[block:code]
{
  "codes": [
    {
      "code": "wget -qO- https://www.distelli.com/download/agent/install | sh",
      "language": "text"
    }
  ]
}
[/block]

##curl example
[block:code]
{
  "codes": [
    {
      "code": "curl -sSL https://www.distelli.com/download/agent/install | sh",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Windows"
}
[/block]
To install on Windows copy and paste the following powershell command into a command (cmd) window.
[block:code]
{
  "codes": [
    {
      "code": "powershell -NoProfile -ExecutionPolicy Bypass -Command \"iex ((new-object net.webclient).DownloadString('https://www.distelli.com/download/cli/install.ps1'))\" & SET PATH=%PATH%;%ProgramFiles%\\Distelli",
      "language": "shell"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Verify the Install"
}
[/block]
To validate the agent is installed and working use the `dagent status` command.
[block:callout]
{
  "type": "warning",
  "body": "This command requires root (administrator) access to run."
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "# dagent status\nDistelli Agent (serverA) is Running with id 766b88c8-e925-11e4-ae8b-080027cc07f7\n",
      "language": "shell"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Installation Options"
}
[/block]
During the install you can specify installation options to set the server name and control the startup behavior of the agent.

# SYNTAX LINUX & MAC OS X
[block:code]
{
  "codes": [
    {
      "code": "[wget|curl] https://www.distelli.com/download/agent/install | sh -s -- [-name <servername>][-onboot][-nostart][-readyml]",
      "language": "text"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "Note the above syntax sh(space)(dash)s(space)(dash)(dash)(space)(options)\nsh -s -- [-name <servername>][-onboot][-nostart][-readyml]"
}
[/block]
# SYNTAX WINDOWS
[block:callout]
{
  "type": "warning",
  "body": "The install options are currently unavailable for Windows."
}
[/block]

# OPTIONS
[block:code]
{
  "codes": [
    {
      "code": "-name <servername>",
      "language": "text"
    }
  ]
}
[/block]
When installing the agent it will use the hostname for the Distelli server name. You can override this behavior by using the **-name** option and specify your own server name from the command line during installation.
[block:code]
{
  "codes": [
    {
      "code": "-nostart",
      "language": "text"
    }
  ]
}
[/block]
The -nostart option tells the Distelli agent to not start ever. To start the agent after installing with this option requires manual intervention of running the [dagent install](#dagent-install) or [dagent start](#dagent-start) command.
[block:code]
{
  "codes": [
    {
      "code": "-onboot",
      "language": "text"
    }
  ]
}
[/block]
The -onboot option tells the agent to not start until the next time the server is booted.
[block:code]
{
  "codes": [
    {
      "code": "-readyml",
      "language": "text"
    }
  ]
}
[/block]
The -readyml option tells the agent installer to read a distelli.yml file and use the credentials and other options for installation parameters. For more information on using the distelli.yml see [Distelli distelli.yml Usage](doc:distelli-distelliyml-usage).

#EXAMPLES
Install the agent and specify the server name of *ServerA* and 
[block:code]
{
  "codes": [
    {
      "code": "# wget -qO- https://www.distelli.com/download/agent/install | sh -s -- -name ServerA -nostart",
      "language": "text"
    }
  ]
}
[/block]
Install the agent and specify to not start until the next boot.
[block:code]
{
  "codes": [
    {
      "code": "# curl -sSL https://www.distelli.com/download/agent/install | sh -s -- -onboot",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Automating Install with /etc/distelli.yml"
}
[/block]
For more information on the /etc/distelli.yml file see [Distelli distelli.yml Usage](doc:distelli-distelliyml-usage).
[block:api-header]
{
  "type": "basic",
  "title": "Upgrading the Agent"
}
[/block]
To upgrade the Distelli agent, simply re-install the agent on top of the existing agent. This will perform an upgrade.
[block:callout]
{
  "type": "info",
  "body": "During the upgrade you can specify [install options](#installation-options)."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Agent Commands"
}
[/block]
The following is an alphabetical listing of the agent commands.

[dump](#dagent-dump)
[help](#dagent-help)
[install](#dagent-install)
[loglevel](#dagent-loglevel)
[rename](#dagent-rename)
[run](#dagent-run)
[start](#dagent-start)
[status](#dagent-status)
[stop](#dagent-stop)
[uninstall](#dagent-uninstall)
[version](#dagent-version)
[block:api-header]
{
  "type": "basic",
  "title": "dagent dump"
}
[/block]
Prints the agent processes, deployed applications, and current deployments.

# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "dagent dump",
      "language": "text"
    }
  ]
}
[/block]
# OPTIONS

none

# USAGE

This command is typically used for troubleshooting or to quickly see what applications are deployed and running on the server.

# EXAMPLES
[block:code]
{
  "codes": [
    {
      "code": "# dagent dump\nProcesses:\n    DistelliAgent             Running    1136  2015-07-08 13:14:01 PDT (3 hours ago)\n    envs/SA_Linux             Running    13200 2015-07-08 16:40:11 PDT (2 minutes ago)\n\nApps:\n    d123:simpleapp:sa_linux Running /distelli/envs/SA_Linux/bin/distelli-run.sh Daemon\n        d-a123456789b123456789\n        a-c987654321d987654321\n        -1/10/900/900/900\n",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "dagent help"
}
[/block]
Prints the agent commands and brief help message for each.

# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "dagent help",
      "language": "text"
    }
  ]
}
[/block]
# OPTIONS

None

# USAGE

Use to get help.

# EXAMPLE
[block:code]
{
  "codes": [
    {
      "code": "$ dagent help\nUsage: dagent -dtk-dir <dir> <command>\n\nConnect your server to Distelli\n\n  -dtk-dir <dir>\n    Undocumented, defaults to /distelli\n\n  stop\n    Stops all processes being supervised, and stops the supervisor, use with CAUTION since all applications deployed (and the agent) will be stopped\n\n  version\n    Display the version of the agent\n\n  rename [<name>]\n    Rename the agent, or if no agent name is given, reset the server name\n\n  status\n    Check if the agent is running and print the server name\n\n  uninstall\n    Uninstall the Distelli agent permanently.\n\n  run\n    Run the Distelli agent in the foreground, printing log files to STDERR. This command should only be ran as a child of `dtk supervise`.\n\n  install\n    Install and possibly start (or restart) the agent.\n\n  dump\n    Print the processes, applications, and current deployments\n\n  loglevel debug|info|warn|error\n    Set the log level\n\n  start\n    Start (or restart) the agent.\n\n  supervise\n    Undocumented\n",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "dagent install"
}
[/block]
Install and possibly start (or restart) the agent.

# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "dagent install [-name <servername>] [-nostart] [-onboot] [-readyml]",
      "language": "text"
    }
  ]
}
[/block]
# OPTIONS
[block:code]
{
  "codes": [
    {
      "code": "-name <servername>",
      "language": "text"
    }
  ]
}
[/block]
Allows you to specify a different name for the server than the default.
[block:code]
{
  "codes": [
    {
      "code": "-nostart",
      "language": "text"
    }
  ]
}
[/block]
This will install the agent, but not start it. Manual action will be required to start the agent.
[block:code]
{
  "codes": [
    {
      "code": "-onboot",
      "language": "text"
    }
  ]
}
[/block]
This will install the agent, but not start it. The agent will automatically start after the next reboot.
[block:code]
{
  "codes": [
    {
      "code": "-readyml",
      "language": "text"
    }
  ]
}
[/block]
This option tells the agent to read /etc/distelli.yml for the agent access token and secret key. See the [Distelli distelli.yml Usage](doc:distelli-distelliyml-usage) for more information. 

# USAGE

The [dagent install](#dagent-install) command can be used to change the agent behavior. Using this command you can specify install options, as noted above.

If you issue this command on a server that has running deployed software, it will continue to run. If you specify the -nostart option, the applications will not continue to run after a boot of the server. Doing a `dagent install` or `dagent start` will (re)start the deployed applications.
[block:callout]
{
  "type": "warning",
  "body": "The above comments assume the application running was started with the [Exec section of the distelli-manifest.yml](doc:distelli-manifest#exec)"
}
[/block]
# EXAMPLES

Reinstall the agent and change the server name to Host001.
[block:code]
{
  "codes": [
    {
      "code": "# dagent install -name Host001",
      "language": "text"
    }
  ]
}
[/block]
Reinstall the agent and tell it not to start until next boot.
[block:code]
{
  "codes": [
    {
      "code": "# dagent install -onboot",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "dagent loglevel"
}
[/block]
Set the agent logging level. Logging is done to /distelli/logs/agent.log. The default is **info**.
[block:callout]
{
  "type": "warning",
  "body": "Use of this command will typically only be done with Distelli support."
}
[/block]
# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "dagent loglevel debug|error|info|warn",
      "language": "text"
    }
  ]
}
[/block]
# OPTIONS
[block:code]
{
  "codes": [
    {
      "code": "debug",
      "language": "text"
    }
  ]
}
[/block]
Sets the logging level to debug. The highest level of logging.
[block:code]
{
  "codes": [
    {
      "code": "error",
      "language": "text"
    }
  ]
}
[/block]
Sets the logging level to error. The agent will only log errors.
[block:code]
{
  "codes": [
    {
      "code": "info",
      "language": "text"
    }
  ]
}
[/block]
Sets the logging level to info. The agent will log information messages that highlight progress. This is the default level.
[block:code]
{
  "codes": [
    {
      "code": "warn",
      "language": "text"
    }
  ]
}
[/block]
Sets the logging level to warn. Only potentially harmful situations will be logged.

# USAGE

This command will typically only be used under Distelli support instruction

# EXAMPLES

Set the logging level to **error**.
[block:code]
{
  "codes": [
    {
      "code": "# dagent loglevel error",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "dagent rename"
}
[/block]
Allows renaming of the agent server name in Distelli.

# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "dagent rename <servername>",
      "language": "text"
    }
  ]
}
[/block]
# OPTIONS
asdf



# USAGE

Use this command to rename your agent server name in Distelli. When you look at the server in the Distelli WebUI you will see this name.

# EXAMPLES

Change the server name to Host123.
[block:code]
{
  "codes": [
    {
      "code": "# dagent rename Host123",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "dagent run"
}
[/block]
This is an internal command used to run the agent.
[block:callout]
{
  "type": "warning",
  "body": "Use of this command will typically only be done with Distelli support."
}
[/block]

# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "dagent run",
      "language": "text"
    }
  ]
}
[/block]

# OPTIONS

None.

# USAGE

This command is used by internal mechanisms to run the agent.

# EXAMPLES

None.
[block:api-header]
{
  "type": "basic",
  "title": "dagent start"
}
[/block]
This will start the agent. if the agent is already running, this will restart the agent.

# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "dagent start",
      "language": "text"
    }
  ]
}
[/block]
# OPTIONS

None.

# USAGE

Used to start the agent. If the agent was installed with the -nostart option, this command `dagent start` will start the agent.

# EXAMPLES

Starting the agent.
[block:code]
{
  "codes": [
    {
      "code": "# dagent start\nRunning under 'jdoe' account\nStarting upstart daemon with name:\tdtk-supervise-cc123345677ad94a8d34ac610381242f9ae28bb8",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "dagent status"
}
[/block]
Shows the current status of the agent.

# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "dagent status",
      "language": "text"
    }
  ]
}
[/block]
# OPTIONS

None.

# USAGE

Use this command to check the status of the agent. This is useful to confirm installation of the agent.

# EXAMPLES

Look at the status of a running agent
[block:code]
{
  "codes": [
    {
      "code": "# dagent status\nDistelli Agent (serverA) is Running with id 766b88c8-e925-11e4-ae8b-080027cc07f7",
      "language": "text"
    }
  ]
}
[/block]
Look at the status of a stopped agent
[block:code]
{
  "codes": [
    {
      "code": "# dagent status\nDistelli Agent is Stopped",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "dagent stop"
}
[/block]
Stops the running agent.

# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "dagent stop",
      "language": "text"
    }
  ]
}
[/block]
# OPTIONS

None.

# USAGE

Use this to stop the agent running in the background.

# EXAMPLES

Stop the agent.
[block:code]
{
  "codes": [
    {
      "code": "# dagent stop",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "dagent uninstall"
}
[/block]
Use this to uninstall the agent.

# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "dagent uninstall",
      "language": "text"
    }
  ]
}
[/block]
# OPTIONS
[block:code]
{
  "codes": [
    {
      "code": "--yes",
      "language": "text"
    }
  ]
}
[/block]
The --yes option facilitates a quiet deletion and auto answers *yes* to the *Continue? (yes/no)* prompt.

# USAGE

Uninstalling the agent will cause the agent to stop running and for the agent to destroy its Unique ID (UID). 

* All Distelli deployed applications will be removed from the server.
* The server will be removed from all environments.
* The server will be removed from its Distelli account.
* The agent supervise process will no longer start at boot.

Uninstalling the agent doesn't remove the agent files which will allow a future [dagent install](#dagent-install).

# EXAMPLES
[block:code]
{
  "codes": [
    {
      "code": "# dagent uninstall\nAre you sure you want to uninstall the Distelli Agent? (to avoid this prompt, pass --yes flag)\n  * All applications will be removed from this server\n  * The server will be removed from all environments\n  * The server will be removed from the web interface\n  * The supervise process will be removed from 'upstart'\nContinue? (yes/no)\nyes\n#",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "dagent version"
}
[/block]
Shows the current version of the installed agent.

# SYNTAX
[block:code]
{
  "codes": [
    {
      "code": "dagent version",
      "language": "text"
    }
  ]
}
[/block]
# OPTIONS

None.

# USAGE

# EXAMPLES
[block:code]
{
  "codes": [
    {
      "code": "# dagent version\nDistelli Agent 3.34\nCopyright (C) 2015 Distelli Inc.",
      "language": "text"
    }
  ]
}
[/block]