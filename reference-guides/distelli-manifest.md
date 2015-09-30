---
title: "Distelli Manifest"
excerpt: ""
---
The Distelli application manifest is a YAML configuration file that is saved with your application code, that describes how your application is to be packaged and the commands to be run when it is deployed. An application manifest is required for each application that is going to be deployed using Distelli.

Also see [Deployment Types](doc:deployment-types) for information on which manifest sections are executed during which deployment types.
[block:api-header]
{
  "type": "basic",
  "title": "YAML Format"
}
[/block]
The manifest is in YAML format with the root element of the YAML being the username and name of the application separated by a slash and terminated by a colon (:).

Indentation using spaces, not tabs, is critical.
# Using multilines in YAML

There are 2 types of multilines in YAML:
* Literal style **|**
* Folded style **>** 

Literal style - will keep the newlines and spacing as is.
Folded style - replaces newlines with spaces and concatenates the lines.

Below exemplifies using each.
[block:code]
{
  "codes": [
    {
      "code": "jdoe/RubyUbuntuRbenvApp:\n  Env:\n    - EXAMPLE: >\n        This is an example environment variable\n        that spans multiple lines.\n        Becuase it uses folded, the newlines will\n        be changed to spaces.\n  PreInstall:\n    - echo \"Begin PreInstall\"\n    - VARRUBY=\"$(ruby -v || true)\"\n    - if [[ ${VARRUBY:0:10} == \"ruby 1.9.3\" ]]; then\n    -   echo \"ruby 1.9.3 exists\"\n    - else\n    -\n    |\n      echo \"Installing ruby 1.9.3\"\n      rbenv install -v 1.9.3-p551\n      rbenv global 1.9.3-p551\n      ruby -v\n    - fi\n  Exec: \n    - echo \"begin exec\"\n    - eval \"$(~/.rbenv/bin/rbenv init -)\"\n    - exec ./bundle/bin/thin start -p $PORT -e $STAGE\n    - echo \"end exec\"\n  PostInstall:\n    - echo \"begin PostInstall\"\n    - eval \"$(~/.rbenv/bin/rbenv init -)\"\n    -\n    >\n      bundle install\n      --binstubs $DISTELLI_APPHOME/bundle/bin\n      --standalone\n      --path $DISTELLI_APPHOME/bundle/lib\n    - echo \"done PostInstall\"\n  PkgInclude:\n    - lib/simplerubyapp/*.rb\n    - Gemfile\n    - config.ru\n    - SimpleRubyApp.gemspec\n",
      "language": "yaml"
    }
  ]
}
[/block]
### Literal
With literal, the newline is kept intact. The below example will run 4 commands.
[block:code]
{
  "codes": [
    {
      "code": "    -\n    |\n      echo \"Installing ruby 1.9.3\"\n      rbenv install -v 1.9.3-p551\n      rbenv global 1.9.3-p551\n      ruby -v",
      "language": "yaml"
    }
  ]
}
[/block]
### Folded

With folded, the newline is converted to spaces so that it becomes a single concatenated string. 
[block:code]
{
  "codes": [
    {
      "code": "  Env:\n    - EXAMPLE: >\n        This is an example environment variable\n        that spans multiple lines.\n        Becuase it uses folded, the newlines will\n        be changed to spaces.\n",
      "language": "yaml"
    }
  ]
}
[/block]
The below example will run 1 command.
[block:code]
{
  "codes": [
    {
      "code": "    -\n    >\n      bundle install\n      --binstubs $DISTELLI_APPHOME/bundle/bin\n      --standalone\n      --path $DISTELLI_APPHOME/bundle/lib\n",
      "language": "yaml"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "Note the first line before the multiline must be an empty line starting with a dash."
}
[/block]
For more information on the YAML format, see <a href="http://www.yaml.org/" target="_blank">http://www.yaml.org/</a>.
[block:api-header]
{
  "type": "basic",
  "title": "Sections of the Application Manifest"
}
[/block]
The application manifest can have several sections. 

[block:parameters]
{
  "data": {
    "0-0": "[Application Name](#application-name)",
    "1-0": "[PkgInclude](#pkginclude)",
    "2-0": "[PkgExclude](#pkgexclude)",
    "0-1": "Required",
    "1-1": "Optional",
    "2-1": "Optional",
    "3-0": "[CommitData](#commitdata)",
    "4-0": "[Exec](#exec)",
    "4-1": "Optional",
    "3-1": "Optional",
    "5-0": "[Env](#env)",
    "5-1": "Optional",
    "8-0": "[PreInstall](#preinstall)",
    "8-1": "Optional",
    "9-0": "[Install](#install)",
    "9-1": "Optional",
    "10-0": "[PostInstall](#postinstall)",
    "10-1": "Optional",
    "11-0": "[PreRestart](#prerestart)",
    "11-1": "Optional",
    "12-0": "[PostRestart](#postrestart)",
    "12-1": "Optional",
    "13-0": "[PreStart](#prestart)",
    "13-1": "Optional",
    "14-0": "[Start](#start)",
    "14-1": "Optional",
    "15-0": "[PostStart](#poststart)",
    "15-1": "Optional",
    "16-0": "[PreTerminate](#preterminate)",
    "16-1": "Optional",
    "17-0": "[Terminate](#terminate)",
    "17-1": "Optional",
    "18-0": "[PostTerminate](#postterminate)",
    "18-1": "Optional",
    "19-0": "[PreInstallTimeout](#preinstalltimeout)",
    "19-1": "Optional",
    "20-0": "[InstallTimeout](#installtimeout)",
    "20-1": "Optional",
    "21-0": "[PostInstallTimeout](#postinstalltimeout)",
    "21-1": "Optional",
    "22-0": "[PreRestartTimeout](#prerestarttimeout)",
    "22-1": "Optional",
    "23-0": "[PostRestartTimeout](#postrestarttimeout)",
    "23-1": "Optional",
    "24-0": "[PreStartTimeout](#prestarttimeout)",
    "24-1": "Optional",
    "25-0": "[StartTimeout](#starttimeout)",
    "25-1": "Optional",
    "26-0": "[PostStartTimeout](#poststarttimeout)",
    "26-1": "Optional",
    "27-0": "[PreTerminateTimeout](#preterminatetimeout)",
    "28-0": "[TerminateTimeout](#terminatetimeout)",
    "29-0": "[PostTerminateTimeout](#postterminatetimeout)",
    "27-1": "Optional",
    "28-1": "Optional",
    "29-1": "Optional",
    "4-2": "Overrides [Start](#start)",
    "14-2": "Overridden by [Exec](#exec)",
    "h-0": "Manifest Section",
    "h-1": "Optional/Required",
    "h-2": "Notes",
    "9-2": "Replaces [PkgInclude](#pkginclude) unbundle step",
    "0-2": "",
    "1-2": "If used with [Install](#install) files will not be unbundled on deploy",
    "6-0": "[PreRelease](#prerelease)",
    "6-1": "Optional",
    "7-0": "[ReleaseNotesCmd](#releasenotescmd)",
    "7-1": "Optional"
  },
  "cols": 3,
  "rows": 30
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Application Name"
}
[/block]
The first line of the application manifest must be the Distelli account username and the application name separated by a slash and terminated with a colon.
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  # Manifest sections follow",
      "language": "yaml"
    }
  ]
}
[/block]
The username and application name are required.
[block:api-header]
{
  "type": "basic",
  "title": "PkgInclude"
}
[/block]
The list of files to include in the package. This is a list of strings that identify paths with optional wildcards that must be included in the package.
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PkgInclude:\n    - 'file.txt'\n    - 'lib/'\n    - '*.json'",
      "language": "yaml"
    }
  ]
}
[/block]
You can use wildcards such as to **include everything or /*/** to include all files within subdirectories.

If you skip this section no files will be bundled in your release.

If your manifest includes an [Install](#install) section, these files will not be unbundled to the destination server on deploy.

If a file is listed in PkgExclude and PkgInclude, it will be excluded.
[block:api-header]
{
  "type": "basic",
  "title": "PkgExclude"
}
[/block]
The PkgExclude section of the manifest is a list of strings that identify paths and files with optional wildcards that must be excluded from the package:

[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PkgExclude:\n    - 'node_modules/'\n    - 'tmp'\n    - '.git'",
      "language": "yaml"
    }
  ]
}
[/block]
You can use wildcards such as to **exclude everything or /*/** to exclude all files within subdirectories.

If a file is listed in PkgExclude and PkgInclude, it will be excluded.
[block:api-header]
{
  "type": "basic",
  "title": "CommitData"
}
[/block]
This section specifies details for your source control so Distelli can automatically determine the commit point at which a particular release is built. There are two keys in this section:
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  CommitData:\n    - RepoType: Git\n    - RepoPath: .",
      "language": "yaml"
    }
  ]
}
[/block]
# RepoType
RepoType is the type of your source repository - `Git` or `Mercurial`.

# RepoPath 
RepoPath is the path to .git or .hg directories relative to the location of the manifest file.

With this option set, when you do a `distelli push` Distelli will track the latest repository commit along with this pushed release. You can see this on the application releases page.
[block:api-header]
{
  "type": "basic",
  "title": "Exec"
}
[/block]
This is an important section of the manifest.

This is a list of commands to execute to start the application. To ensure that your application process is properly monitored the last command must start your app in the foreground.
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  Exec:\n    - 'cp config.conf /etc/'\n    - '/usr/bin/node server.js'",
      "language": "yaml"
    }
  ]
}
[/block]
The last command of the Exec section will launch the process and the process **must** start in the foreground. This is convenient because you don't have to worry about restarting it on a new deployment or shutting it down on terminate. Distelli will do that for you. If the process crashes then Distelli will restart it for you.

However there are some apps (like nginx for example or apache) that you don't want distelli to manage for you because they have their own ways to start / stop and they run in the background. In that case you use Start.
[block:callout]
{
  "type": "info",
  "body": "The Distelli agent will monitor the application executed in the Exec: section of the manifest. If the application exits, the agent will attempt to restart the application. If you don't want this behavior you will want to use the manifest [Start](#start) section to start your application."
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "If an application process runs less than five minutes the restart timer will automatically back off until the application is running stable for greater than five minutes."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Env"
}
[/block]
This is a map of key value pairs that specify any environment variables that must be set before the application is started. These environment variables are available to the commands in all the sections of the manifest.
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  Env:\n    - PORT: '8080'\n    - DATE: '`date -u`'\n    - RVM_HOME: '/usr/local/rvm'\n    - SOME_VAR: '`cat /path/to/some/file`'",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PreRelease"
}
[/block]
These commands occur during a `distelli push`. Remember if you do a `distelli deploy` without the --revision option it will do a push first.
[block:callout]
{
  "type": "warning",
  "body": "The Distelli based [environment variables](doc:environment-variables) are not available during this phase of the manifest."
}
[/block]
# CLI
When you do a distelli push the PreRelease section will be executed first before the application is bundled and pushed to a Distelli account.

#WebUI
When deploying via the Distelli WebUI, the PreRelease steps will be executed on a build server. The build environment variables are available during the PreRelease build phase. 
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PreRelease:\n    - ./configure\n    - make\n    - sudo make install\n    - touch release_timestamp.file\n    - tar -czvf app.tgz app/*",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "ReleaseNotesCmd"
}
[/block]
This phase of the manifest occurs during a distelli push after the [PreRelease](#prerelease). The output of the commands in this section will be in the notes for the release. See [Viewing Release Notes](doc:viewing-release-notes).
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  ReleaseNotesCmd:\n    - 'hg log -l 10 -b default'",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PreInstall"
}
[/block]
This is a list of commands to run during the Pre-Install step of the deployment. If this section is omitted, the Pre-Install step is skipped. This runs before Install and is the first section to run in a deploy.

For more information on the Pre-Install step see the article on [Deployment Types](doc:deployment-types).
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PreInstall:\n    - 'echo \"Starting PreInstall for MyApp\"'\n    - 'cp /path/to/file /path/to/dest'",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Install"
}
[/block]
This is a list of commands to run during the install step of the deployment.

If this is omitted, it is during this phase that Distelli unbundles the files specified in the [PkgInclude](#pkginclude) section to the destination server.
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  Install:\n    - 'sudo apt-get install -y make'\n    - 'sudo apt-get install -y g++'\n    - 'wget http://nodejs.org/dist/v0.10.0/node-v0.10.0.tar.gz'\n    - 'tar -zxvf node-v0.10.0.tar.gz'\n    - 'cd node-v0.10.0'\n    - './configure'\n    - 'make'\n    - 'make install'\n    - 'echo \"Finished install of NodeJS\"'",
      "language": "text"
    }
  ]
}
[/block]
If this Install section is included, Distelli will not unbundle the files specified in the [PkgInclude](#pkginclude) section to the destination server. Distelli will instead process the commands in the Install section.
[block:api-header]
{
  "type": "basic",
  "title": "PostInstall"
}
[/block]
This is a list of commands to run during the Post-Install step of the deployment. If this section is omitted, the Post-Install step is skipped. 
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PostInstall:\n    - 'echo \"Starting PostInstall\"'\n    - 'source $RVM_HOME/scripts/rvm'\n    - 'rvm use 1.9.2'\n    - 'bundle install --binstubs ./bundle/bin --standalone --path ./bundle/lib'\n    - 'echo \"Finished PostInstall\"'",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PreRestart"
}
[/block]
This is a list of commands to run during the Pre-Restart step of the deployment. If this section is omitted, the Pre-Restart step is skipped.
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PreRestart:\n    - 'echo \"Running PreRestart step\"'\n    - 'remove-from-lb.sh;\n    - 'sleep 10'",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PostRestart"
}
[/block]
This is a list of commands to run during the Post-Restart step of the deployment. If this section is omitted, the Post-Restart step is skipped.
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PostRestart:\n    - 'echo \"Running PostRestart step\"'\n    - 'add-to-lb.sh'\n    - 'sleep 10'",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PreStart"
}
[/block]
This is a list of commands to run during the Pre-Start step of the deployment. If this section is omitted, the Pre-Start step is skipped. 
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PreStart:\n    - 'echo \"Running PreStart step\"'\n    - 'sleep 10'",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Start"
}
[/block]
This is a list of commands to run during the Start step of the deployment. If not included, the default behavior of the Start step is to start the process specified in the Exec section. 

If both the Start and Exec sections are included, the Exec section will supersede the Start section.
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  Start:\n    - 'echo \"Running Start step\"'\n    - 'sudo apachectl start'",
      "language": "yaml"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "Execution of applications in the Start section will not be monitored or restarted by the Distelli agent."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PostStart"
}
[/block]
This is a list of commands to run during the Post-Start step of the deployment. If this section is omitted, the Post-Start step is skipped.
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PostStart:\n    - 'echo \"Running PostStart step\"'\n    - 'sleep 10'",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PreTerminate"
}
[/block]
This is a list of commands to run during the Pre-Terminate step of the deployment. If this section is omitted, the Pre-Terminate step is skipped.
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PreTerminate:\n    - 'echo \"Running PreTerminate step\"'\n    - 'flush-all-data.sh'",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Terminate"
}
[/block]
This is a list of commands to run during the Terminate step of the deployment. If not included, the default behavior of the Terminate step is to terminate the process started in the Exec section.

[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PreTerminate:\n    - 'echo \"Running PreTerminate step\"'\n    - 'flush-all-data.sh'",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PostTerminate"
}
[/block]
This is a list of commands to run during the Post-Terminate step of the deployment. If this section is omitted, the Post-Terminate step is skipped. 
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PostTerminate:\n    - 'echo \"Running PostTerminate step\"'\n    - 'sleep 10'",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PreInstallTimeout"
}
[/block]
This is the time, in seconds, to wait for the Pre Install step to complete. If the Pre Install step takes longer than this value then it is stopped and the deployment is considered to have failed. The default value is 900 (15 minutes). 
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PreInstallTimeout: 1800",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "InstallTimeout"
}
[/block]
This is the time, in seconds, to wait for the Install step to complete. If the Install step takes longer than this value then it is stopped and the deployment is considered to have failed. The default value is 900 (15 minutes). 
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  InstallTimeout: 1800",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PostInstallTimeout"
}
[/block]
This is the time, in seconds, to wait for the Post Install step to complete. If the Post Install step takes longer than this value then it is stopped and the deployment is considered to have failed. The default value is 900 (15 minutes).
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PostInstallTimeout: 1800",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PreRestartTimeout"
}
[/block]
This is the time, in seconds, to wait for the Pre Restart step to complete. If the Pre Restart step takes longer than this value then it is stopped and the deployment is considered to have failed. The default value is 900 (15 minutes). 
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PreRestartTimeout: 1800",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PostRestartTimeout"
}
[/block]
This is the time, in seconds, to wait for the Post Restart step to complete. If the Post Restart step takes longer than this value then it is stopped and the deployment is considered to have failed. The default value is 900 (15 minutes). 
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PostRestartTimeout: 1800",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PreStartTimeout"
}
[/block]
This is the time, in seconds, to wait for the Pre Start step to complete. If the Pre Start step takes longer than this value then it is stopped and the deployment is considered to have failed. The default value is 900 (15 minutes). 
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PreStartTimeout: 1800",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "StartTimeout"
}
[/block]
This is the time, in seconds, to wait for the Start step to complete. If the Start step takes longer than this value then it is stopped and the deployment is considered to have failed. The default value is 900 (15 minutes). 
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  StartTimeout: 1800",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PostStartTimeout"
}
[/block]
This is the time, in seconds, to wait for the Post Start step to complete. If the Post Start step takes longer than this value then it is stopped and the deployment is considered to have failed. The default value is 900 (15 minutes). 
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PostStartTimeout: 1800",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PreTerminateTimeout"
}
[/block]
This is the time, in seconds, to wait for the Pre Terminate step to complete. If the Pre Terminate step takes longer than this value then it is stopped and the deployment is considered to have failed. The default value is 900 (15 minutes). 
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PreTerminateTimeout: 1800",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "TerminateTimeout"
}
[/block]
This is the time, in seconds, to wait for the Terminate step to complete. If the Terminate step takes longer than this value then it is stopped and the deployment is considered to have failed. The default value is 900 (15 minutes). 
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  TerminateTimeout: 1800",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PostTerminateTimeout"
}
[/block]
This is the time, in seconds, to wait for the Post Terminate step to complete. If the Post Terminate step takes longer than this value then it is stopped and the deployment is considered to have failed. The default value is 900 (15 minutes). 
[block:code]
{
  "codes": [
    {
      "code": "username/AppName:\n  PostTerminateTimeout: 1800",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Steps by Deploy Type"
}
[/block]
The values indicate the order the distelli-manifest.yml sections are processed depending on the deployment type.

The three deployment types (from left to right):
* Deploy
* Restart
* Terminate
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/jnydQu5QRG6fyqSF62GI",
        "manifest_chart.png",
        "678",
        "695",
        "#956a57",
        ""
      ]
    }
  ]
}
[/block]
For more information see [Deployment Types](doc:deployment-types) 
[block:api-header]
{
  "type": "basic",
  "title": "Questions or Comments?"
}
[/block]
We're always available to help you with your deployments. Feel free to [contact us](mailto:ping@distelli.com) with any questions or comments.