---
title: "Using a Repository"
excerpt: ""
---
<div><div style="float: left;">**<- go back to [Installing the Agent](doc:installing-the-agent-1)**</div><div style="float: right;">**go forward to [Editing the Manifest](doc:editing-the-manifest-1) ->**</div></div>
<br>

To use continuous deployment functionality you must use a software repository for storing your code.
[block:callout]
{
  "type": "warning",
  "body": "You must have a public software repository login/account to continue through this exercise."
}
[/block]
To continue through this exercise you must have a login to one of the two public repositories.
* <a href="https://github.com/" target="_blank">https://github.com/</a>
* <a href="https://bitbucket.org/" target="_blank">https://bitbucket.org/</a>

If your repository of choice is:
* Github, continue forward to [Fork Github Repository](#fork-github-repository).
* Bitbucket, continue forward to [For a Bitbucket Repository](#fork-bitbucket-repository).
[block:api-header]
{
  "type": "basic",
  "title": "Fork Github Repository"
}
[/block]
1. Ensure you are logged into your Github account. <a href="https://github.com/" target="_blank">https://github.com/</a>
2. Go to this pubilc Distelli repository: <a href="https://github.com/distelli/nodejsbuilddeploy" target="_blank">https://github.com/distelli/nodejsbuilddeploy</a>.
3. Click the **Fork** button (top right).
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/oyzyOAQeTJSNYdaDA5kt",
        "github_fork_repo_Training_App1.png",
        "993",
        "689",
        "#5b7baf",
        ""
      ]
    }
  ]
}
[/block]
You have forked the repository to your Github account. Good job!

You can view the forked repository in your Github account at:
[block:code]
{
  "codes": [
    {
      "code": "https://github.com/YOUR_GITHUB_USERNAME/nodejsbuilddeploy",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Clone Github Repository"
}
[/block]
You will need to clone a copy of the repository to your local machine. This assume you already have **git** installed on your local computer. If not you can install git from here: <a href="http://git-scm.com/" target="_blank">http://git-scm.com/</a>

Use the following syntax to clone the repository:
[block:code]
{
  "codes": [
    {
      "code": "git clone https://github.com/YOUR_GITHUB_USERNAME/nodejsbuilddeploy.git",
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
      "code": "git clone git@github.com:YOUR_GITHUB_USERNAME/nodejsbuilddeploy.git",
      "language": "text"
    }
  ]
}
[/block]
To continue please proceed to the [Next](#next) section.
[block:api-header]
{
  "type": "basic",
  "title": "Fork Bitbucket Repository"
}
[/block]
1. Ensure you are logged into your Bitbucket account. <a href="https://bitbucket.org/" target="_blank">https://bitbucket.org/</a>
2. Go to this pubilc Distelli repository: <a href="https://bitbucket.org/distelli/nodejsbuilddeploy" target="_blank">https://bitbucket.org/distelli/nodejsbuilddeploy</a>.
3. Click the 3 dots *actions* icon on the left.
4. Click the **Fork** option from the drop-own.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/do6uIeaJQlOPudMNDWms",
        "bitbucket_fork_repo_NodeExpres.png",
        "744",
        "403",
        "#245383",
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
      "code": "https://bitbucket.org/YOUR_BITBUCKET_USERNAME/nodejsbuilddeploy",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Clone Bitbucket Repository"
}
[/block]
You will need to clone a copy of the repository to your local machine. This assumes you already have **mercurial** installed on your local computer. If not you can install mercurial from here: <a href="https://mercurial.selenic.com/" target="_blank">https://mercurial.selenic.com/</a>

Use the following syntax to clone the repository:
[block:code]
{
  "codes": [
    {
      "code": "hg clone https://YOUR_BITBUCKET_USERNAME@bitbucket.org/distelli/nodeex\npress",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Next"
}
[/block]
<div><div style="float: left;">**<- go back to [Installing the Agent](doc:installing-the-agent-1)**</div><div style="float: right;">**go forward to [Editing the Manifest](doc:editing-the-manifest-1) ->**</div></div>