---
title: "Using Amazon S3 Bucket"
excerpt: ""
---
You can specify an S3 bucket that Distelli will use to store your bundled releases when you do a `distelli push`. When you deploy the software the Distelli agent will retrieve the bundle from your S3 bucket.

This document shows you how to create, authorize, and setup that bucket so Distelli will use it to store your release bundles.

For Distelli to access the S3 bucket you will need to provide:
* The bucket name
* An access token
* A secret key

The following sections walk you through:
* [Creating an S3 bucket](#create-an-s3-bucket-on-aws)
* [Creating a policy to provide permissions to the S3 bucket](#create-an-aws-policy-to-grant-s3-bucket-permission)
* [Creating an AWS user to access the S3 bucket](#create-an-aws-user)
* [Applying an AWS policy to an AWS user](#apply-aws-policy-to-aws-user)
* [Adding an S3 bucket to Distelli](#adding-an-s3-bucket-to-distelli)
* [Getting a new AWS user token and key](#getting-new-aws-user-credentials)
* [Doing a Distelli Push to AWS S3 Bucket](#doing-a-distelli-push-to-aws-s3-bucket)
[block:api-header]
{
  "type": "basic",
  "title": "Overview"
}
[/block]
When you incorporate an S3 bucket with your Distelli account Distelli will keep your bundled application releases in your S3 bucket. 

After adding your S3 credentials to Distelli on your first application push, Distelli will create, in your S3 bucket, a folder called distelli-packages.

When you issue a `distelli push` command and push your application release, the application release will be bundled and uploaded to your S3 bucket using SSL. This bundle is in a gzip tar format. The files bundled depend on your [Distelli Manifest PkgInclude section](doc:distelli-manifest#pkginclude) 

When deploying an application release, on the destination server the Distelli agent will retrieve the application bundle from your S3 bucket.
[block:api-header]
{
  "type": "basic",
  "title": "Create an S3 Bucket on AWS"
}
[/block]
First step will be to create an S3 bucket. If you already have an existing bucket you wish to use, you may skip to the next step [Create an AWS Policy to Grant S3 Bucket Permissions](#create-an-aws-policy-to-grant-s3-bucket-permission).

1. Sign in to the AWS console <a href="https://console.aws.amazon.com" target="_blank">here</a>. 
2. In the Amazon Web Services under Storage & Content Delivery select **S3 (Scalable Storage in the Cloud)**.
3. Click the **Create Bucket** button.
4. Enter the **Bucket Name** (for example "Distelli")
5. Select a **Region**.
6. Click the **Create** button.

You have created an S3 Bucket. Remember your bucket name.
[block:api-header]
{
  "type": "basic",
  "title": "Create an AWS Policy to Grant S3 Bucket Permissions"
}
[/block]
These steps will create an AWS policy to grant access to an S3 Bucket.

1. In the AWS console, click the square logo on the top left to go back to the main console menu.
2. In the Amazon Web Services under Administration and Security select **Identity & Access Management**.
3. In the left Dashboard select **Policies**.
4. Click the **Create Policy** button.
5. For **Create Your Own Policy** click the **Select** button.
6. Give the policy a **Policy Name** (for example "Distelli_S3_Bucket")
[block:callout]
{
  "type": "danger",
  "body": "For the following steps, replace **BUCKETNAME** with your AWS S3 bucket name."
}
[/block]
7. Give the policy a **Description** (for example "Provides Distelli access to the S3 bucket BUCKETNAME".
8. In the policy, enter the following:
[block:code]
{
  "codes": [
    {
      "code": "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": [\n        \"s3:GetObject\",\n        \"s3:PutObject\",\n        \"s3:DeleteObject\",\n        \"s3:ListBucket\"\n      ],\n      \"Resource\": [\n        \"arn:aws:s3:::BUCKETNAME/*\"\n      ]\n    }\n  ]\n}",
      "language": "json"
    }
  ]
}
[/block]
9. Did you remember to replace **BUCKETNAME** with your S3 bucket name?
10. Click the **Validate Policy** button.

You should see a **This policy is valid.** message.

11. Click **Create Policy** button.

You have created a policy that can be used to provide a user or group access to the S3 bucket.
[block:api-header]
{
  "type": "basic",
  "title": "Create an AWS User"
}
[/block]
These steps will create an AWS User to access the S3 Bucket. If you already have an AWS user you would like to use and you know their associated security key and token skip forward to

These steps will create a single AWS user account.

1. Make sure you are in the AWS Console and have selected **Identity & Access Management** under Administration & Security.
2. In the left Dashboard select **Users**.
3. Click **Create New Users** button.
4. Ensure the **Generate an access key for each user** box is checked.
5. In field **1** enter a user name (for example "Distelli").
6. Click the **Create** button.
[block:callout]
{
  "type": "warning",
  "body": "The Security Credentials are available for download **one time only**. These security credentials are required to add your S3 bucket to Distelli. Keep them safe."
}
[/block]
7. Click the **Show User Security Credentials** link. 
8. Download the credentials from the **Download Credentials** button.
[block:callout]
{
  "type": "danger",
  "body": "Preserve these credentials in a secure manner that meets your organizations security requirements."
}
[/block]
9. Click **Close** button.

You have created a new AWS user. You must apply the policy, created above, to the user to allow them access to the S3 bucket.
[block:api-header]
{
  "type": "basic",
  "title": "Apply AWS Policy to AWS User"
}
[/block]
In this section you will apply the Policy to the AWS User to grant that user access to the S3 bucket.

1. Make sure you are in the AWS Console and have selected **Identity & Access Management** under Administration & Security.
2. In the left Dashboard select **Users**.
3. Click the **user** you wish to apply the policy to.
4. Find the **Permissions** section and under Managed Policies, click the **Attach Policy** button.
5. Find the policy you created above, **Distelli_S3_Bucket** and select it by clicking its checkbox.
6. Click the **Attach Policy** button.

With this policy now attached to the user, the user is now configured to access the S3 bucket.
[block:api-header]
{
  "type": "basic",
  "title": "Adding an S3 Bucket to Distelli"
}
[/block]
The following steps must be completed in the Distelli WebUI.

1. Ensure you are signed into Distelli <a href="https://www.distelli.com/login" target="_blank">here</a>.
2. Click the **gear icon** on the top right.
3. Click the **Credentials** link on the left.
4. Under where it says "AWS S3" click the **Add Creds** button.
5. Enter your **S3 Bucket Name**.
6. Enter your AWS User **S3 Access Token**.
7. Enter your AWS User **S3 Secret Key**.
[block:callout]
{
  "type": "warning",
  "body": "If you did not get your AWS user token and key during their one-time availability, or have lost it, see the next section [Getting New AWS User Credentials](#getting-new-aws-user-credentials)."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Getting New AWS User Credentials"
}
[/block]
If you have an AWS account where you don't know the current token and key credentials, you can create new ones. Remember you will only be able to view and download the secret key one-time.

1. Make sure you are in the AWS Console and have selected **Identity & Access Management** under Administration & Security.
2. In the left Dashboard select **Users**.
3. Click the **user** you wish to get new credentials for.
4. Find the **Access Keys** section under Security Credentials and click the **Create Access Key** button.
[block:callout]
{
  "type": "warning",
  "body": "The Security Credentials are available for download **one time only**. These user credentials are required to add your S3 bucket to Distelli. Keep them safe."
}
[/block]

5. Click the **Show User Security Credentials** link. 
6. Download the credentials from the **Download Credentials** button.
[block:callout]
{
  "type": "danger",
  "body": "Preserve these credentials in a secure manner that meets your organizations security requirements."
}
[/block]
You now have new working known credentials for your AWS user. You may want to remove any extraneous credentials.
[block:api-header]
{
  "type": "basic",
  "title": "Doing a Distelli Push to AWS S3 Bucket"
}
[/block]
After you have correctly setup the S3 bucket in Distelli, when doing a `distelli push` you can see the bundle being uploaded to S3.

[block:code]
{
  "codes": [
    {
      "code": "$ distelli push\n    Packaged 1 files in 1 directories\n    Pushing App: SimpleApp\n    Uploading Bundle to S3: [==========] 100%\n    Creating Release... DONE",
      "language": "text"
    }
  ]
}
[/block]