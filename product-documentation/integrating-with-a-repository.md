---
title: "Integrating with a Repository"
excerpt: ""
---
For full continuous integration (CI) and continuous deployment (CD) you will want to integrate your repository with Distelli. For more information on CI/CD see [Overview of CI/CD with Distelli](doc:overview-of-cicd-with-distelli).

Doing so will allow you to attach Distelli applications to repositories and [enable auto build](doc:enabling-auto-build) and [auto deploy](doc:enabling-auto-deploy) features.
[block:api-header]
{
  "type": "basic",
  "title": "Integrate a Repository with Distelli"
}
[/block]
The master settings for integrating with a repository can be found in your account settings. To change these settings:
1. Click on the **gear** icon in the top right of the Distelli WebUI.
2. Click **Integrations** link on the left.
3. Click the repository you wish to integrate with:
  - Github
  - Bitbucket
[block:callout]
{
  "type": "info",
  "body": "If you are already connected repository, the button will say \"Disconnect REPO Account\". To disconnect (terminate) the integration, click the button."
}
[/block]

[block:callout]
{
  "type": "danger",
  "body": "If you disconnect a repository (i.e. Github or Bitbucket) that has repositories connected to applications in Distelli, the applications will no longer auto build when a repository check-in occurs."
}
[/block]

4. Click the "Connect REPO Account" button for the repository you wish to integrate with.
  - **Bitbucket**
  - **Github**

You may be prompted to login to the repository.
You may be prompted to approve access to the repository.
If you have integrated Distelli previously, you may not be prompted at all.

Once you have approved the integration on the repository, they are integrated.
[block:api-header]
{
  "type": "basic",
  "title": "Next"
}
[/block]
Next steps may include:
* [Creating an Application from a Repository](doc:creating-an-application-from-a-repository).
* [Connecting a Repository to an Application](doc:connecting-a-repository-to-an-application).
[block:api-header]
{
  "type": "basic",
  "title": "Remove Distelli Integration from Github"
}
[/block]
To completely remove Distelli integration with Github:

1. Follow the steps above to disconnect Github from Distelli.
2. Login to your Github account on [https://github.com](https://github.com).
3. Go to the Gibhub **settings** page.
4. On the Github settings page click the **Applications** link.
5. Under Authorized applications, find Distelli Inc and click the **Revoke** button.
[block:api-header]
{
  "type": "basic",
  "title": "Remove Github Repository Webhooks or Services"
}
[/block]
To remove a webhook from a specific repository in Github:

1. Login to your Github account on [https://github.com](https://github.com).
2. Navigate to the repository that has webhooks you wish to remove.
3. Click **Settings** icon.
4. Click the **Webhooks & Services** link.
5. Remove the hook or service you wish.
[block:api-header]
{
  "type": "basic",
  "title": "Remove Distelli Integration from Bitbucket"
}
[/block]
To completely remove Distelli integration with Bitbucket:

1. Follow the steps above to disconnect Bitbucket from Distelli.
2. Login to your Bitbucket account on [https://bitbucket.org](https://bitbucket.org).
3. Go to the Bitbucket **Manage account** page.
4. On the Manage page click the **OAuth** link.
5. Under OAuth integrated applications, find Distelli Inc and click the **Revoke** link.
[block:api-header]
{
  "type": "basic",
  "title": "Remove Bitbucket Repository Webhooks or Services"
}
[/block]
To remove a webhook from a specific repository in Bitbucket:

1. Login to your Bitbucket account on [https://bitbucket.org](https://bitbucket.org).
2. Navigate to the repository that has webhooks you wish to remove.
3. Click **Settings** icon.
4. Click the **Webhooks** or **Services** link.
5. Remove the hook or service you wish.
[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index).