---
title: "Go Language Build, Test, and Deploy"
excerpt: ""
---
This tutorial will get you setup, building, testing, and deploying an application with Distelli in minutes. 

The tutorial assumes you have already:
* [Created a free Distelli account](https://www.distelli.com/signup)
* Have a login to, at least, one of the two public repositories.
 - <a href="https://github.com/" target="_blank">https://github.com/</a>
 - <a href="https://bitbucket.org/" target="_blank">https://bitbucket.org/</a>
 
The scenario also expects that you have a **Destination** server available to do deployments of the example application.
[block:callout]
{
  "type": "warning",
  "body": "These build and deploy instructions are specific to the Ubuntu 14 OS."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 1. Prepare Server for Deployment"
}
[/block]
To enable auto deployment of an application you must have a destination server to deploy to.

If you don't have a server you can use a virtual server. For a simple guide to setting up a virtual server using Virtualbox and Vagrant see [Building Virtual Servers](doc:building-virtual-servers).

You must install the Distelli agent on the server to facilitate deployments. Instructions on installing the Distelli agent can be found here <a href="http://docs.distelli.com/docs/distelli-agent" target="_blank">Distelli agent reference guide.</a>

Install the agent and return to this document.
[block:api-header]
{
  "type": "basic",
  "title": "Step 2. Fork and Clone the Repository"
}
[/block]

If your repository of choice is:
* Github, continue forward to [Fork Github Repository](#section-fork-github-repository).
* Bitbucket, continue forward to [For a Bitbucket Repository](#section-fork-bitbucket-repository).

## Fork Github Repository

1. Ensure you are logged into your Github account. <a href="https://github.com/" target="_blank">https://github.com/</a>
2. Go to this pubilc Distelli repository: <a href="https://github.com/distelli/gobuilddeploy" target="_blank">https://github.com/distelli/gobuilddeploy</a>.
3. Click the **Fork** button (top right).

You have forked the repository to your Github account. Good job!

You can view the forked repository in your Github account at:
[block:code]
{
  "codes": [
    {
      "code": "https://github.com/YOUR_GITHUB_USERNAME/gobuilddeploy",
      "language": "text"
    }
  ]
}
[/block]
#### Clone Github Repository

You will need to clone a copy of the repository to your local machine. This assume you already have **git** installed on your local computer. If not you can install git from here: <a href="http://git-scm.com/" target="_blank">http://git-scm.com/</a>

Use the following syntax to clone the repository:
[block:code]
{
  "codes": [
    {
      "code": "git clone https://github.com/YOUR_GITHUB_USERNAME/gobuilddeploy.git",
      "language": "text"
    }
  ]
}
[/block]
Now change to the newly created directory.
[block:code]
{
  "codes": [
    {
      "code": "cd gobuilddeploy",
      "language": "text"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "danger",
  "body": "Note: If your Github account is using **Two-factor authentication** you will not be able to use the above command to clone and work with the repository. You must:\n* Use an SSH key with github <a href=\"https://help.github.com/articles/generating-ssh-keys/\" target=\"_blank\">https://help.github.com/articles/generating-ssh-keys/</a>\n* Use a different git clone syntax. See below:"
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "git clone git@github.com:YOUR_GITHUB_USERNAME/gobuilddeploy.git",
      "language": "text"
    }
  ]
}
[/block]
To continue please proceed to [Step 3. Edit the Distelli Manifest](#step-3-edit-the-distelli-manifest).

## Fork Bitbucket Repository

1. Ensure you are logged into your Bitbucket account. <a href="https://bitbucket.org/" target="_blank">https://bitbucket.org/</a>
2. Go to this pubilc Distelli repository: <a href="https://bitbucket.org/distelli/gobuilddeploy" target="_blank">https://bitbucket.org/distelli/gobuilddeploy</a>.
3. Click the 3 dots *actions* icon on the left.
4. Click the **Fork** option from the drop-own.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/dbEHtFfQTcKmbriOqiio",
        "bitbucket_fork_gobuilddeploy.png",
        "817",
        "453",
        "#265584",
        ""
      ]
    }
  ]
}
[/block]
You have forked the repository to your Bitbucket account. Good job!

You can view the forked repository in your Bitbucket account at:
[block:code]
{
  "codes": [
    {
      "code": "https://bitbucket.org/YOUR_BITBUCKET_USERNAME/gobuilddeploy",
      "language": "text"
    }
  ]
}
[/block]
#### Clone Bitbucket Repository

You will need to clone a copy of the repository to your local machine. This assumes you already have **mercurial** installed on your local computer. If not you can install mercurial from here: <a href="https://mercurial.selenic.com/" target="_blank">https://mercurial.selenic.com/</a>

Use the following syntax to clone the repository:
[block:code]
{
  "codes": [
    {
      "code": "hg clone https://YOUR_BITBUCKET_USERNAME@bitbucket.org/YOUR_BITBUCKET_REPO/gobuilddeploy",
      "language": "text"
    }
  ]
}
[/block]
Now change to the newly created directory.
[block:code]
{
  "codes": [
    {
      "code": "cd gobuilddeploy",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 3. Edit the Distelli Manifest"
}
[/block]
The Distelli Manifest file provides the Distelli Platform with the needed information to successfully build and deploy your application. This file must exist before building your application with Distelli.

The sample application you cloned will already have an existing `distelli-manifest.yml` file in the application root directory. You will need to make a small change to this file before you can build and deploy the application with Distelli.

Edit the `distelli-manifest.yml` file. 

On the first line you will see a <username> placeholder, and then the name of the sample application.

Replace the <username> placeholder with your Distelli username.  To find your Distelli username see [Finding Your Distelli Username](doc:finding-your-distelli-username).

For example if your username is 'YourUserName' your `distelli-manifest.yml` should look like this:
[block:code]
{
  "codes": [
    {
      "code": "YourUserName/gobuilddeploy\n  # Distelli Manifest example\n  # this example assumes the build and deploy servers are:\n  # The same architecture (32 vs 64 bit)\n  # Ubuntu 14.04 \n  # Installed Packages: apt-get\n  #\n  \n  PreRelease:\n    - echo \"–--Beginning PreRelease---\"\n    - echo \"--Installing build dependencies--\"\n    - echo \"-Updating apt-get-\"\n    - sudo apt-get -y update\n    - echo \"-Installing GoLang-\"\n    - sudo apt-get -y install golang\n    - echo “--Building--”\n    - cd src\n    - go build -o ../bin/server\n    - echo “--Testing--”\n    - go test\n    \n  PkgInclude:\n    - bin/server\n    \n  Env:\n    - PORT: \"8002\"\n\n  Exec:\n    - exec ./bin/server $PORT",
      "language": "text"
    }
  ]
}
[/block]
**Save your change.**
[block:api-header]
{
  "type": "basic",
  "title": "Step 4. Create the Application"
}
[/block]
In this step you will use the Distelli *new application workflow* to create an application that is integrated with the repository you forked above.

To complete this section you will navigate to another set of instructions. There you will walk through those instructions, afterwards returning here.

Certain fields will need tutorial specific information. The table below has that information.
[block:parameters]
{
  "data": {
    "h-0": "Name",
    "h-1": "Value",
    "0-0": "Name your App\nApplication Name",
    "0-1": "gobuilddeploy",
    "1-0": "Choose a Repo\nRepository Name",
    "2-0": "Choose a Branch\nBranch Name",
    "1-1": "gobuilddeploy",
    "2-1": "master"
  },
  "cols": 2,
  "rows": 3
}
[/block]

[block:callout]
{
  "type": "danger",
  "body": "After completing the **Tutorial Creating an Application from a Repository** return to this tutorial document."
}
[/block]
Navigate to <a href="http://docs.distelli.com/docs/tutorial-creating-an-application-from-a-repository" target="_blank">Tutorial Creating an Application from a Repository</a>, follow the steps in the document, and then return here.
[block:callout]
{
  "type": "success",
  "body": "Return here!"
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 5. Enable Auto Build"
}
[/block]
1. In the Distelli WebUI click **Applications** at the top.
2. In the application list click **gobuilddeploy** name to navigate to the application page.
3. Click the **Settings** link.

You are now in the application settings page.

4. Check the **Automatically build this branch when a new commit is pushed** box.
5. Click **Save Repo Settings**

You have enabled auto build. 
[block:callout]
{
  "type": "info",
  "body": "If you are interested in building on your own build server(s) see [Using your own Build Server](doc:using-your-own-build-server)."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 6. Enable Auto Deploy"
}
[/block]
1. In the Distelli WebUI click the **Applications** link at the top.
2. In the application list click **gobuilddeploy** name to navigate to the application page.
3. Click the **Settings** link.

You are now in the application settings page.

4. Scroll down and find the **Repository Settings** section.
5. Check the **Automatically deploy this branch when a build succeeds** box.
6. Click on the **gobuilddeploy-beta** environment to select it.
7. Click **Save Repo Settings**

You have enabled auto deploy.

[block:api-header]
{
  "type": "basic",
  "title": "Step 7. Add Server to Environment"
}
[/block]
In the last step you enabled auto deploy for the application environment, but this environment currently has no servers in it to deploy to.

In this step you will add the server, from step 1, to the -beta environment.

1. In the Distelli WebUI click the **Applications** link at the top.
2. In the application list click **gobuilddeploy** name to navigate to the application page.
3. Click the **Environments** link.
4. Click the **gobuilddeploy-beta** environment.

You are now at the environment page.

5. Click the **Servers** link in the environment section.
6. Click **Add Servers**.

You should see the server from step 1 in the server list.

7. Check the **Add Server** box for the server from step 1.
8. Click the **Add Selected Servers** link near the top left

You have added a server to the environment.
[block:api-header]
{
  "type": "basic",
  "title": "Step 8. Trigger a Build"
}
[/block]
In a previous step you edited and saved the distelli-manifest.yml file in the gobuilddeploy application directory. This constitutes a code change. You will now commit and push that code change up to your repository.

When the repository changes it will notify Distelli that a change occurred. This will trigger a build by Distelli.

Distelli will grab a copy of the repository; build it, test it, and if it is successful will create a release.

When a release is created this will trigger an auto deploy of the application to the -beta environment with the server from step 1.

If you are using:
* Github see [Push with Github](#section-push-with-github)
* Bitbucket see [Push with Bitbucket](#section-push-with-bitbucket)

## Push with Github

Enter the following commands in the `gobuilddeploy` directory:
[block:code]
{
  "codes": [
    {
      "code": "git add .\ngit commit -m \"Set username in manifest\"\ngit push -u origin master",
      "language": "text"
    }
  ]
}
[/block]
This will push your code change up to the repository.

Continue on to [Step 9. Watch the Build and Deploy Process](#step-9-watch-the-build-and-deploy-process).

## Push with Bitbucket

Enter the following commands in the `gobuilddeploy` directory:
[block:code]
{
  "codes": [
    {
      "code": "hg commit -m \"Set username in manifest\"\nhg push",
      "language": "text"
    }
  ]
}
[/block]
This will push your code change up to the repository.
[block:api-header]
{
  "type": "basic",
  "title": "Step 9. Watch the Build and Deploy Process"
}
[/block]
 1. Click the **Builds** link at the top of the Distelli WebUI.

In the builds list page you will see your build queued or in progress

2. Click on the build to navigate to the build page.

From the build page you can watch the build log. If the build fails see the [Troubleshooting](#troubleshooting) section below.
[block:api-header]
{
  "type": "basic",
  "title": "Step 10. Validation"
}
[/block]
To verify the application deployed correctly point your web browser to your destination server IP on port 8002.
[block:code]
{
  "codes": [
    {
      "code": "http://YOUR_SERVER_IP:8002",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Understanding the Distelli Manifest"
}
[/block]
The distelli-manifest.yml provides the instructions for building, testing, and deploying the application.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/z6rJqATlSwuKHTTtkRgA",
        "go-manifest-analysis.png",
        "703",
        "565",
        "#213f74",
        ""
      ]
    }
  ]
}
[/block]
For more information on the Distelli manifest see [Distelli Manifest](doc:distelli-manifest).
[block:api-header]
{
  "type": "basic",
  "title": "Troubleshooting"
}
[/block]
### Incorrect Manifest

If you see the following build failure:
[block:code]
{
  "codes": [
    {
      "code": "Task Status: Exit=1 Signal=0\n\nCloning into '/distelli/tasks/d461-762'...\nHEAD is now at 7db094e Update distelli-manifest.yml\nExpected manifest(s) to contain app 'YourUserName/gobuilddeploy'. Instead the manifest(s) specified:\n\t'<username>/gobuilddeploy'\n",
      "language": "text"
    }
  ]
}
[/block]
Ensure that you:
* Correctly edited the distelli-manifest.yml [Step 3](doc:go-language-build-test-and-deploy#step-3-edit-the-distelli-manifest).
* Committed and pushed the repository [Step 8](doc:go-language-build-test-and-deploy#step-8-trigger-a-build).

### Deploy Failure

For more information on troubleshooting deploys see [Troubleshooting Deploys](doc:troubleshooting-deploys).
[block:api-header]
{
  "type": "basic",
  "title": "Next"
}
[/block]
* [Tutorials Index](doc:tutorials-index) 
* [Manifest Library of Examples](doc:distelli-manifest-library-of-examples) 
* Read the Knowledge Base articles
* Check out the Reference Guides