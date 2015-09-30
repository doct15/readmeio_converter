---
title: "Easy Deployment of WordPress on Ubuntu 14"
excerpt: ""
---
WordPress is a full content management system with thousands of plugins, widgets, and themes.

Distelli is a devops continuous integration and continuous deployment tool.

If you have an Internet connected server and want to get started using WordPress, this article is for you. This takes advantage of Distelli's powerful deployment system to install and configure:
* Web Server (nginx)
* Database Server (mysql)
 - A database
 - A database user
 - A database user password
* WordPress
 - Database connection information
[block:api-header]
{
  "type": "basic",
  "title": "Step 1. Create a Free Account on Distelli"
}
[/block]
In your web browser navigate to <a href="https://www.distelli.com/signup" target="_blank">https://www.distelli.com/signup</a> and sign-up for your *free* Distelli account.
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/G44t2S9LRUirfTpuiTtA",
        "wp_1_shadow.png",
        "1211",
        "794",
        "#5283ee",
        ""
      ]
    }
  ]
}
[/block]
<br>
[block:api-header]
{
  "type": "basic",
  "title": "Step 2. Get the Deployment Instructions"
}
[/block]
The Distelli deployment instructions are in a distelli-manifest.yml file.  This file and an nginx configuration file are available in a Distelli public GitHub repository here.
[block:code]
{
  "codes": [
    {
      "code": "https://github.com/distelli/wordpress",
      "language": "text"
    }
  ]
}
[/block]
Fork this repository to your GitHub account.
[block:api-header]
{
  "type": "basic",
  "title": "Step 3. Create the Application in Distelli"
}
[/block]
In Distelli click the **Applications** link at the top of the WebUI. Then click the **New App** button on the top right.
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/o2KKinKSNyP4xLyZi9AG",
        "wp_3_applications_shadow.png",
        "1088",
        "419",
        "#99548a",
        ""
      ]
    }
  ]
}
[/block]
<br>
Give your application a name. Use the name **wordpress**. This name has no bearing on your WordPress site.
[block:callout]
{
  "type": "warning",
  "body": "The application name must match the application name in the distelli-manifest.yml file."
}
[/block]
After entering a name, click the **Use GitHub** button.
[block:callout]
{
  "type": "warning",
  "body": "If the button instead says **Connect GitHub** click that and connect your GitHub account."
}
[/block]
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/KMdjW9xRSrI9zgZoHbDF",
        "wpnew_new_app1_shadow.png",
        "1284",
        "670",
        "#d33960",
        ""
      ]
    }
  ]
}
[/block]
<br>
Select the repository you forked from [Step 2](#step-2-get-the-deployment-instructions) above.
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/bNG6YRLVRFWtSTFEWqEk",
        "wpnew_new_app2_shadow.png",
        "1283",
        "673",
        "#3ca6e5",
        ""
      ]
    }
  ]
}
[/block]
<br>
Choose the **master** branch.
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/2h7kiV2TpK1CA7JfFGWq",
        "wp_7_new_app3_shadow.png",
        "1287",
        "554",
        "#b43f54",
        ""
      ]
    }
  ]
}
[/block]
<br>
Two [Environments](doc:environments) will be automatically created for you. Click the **All Done** button to continue.
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/FXnOmJILTPiQs7NLG2UE",
        "wpnew_new_app4_shadow.png",
        "1287",
        "612",
        "#20abe5",
        ""
      ]
    }
  ]
}
[/block]
<br>
At this point you will pause the *new application workflow* and edit the deployment instructions before continuing.
<br>
[block:api-header]
{
  "type": "basic",
  "title": "Step 4. Edit the distelli-manifest.yml Instructions"
}
[/block]
You already have a [Distelli Manifest](doc:distelli-manifest) file provided in the repository you forked earlier. You must edit this file and commit the edit to your repository.

Edit the distelli-manifest.yml file.
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/uRZt8ktTyWPmLMypNM8v",
        "wp_distelli-manifest-variables_shadow.png",
        "752",
        "355",
        "#a24c13",
        ""
      ]
    }
  ]
}
[/block]
<br>
Set the values as appropriate:
* <SET_ME_DISTELLI_USERNAME> = This should be set to your Distelli username you created when you signed up. For more info see: [Finding Your Distelli Username](doc:finding-your-distelli-username).
* MYSQL_ROOT_PASSWORD: "<SET_ME>" = The root (master) password for the mysql database server.
* DB_NAME: "<SET_ME>" = The name of the WordPress database you wish to create.
* DB_USER_NAME: "<SET_ME>" = The user that has full permissions to the WordPress database.
* DB_USER_PASSWORD: "<SET_ME>" = The password for the WordPress database user.

Leave all the other content in the file alone.
[block:callout]
{
  "type": "warning",
  "body": "Note: **wordpress** is the name of the application. This must match the name you gave the application in Distelli."
}
[/block]
Here is an example edited text.
[block:code]
{
  "codes": [
    {
      "code": "johndoe/wordpress:\n      \n  Env:\n    # Set the variables below\n    - MYSQL_ROOT_PASSWORD: \"pa55w0rd\"\n    - DB_NAME: \"wordpress_db\"\n    - DB_USER_NAME: \"wordpress_user\"\n    - DB_USER_PASSWORD: \"wordpress_user_password\"\n",
      "language": "text"
    }
  ]
}
[/block]
Save your changes.
Commit the changes to your repository.
<br>
[block:api-header]
{
  "type": "basic",
  "title": "Step 5. Build the Application"
}
[/block]
Go back to the Distelli WebUI and click the **I've pushed my Repo** button.

Click the **Looks good. Start Build!** button.
<br>E
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/BMm2FxTMRQ6AE3xK07S8",
        "wp_new_app6_shadow.png",
        "1307",
        "636",
        "#bb4247",
        ""
      ]
    }
  ]
}
[/block]
<br>
The build that is kicked off will validate that you have the correct Distelli user name and your application name matches. After a successful build, a software release will be created. For more information on builds see [Viewing Builds](doc:viewing-builds).

If you are not on the builds list page, click the **Builds** button at the top of the Distelli WebUI.

Your successful build will be at the top of the list. 

Click the **New Deployment** button at the top right to begin a deployment
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/AL5hrV41QIAdoRaREfSf",
        "wpnew_build_list_release_shadow.png",
        "1309",
        "666",
        "#ee7263",
        ""
      ]
    }
  ]
}
[/block]
<br>
[block:api-header]
{
  "type": "basic",
  "title": "Step 6. Deploy the Application"
}
[/block]
In the new deployment wokflow step 1, click **Deploy a Release**.
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/g5raGGQMSD2I2LVUZRFT",
        "wp_new_dep1_shadow.png",
        "1287",
        "659",
        "#ab3f58",
        ""
      ]
    }
  ]
}
[/block]
<br>
Select the application you wish to deploy. 
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/UErEZLznTgOKMpdigy02",
        "wpnew_new_dep2_shadow.png",
        "1302",
        "620",
        "#a94654",
        ""
      ]
    }
  ]
}
[/block]
<br>
Select the release you wish to deploy. You should only have the one release created from the successful build.
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/IDmdNtaGSrWS2e06ut5G",
        "wpnew_new_dep3_shadow.png",
        "1305",
        "474",
        "#88485a",
        ""
      ]
    }
  ]
}
[/block]
<br>
Select the **-prod** environment. If you have been following along with the same application name (wordpress) the environment will be named **wordpress-prod**, select that.
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/t1OSftLgRWy4GPLJYoxi",
        "wpnew_new_dep4_shadow.png",
        "1304",
        "483",
        "#b34053",
        ""
      ]
    }
  ]
}
[/block]
<br>
You currently don't have any servers setup in any environments. At this point you will have to login to your server and install the Distelli agent. Click the **Add Servers** button.
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/MDSRezeRpuru7VTpzG39",
        "wpnew_new_dep5_shadow.png",
        "1306",
        "443",
        "#d0365a",
        ""
      ]
    }
  ]
}
[/block]
<br>
[block:api-header]
{
  "type": "basic",
  "title": "Step 7. Add a Server"
}
[/block]
To facilitate doing a deploy of the WordPress software from Distelli, you must install the Distelli agent on the server. Instructions for installing the agent can be found in the [Distelli Agent](doc:distelli-agent) reference guide. 
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/yNHQGVshQeHDzsCJ4fwj",
        "wp_2_shadow.png",
        "752",
        "492",
        "#71b0df",
        ""
      ]
    }
  ]
}
[/block]
<br>
Now return to the Distelli WebUI and click the **Add Servers** link, at the top, to refresh the list. When your server populates the list, click on it, then click the **Add Servers** button.
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/O6XoVz11TjiVzjKY5nJ8",
        "wpnew_new_dep5as_shadow.png",
        "592",
        "924",
        "#b53f52",
        ""
      ]
    }
  ]
}
[/block]
<br>
[block:api-header]
{
  "type": "basic",
  "title": "Step 8. Start Deployment"
}
[/block]
Close the Servers dialog and click the **Start Deployment** button.
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/YACqhm3yQdWjKwr81z4C",
        "wpnew_new_dep5sd_shadow.png",
        "1307",
        "587",
        "#427bbf",
        ""
      ]
    }
  ]
}
[/block]
<br>
WordPress is now being installed on your server.
[block:api-header]
{
  "type": "basic",
  "title": "Step 9. Using your WordPress Site"
}
[/block]
After the deployment is successful you can begin setting up your WordPress site. Using your browser, connect to your server.
<br>
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/OyZRTWDSJOkhzfcNzu9w",
        "wp_wordpress1_shadow.png",
        "815",
        "921",
        "#2a4158",
        ""
      ]
    }
  ]
}
[/block]
<br>
Congratulations! You are up and running.