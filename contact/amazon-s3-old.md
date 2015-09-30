---
title: "Amazon S3"
excerpt: ""
---
The Distelli CLI creates new releases for your application that contain your code, content and data that can be deployed to your servers. You can specify an S3 Bucket that Distelli will use to store your packaged releases.

This document shows you how to create, authorize, and setup that bucket so Distelli will use it to store your releases.

[block:api-header]
{
  "type": "basic",
  "title": "Step 1: Create an S3 Bucket"
}
[/block]
To get started, create a new S3 Bucket by logging into your AWS account. You can also use an existing S3 bucket and Distelli will not affect any objects stored in that bucket. Once the S3 Bucket is created, we'll create an IAM user and authorize it to put objects in this bucket.
[block:api-header]
{
  "type": "basic",
  "title": "Step 2: Create an IAM User"
}
[/block]
Now that the S3 bucket is created, we'll create a new IAM user and give it the correct policy so that this user is only allowed to access the contents of this S3 Bucket. Log in to your AWS Console and and select IAM. Click **Users > Create New Users** and enter **distelli** as the username and click create.

Click show Security Credentials (or you can download them via the Download Credentials button) and save the credentials to a secure location. You'll need these credentials in step 4.

[block:api-header]
{
  "type": "basic",
  "title": "Step 3: Attach an IAM Policy to the new user"
}
[/block]
Once the credentials are saved, click close and select the new user from the list by clicking on it. Click Attach User Policy, choose Custom Policy and then click the Select button to use the policy editor. Give the policy a name (eg: distelli-s3) and paste the following IAM policy into the policy editor. Replace BUCKET_NAME with the name of your S3 Bucket created in Step 1.
[block:code]
{
  "codes": [
    {
      "code": "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Effect\": \"Allow\",\n      \"Action\": [\n        \"s3:GetObject\",\n        \"s3:PutObject\",\n        \"s3:DeleteObject\",\n        \"s3:ListBucket\"\n      ],\n      \"Resource\": [\n        \"arn:aws:s3:::BUCKET-NAME/*\"\n      ]\n    }\n  ]\n}",
      "language": "c"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Step 4: Update the S3 Bucket in the Distelli Console"
}
[/block]
Now that we've created the new S3 Bucket and authorized a user to access it, we'll specify the bucket name and credentials in the Distelli Console. Click **Settings > Credentials > S3 Keys**. Click Update S3 Bucket and enter the Bucket name, S3 Access Token and the S3 Secret key in the dialog and click submit.

The S3 Bucket is now setup and any releases you create will be saved in that S3 Bucket.
[block:api-header]
{
  "type": "basic",
  "title": "Questions or Comments?"
}
[/block]
We're always available to help you with your deployments. Feel free to [contact us](mailto:ping@distelli.com) with any questions or comments.