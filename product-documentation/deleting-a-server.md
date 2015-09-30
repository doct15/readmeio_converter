---
title: "Deleting a Server"
excerpt: ""
---
You can completely remove a server from Distelli via 2 methods.
* Delete a Server with the agent(#delete-a-server-with-the-agent).
* Delete a Server from the Distelli WebUI(#delete-a-server-from-the-webui).
[block:api-header]
{
  "type": "basic",
  "title": "Delete a Server with the Agent"
}
[/block]
Executing a `dagent uninstall` will:
* All Distelli deployed applications will be removed from the server.
* The server will be removed from all environments.
* The server will be removed from its Distelli account.
* The agent supervise process will no longer start at boot.
[block:callout]
{
  "type": "warning",
  "body": "This requires root or administrator access."
}
[/block]
## Syntax
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
## Options
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

## Examples
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
  "title": "Delete a Server from the WebUI"
}
[/block]
A server can be deleted from Distelli in the WebUI only if the server is unavailable/down.

1. Click the **Servers** link from the top of the Distelli WebUI.
2. Find the server you are wish to delete and click the red trash-can icon on the right.

You will be prompted to confirm

3. Click **Yes**.

You have removed the server from Distelli.
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)