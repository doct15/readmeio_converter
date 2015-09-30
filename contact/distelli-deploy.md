---
title: "Distelli Deploy"
excerpt: ""
---
The distelli deploy command deploys a release of your application to your server(s) or environment. 

You can deploy an existing release or create a new release and deploy it to a single server or an environment.
[block:code]
{
  "codes": [
    {
      "code": "distelli deploy [-f <manifest>] [-m <desc>] [-r <release-id>] [-e <environment>]",
      "language": "c"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Options"
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "-m, --message <desc>",
      "language": "c"
    }
  ]
}
[/block]
Use the supplied message as a description for the release and the deployment.
[block:code]
{
  "codes": [
    {
      "code": "-f, --manifest <manifest-filename>",
      "language": "c"
    }
  ]
}
[/block]
This option will use the specified manifest file from the current working directory when pushing a release. If this option is not supplied the bundle command uses the manifest file named *distelli-manifest.yml* if it is found in the current directory.
[block:code]
{
  "codes": [
    {
      "code": "-r, --release-id <release-id>",
      "language": "c"
    }
  ]
}
[/block]
This option specifies the release ID of a previously pushed release that is to be deployed. If this option is omitted then a new release is created and deployed.
[block:code]
{
  "codes": [
    {
      "code": "-h, --host <server-id>",
      "language": "c"
    }
  ]
}
[/block]
This option deploys the release to one server. The server ID must be the unique ID of the server as it appears in your distelli account.
[block:code]
{
  "codes": [
    {
      "code": "-e, --env <environment-owner/environment-name>",
      "language": "c"
    }
  ]
}
[/block]
This option deploys the release to one environment. The environment name must be the username of the owner of the environment and the environment name separated by a slash.
[block:code]
{
  "codes": [
    {
      "code": "-s, --stagger-size <stagger-size>",
      "language": "c"
    }
  ]
}
[/block]
This option specifies the stagger size when deploying to an environment via the -e option. The stagger size is the number of servers to deploy at a time when deploying to multiple servers in an environment. If this option is omitted the stagger size defaults to 10 servers.
[block:code]
{
  "codes": [
    {
      "code": "-d, --stagger-delay <stagger-delay>",
      "language": "c"
    }
  ]
}
[/block]
This option specifies the stagger delay when deploying to an environment via the -e option. The stagger delay is the time in seconds to wait between stagger sets when deploying to multiple servers in an environment. If this option is omitted the stagger delay defaults to 60 seconds.
[block:code]
{
  "codes": [
    {
      "code": "-y, --yes",
      "language": "c"
    }
  ]
}
[/block]
This option indicates that the CLI should not ask for confirmation and start the deployment immediately.
[block:code]
{
  "codes": [
    {
      "code": "-q, --quiet",
      "language": "c"
    }
  ]
}
[/block]
This option indicates that the CLI should not monitor the deployment till it completes and exit immediately after starting the deployment.

[block:api-header]
{
  "type": "basic",
  "title": "Examples"
}
[/block]
Push and deploy a new release to a single server:
[block:code]
{
  "codes": [
    {
      "code": "distelli deploy -m \"Initial Deploy of Simple App\" -e username/my-env\n    Pushing App: SimpleApplication\n    Uploading Bundle: [==========] 100%\n    Creating Release... DONE\n    Deploying username/SimpleApplication to server: username/myserver.mydomain.com\n\n    State: Waiting              [==========] ... OK\n    State: Pending              [==========] ... OK\n    State: PreInstalling        [==========] ... OK\n    State: PreInstalled         [==========] ... OK\n    State: Installing           [==========] ... OK\n    State: Installed            [==========] ... OK\n    State: PostInstalling       [==========] ... OK\n    State: PostInstalled        [==========] ... OK\n    State: Done                 [==========] ... OK\n\n    Deployment 2374 completed Successfully\n    See https://myaccount.distelli.com/deployment/2374",
      "language": "yaml"
    }
  ]
}
[/block]
Deploy an existing release to an environment
[block:code]
{
  "codes": [
    {
      "code": "$ distelli deploy -m \"Initial Deploy of Simple App\" -e username/my-env -r a-ksdjhasjkhaakn\n    Deploying username/SimpleApplication to environment: username/my-env\n\n    Release Id: a-ksdjhasjkhaakn\n\n    State: Waiting              [==========] ... OK\n    State: Pending              [==========] ... OK\n    State: PreInstalling        [==========] ... OK\n    State: PreInstalled         [==========] ... OK\n    State: Installing           [==========] ... OK\n    State: Installed            [==========] ... OK\n    State: PostInstalling       [==========] ... OK\n    State: PostInstalled        [==========] ... OK\n    State: Done                 [==========] ... OK\n\n    Deployment 2374 completed Successfully\n    See https://myaccount.distelli.com/deployment/2374",
      "language": "yaml"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Questions or Comments?"
}
[/block]
We're always available to help you with your deployments. Feel free to [contact us](mailto:ping@distelli.com) with any questions or comments.