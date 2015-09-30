---
title: "Deleting an Application"
excerpt: ""
---
You can delete an application.
[block:callout]
{
  "type": "warning",
  "body": "You cannot delete an application that is currently deployed and running on servers. You must first [terminate the application](doc:terminating-an-application)."
}
[/block]

[block:callout]
{
  "type": "danger",
  "body": "This will delete the application, all its environments, and all historical information regarding the application, its releases, and deployments."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Delete an Application"
}
[/block]
1. Navigate to the application you want to delete. [Navigating to an Application](doc:navigating-to-an-application)
2. Click the **Settings** link.
3. Click **Delete Application** in the *Danger Zone*.

You will be presented with a dialog that asks; Are you sure you want to delete YOURAPP? To continue you must:

4. Type in the name of the application you are deleting.
5. Click the **Delete** button.

You have permanently removed the application.
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)