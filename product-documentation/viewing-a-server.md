---
title: "Viewing a Server"
excerpt: ""
---
There are several places you can view your server.
* View servers in the Distelli WebUI.
* View server information with the Distelli CLI.
* View server information with the Distelli agent.
[block:api-header]
{
  "type": "basic",
  "title": "View Servers in the Distelli WebUI"
}
[/block]
You can view your list of servers by simply clicking the **Servers** link at the top of the Distelli WebUI.
[block:api-header]
{
  "type": "basic",
  "title": "View a Server in the Distelli WebUI"
}
[/block]
To view a single server, click on the server name in the list of servers.

Below is an example server page.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/lCqkcKSgQiO6bY6ePDFQ",
        "webui_single_server.png",
        "1072",
        "618",
        "#499ed9",
        ""
      ]
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "View Server Information with the Distelli CLI"
}
[/block]
The following Distelli CLI command will list servers in a Distelli account.
[block:code]
{
  "codes": [
    {
      "code": "distelli list servers",
      "language": "text"
    }
  ]
}
[/block]
for more information see [Distelli CLI](doc:distelli-cli#list).
[block:api-header]
{
  "type": "basic",
  "title": "View Server Information with the Distelli agent"
}
[/block]
The following Distelli agent commands will show server information.
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
Show the status of the server and agent.
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
Show the Distelli deployed applications currently on the server.