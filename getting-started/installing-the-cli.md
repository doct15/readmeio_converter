---
title: "Installing the CLI"
excerpt: ""
---
<div><div style="float: left;">**&lt;- go back to [Installing the Agent](doc:installing-the-agent)**</div><div style="float: right;">**go forward to [Building an Application](doc:building-an-application) -&gt;**</div></div>
<br>

[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/VLbEfJKgTHmqGnHvbfw1",
        "distelli-components.png",
        "998",
        "247",
        "#5a96cc",
        ""
      ]
    }
  ]
}
[/block]
The Distelli CLI (Command Line Tool) allows you to create, bundle, push, and deploy your applications.

To install the CLI on your system follow the instructions below that are appropriate for your systems OS.
[block:callout]
{
  "type": "warning",
  "body": "This installation requires root (administrator) permissions."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "MAC OS X"
}
[/block]
Download and run the [MAC OS X installer here.](https://www.distelli.com/download/mac/DistelliCLI-1.88.pkg) 
[block:api-header]
{
  "type": "basic",
  "title": "Linux"
}
[/block]
To install on Linux you can use either curl **or** wget with one of the following syntaxes.

##wget example
[block:code]
{
  "codes": [
    {
      "code": "wget -qO- https://www.distelli.com/download/cli/setup | sh",
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
      "code": "curl -sSL https://www.distelli.com/download/cli/setup | sh",
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
Download and run the Windows installer for your version of Windows

[Windows 32 bit installer](https://www.distelli.com/download/win32/Distelli-1.88-x86.msi)
[Windows 64 bit installer](https://www.distelli.com/download/win64/Distelli-1.88-x64.msi) 
[block:api-header]
{
  "type": "basic",
  "title": "Login and Validate"
}
[/block]
To complete, and validate, the CLI installation; issue a `distelli login` command to login to your Distelli Account.
[block:callout]
{
  "type": "warning",
  "body": "This requires that you have already completed the [Creating an Account](doc:creating-an-account) steps."
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "# distelli login\n\nEmail: jdoe@distelli.com\nPassword:",
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
You have successfully installed the Distelli CLI and can now interact with your Distelli account using the Distelli CLI.

For more information on the Distelli CLI, see the [Distelli CLI Reference Guide](doc:distelli-cli).

To continue the Getting Started step by step guide continue on to [Building an Application](doc:building-an-application) 

<br>
<div><div style="float: left;">**&lt;- go back to [Installing the Agent](doc:installing-the-agent)**</div><div style="float: right;">**go forward to [Building an Application](doc:building-an-application) -&gt;**</div></div>