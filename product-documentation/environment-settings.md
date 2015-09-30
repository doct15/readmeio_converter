---
title: "Environment Settings"
excerpt: ""
---
Application environments have configurable settings.
[block:api-header]
{
  "type": "basic",
  "title": "Description"
}
[/block]
This is the environment description.
[block:api-header]
{
  "type": "basic",
  "title": "Auto Deploy the Active Release when a new Server joins the Environment"
}
[/block]
If this feature is checked (enabled), when adding servers to environments via a [Distelli distelli.yml Usage](doc:distelli-distelliyml-usage)  file, Distelli will initiate a deploy of the latest successful release to the server.

This is checked (enabled) by default.

For more info see [Distelli distelli.yml Usage](doc:distelli-distelliyml-usage).
[block:api-header]
{
  "type": "basic",
  "title": "Send a Notification when a Deployment to this Environment Completes"
}
[/block]
If this feature is checked (enabled), when a deployment completes, a notification will be sent to all the notification types that have been added.

This is unchecked (disabled) by default.
[block:api-header]
{
  "type": "basic",
  "title": "Send an Additional Notification when a Deployment Starts"
}
[/block]
If this feature is checked (enabled), when a deployment begins, a notification will be sent to all the notification types that have been added.

This is unchecked (disabled) by default.
[block:api-header]
{
  "type": "basic",
  "title": "Notifications"
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "For more info on notifications, see [Notifications](doc:notifications)."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)