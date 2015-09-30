---
title: "Provisioning EC2 Servers"
excerpt: ""
---
Using Distelli you can provision EC2 instances (servers) and have them immediately available for deploys and builds.
[block:callout]
{
  "type": "danger",
  "body": "Provisioning and launching EC2 instances may incur charges on your Amazon AWS account"
}
[/block]
For more information on getting started with Amazon and EC2 see [http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/get-set-up-for-amazon-ec2.html](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/get-set-up-for-amazon-ec2.html).
[block:api-header]
{
  "type": "basic",
  "title": "Provision an EC2 Instance"
}
[/block]
1. Click the **Servers** link at the top of the Distelli WebUI.
2. Click the **New Server** button at the top right.

This will begin the new server workflow.

3. Click the **Launch an EC2 Instance** button.
4. Enter your EC2 credential

For more information on setting up your Amazon Access Key see <a href="http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSGettingStartedGuide/AWSCredentials.html" target="_blank">http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSGettingStartedGuide/AWSCredentials.html</a>.
[block:callout]
{
  "type": "danger",
  "body": "Ensure the AWS user has the correct permission policy applied that allows the user to create EC2 instances. If the credentials do not have EC2 permissions you will get an \"Invalid Credentials\" error message in Distelli."
}
[/block]
5. If you just added your EC2 credentials, click **Update Credentials**.
6. Choose your instance type from the list of possible instances.
7. Choose your OS Image.
8. Choose your Virtual Private Cloud (vpc).
9. Chose your subnet
[block:callout]
{
  "type": "danger",
  "body": "The EC2 instance you provision must have Internet access. This is easy to provision by ensuring your subnet provides an associated public IP address. For more information see <a href=\"http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-ip-addressing.html target=\"_blank\">http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-ip-addressing.html</a>."
}
[/block]
10. Choose your key pair. Using key pairs is important for accessing your server with ssh once it is up.
11. Choose your security group.
12. Click **Done**.
13. Select the number of EC2 instances you wish to provision.
[block:callout]
{
  "type": "danger",
  "body": "Remember, provisioning EC2 servers may incur charges."
}
[/block]
14. Click **Launch**.

Your instances are being provisioned.

15. Click **Go to Servers** button.

[block:callout]
{
  "type": "warning",
  "body": "EC2 instances take a bit of time to completely provision (come up) and communicate on the Internet. Be patient. If you are waiting more than 10 minutes, there may be a problem. Are you sure the subnet you chose provides Internet access to the instance?"
}
[/block]

[block:callout]
{
  "type": "warning",
  "body": "If you run into trouble, you can inspect and terminate the instances from the EC2 console. <a href=\"https://console.aws.amazon.com/ec2\" target=\"_blank\">https://console.aws.amazon.com/ec2</a>"
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Product Documentation"
}
[/block]
[Product Documentation Index](doc:product-documentation-index)