---
title: "Connecting a Repository to an Application"
excerpt: ""
---
You can add a repository to an existing application. This will provide enhanced functionality for your application, including:
* Auto build on repository check-in.
* Auto deploy on successful build.

Repositories can be added to an application:
* [From the application settings](#add-a-repository-to-an-application).
* On application creation. See [Creating an Application from a Repository](doc:creating-an-application-from-a-repository).
[block:api-header]
{
  "type": "basic",
  "title": "Add a Repository to an Application"
}
[/block]
To add a repository to an existing application in Distelli:
1. In the Distelli WebUI click the **Applications** link at the top.
2. [Navigate to the application](doc:navigating-to-an-application) you want to attach to your repository.
3. Click the **Settings** link.
4. Expand the **Repository** section.

If you have not integrated your repository with Distelli, the buttons will say:
* Connect Bitbucket
* Connect Github

If you have already integrated your repository with Distelli, skip forward to [Repo Integrated](#section-repo-integrated).

### Connect Repo

* Click the **Connect Repo** button for the repository that you wish to connect to.
* You may be prompted to login to your repository account.
* When prompted, click **Grant access**.

### Repo Integrated

Once you have integrated your repository with Distelli, the button(s) will say **Use Repo**. For example, if you have integrated your Github account with Distelli, the button on the right will say **Use Github**.

5. Click the Use Repository button for your repository;
  - **Use Bitbucket**
  - **Use Github**

You will be shown a list of repositories that you have access to.

6. Click the repository you wish to add.
7. Select the branch or branches you wish to connect to.
8. Click the **Connect** button.

You have connected your repository to your application.

9. Click the **gear** icon to the right of a branch.

### Automatically build this branch when a new commit is pushed

Enabling this feature will provide a textbox to enter build environment variables, and the option to build on your own hardware.

Once this feature is enabled and a check-in to the repository occurs a build task will be automatically created.

### Automatically deploy this branch when a build succeeds
[block:callout]
{
  "type": "danger",
  "body": "Automatic deploys require an environment with servers to deploy to."
}
[/block]
Enabling this feature will prompt you to select an environment to deploy to.

With this feature enabled, whenever a successful build occurs, a deploy task will be automatically created. This deploy task will deploy the release that was created from the build.

## Save
10. Click **Save Settings** button to save.
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)