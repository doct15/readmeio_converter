---
title: "PHP w/ NGINX on Ubuntu"
excerpt: ""
---
In this tutorial we will discuss deploying PHP web content that will be served via NGINX running on an Ubuntu server. These steps have been validated on Ubuntu 14 and 15*.

This scenario assumes the following:
  * You want to deploy a PHP application
  * The PHP application will use NGINX to serve content
  * If the PHP application uses a database, the database already exists and is up and running
  * The server(s) hosting the application are Ubuntu 14 (if using Ubuntu 15 see [last section](#ubuntu-15))
  * The server(s) will need PHP and NGINX installed and configured on deploy

We will start by setting up the application directory where we will stage the needed files for deployment. This will be done on what we will call your development system. To communicate with the Distelli SaaS this system will need the Distelli CLI installed. You can view the installation instructions here [Installing the CLI](doc:installing-the-cli). Please install the CLI now.

[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/MFjrA2jvQb6obWkAz12T",
        "distelli-components.png",
        "998",
        "247",
        "#5a96cc",
        ""
      ]
    }
  ]
}
[/block]
Next, to get things started quickly, you will do a git clone of a Distelli public github repository. If you do not have git you can find installation instructions here <a href="http://git-scm.com/downloads" target="_blank">Download git</a>.

Use the following command:
[block:code]
{
  "codes": [
    {
      "code": "git clone https://github.com/Distelli/PHPNGINXUbuntu.git",
      "language": "text"
    }
  ]
}
[/block]
In the last step a subdirectory called PHPNGINXUbuntu was created. Change (**cd**) to that directory now and take a look at the contents. We will discuss this further.
[block:code]
{
  "codes": [
    {
      "code": "cd PHPNGINXUbuntu",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Steps to Deploy"
}
[/block]
These are the steps that must be taken on a bare-bones Ubuntu Server to successfully deploy a PHP application on NGINX. In other words, if one were to manually walk through the install and setup, this is what must be accomplished. [**Do not do these steps, these are for discussion.**]

1. Update the Ubuntu repository to ensure it has the latest index.
  a. sudo apt-get -y update
2. Install PHP
  a. sudo apt-get -y php5-fpm
3. Configure PHP
  a. Edit /etc/php5/fpm/php.ini and add cgi.fix_pathinfo=0
4. Install NGINX
  a. sudo apt-get -y nginx
5. Configure NGINX
a. Edit /etc/nginx/sites-available/default and add
[block:code]
{
  "codes": [
    {
      "code": "location ~ \\.php$ {\n    fastcgi_split_path_info ^(.+\\.php)(/.+)$;\n    # NOTE: You should have \"cgi.fix_pathinfo = 0;\" in php.ini\n    # With php5-fpm:\n    fastcgi_pass unix:/var/run/php5-fpm.sock;\n    fastcgi_index index.php;\n    include fastcgi_params;\n    #Unremark the following for *Ubuntu15\n    #include fastcgi.conf;\n}",
      "language": "text"
    }
  ]
}
[/block]
6. Link content to correct directory
  a. sudo ln -sf /$DISTELLI_APPHOME/webapp/ /usr/share/nginx/html/ 
7. Restart PHP and NGINX
  a. sudo service php5-fpm restart
  b. sudo service nginx restart

Following the above steps an Ubuntu server will be prepared to serve .php files from the /usr/share/nginx/html directory.

You can accomplish the above steps, during a Distelli deployment, by using the correct syntax in your distelli-manifest.yml file.
[block:api-header]
{
  "type": "basic",
  "title": "Distelli Manifest"
}
[/block]
When you cloned the repository earlier, you obtained a distelli-manifest.yml file. Take a look at the contents of that file by opening it in your favorite editor.
[block:code]
{
  "codes": [
    {
      "code": "<username>/PHPNGINXUbuntu:\n\n  PkgInclude:\n    - configs/*\n    - webapp.php\n    - webapp/*\n\n  PkgExclude:\n    - README.md\n\n  PreInstall:\n    - echo \"===Starting PreInstall===\"\n    - echo \"---Updating apt-get---\"\n    - sudo apt-get -y update\n\n    - echo \"---Install for php---\"\n    - sudo apt-get -y install php5-fpm\n\n    - echo \"---Install for NGINX---\"\n    - sudo apt-get -y install nginx\n    - echo \"=====Done with PreInstall======\"\n\n  PostInstall:\n    - echo \"===Begin PostInstall===\"\n    - echo \"---Updating /etc/php5/fpm/php.ini---\"\n    - sudo cp /$DISTELLI_INSTALLHOME/configs/php.ini /etc/php5/fpm/php.ini\n\n    - echo \"---Updating /etc/nginx/sites-available/default---\"\n    - sudo cp /$DISTELLI_INSTALLHOME/configs/default /etc/nginx/sites-available/default\n\n    - echo \"---linking to content---\"\n    - sudo ln -sf /$DISTELLI_APPHOME/webapp/ /usr/share/nginx/html/\n    - sudo ln -sf /$DISTELLI_APPHOME/webapp.php /usr/share/nginx/html/\n    - echo \"=====Done with PostInstall======\"\n\n  Start:\n    - echo \"===Begin Start===\"\n    - echo \"---restarting php---\"\n    - sudo service php5-fpm restart\n\n    - echo \"---restarting nginx---\"\n    - sudo service nginx restart\n    - echo \"=====Done with Start======\"",
      "language": "yaml"
    }
  ]
}
[/block]
Lets take a deeper look at  what each of the steps is doing in the manifest.
[block:api-header]
{
  "type": "basic",
  "title": "Stepping through the distelli-manifest.yml"
}
[/block]
# The First Line

Every distelli-manifest.yml must have the following information on the first line. This is:
[block:code]
{
  "codes": [
    {
      "code": "YOUR_DISTELLI_USERNAME/APPLICATION_NAME:",
      "language": "yaml"
    }
  ]
}
[/block]
In the example distelli-manifest.yml you should find this on the first line:
[block:code]
{
  "codes": [
    {
      "code": "<username>/PHPNGINXUbuntu:",
      "language": "yaml"
    }
  ]
}
[/block]
Make sure you change the `<username>` to your Distelli **username**.
[block:api-header]
{
  "type": "basic",
  "title": "PkgInclude"
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "  PkgInclude:\n    - configs/*\n    - webapp.php\n    - webapp/*",
      "language": "yaml"
    }
  ]
}
[/block]
This section determines which files will be bundled on a distelli push and ultimately deployed in a distelli deploy.
 
`configs/*` 
- the configs files contain the various php and nginx file adjustments that must occur.

`webapp.php`
- is a simple php application that can be served via nginx.

`webapp/*`
- is an example to show how a user may want to put their php application files into a directory for deployment to the nginx server.
[block:api-header]
{
  "type": "basic",
  "title": "PkgExclude"
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "  PkgExclude:\n    - README.md",
      "language": "yaml"
    }
  ]
}
[/block]
This section determines which files in the directory will be excluded from the bundle.
[block:api-header]
{
  "type": "basic",
  "title": "PreInstall"
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "  PreInstall:\n    - echo \"===Starting PreInstall===\"",
      "language": "yaml"
    }
  ]
}
[/block]
The preinstall section occurs before the Install section. In this section one should prepare pre-requisites before installing the software. 

Realize that during the Install phase, using this distelli-manifest.yml file, Distelli will only copy and unbundle the PkgInclude files to the destination server.

# Updating apt-get
[block:code]
{
  "codes": [
    {
      "code": "    - echo \"---Updating apt-get---\"\n    - sudo apt-get -y update",
      "language": "yaml"
    }
  ]
}
[/block]
This command will use apt-get to install php5-fpm. This will install the PHP FastCGI Process Manager for serving dynamic web content.

Note the use of the -y switch! This option forces a “Yes” answer when the user would normally be prompted “Do you want to continue [Y/n]?” when using apt-get install. A distelli deploy will fail waiting for user input without this option.

# Install for php
[block:code]
{
  "codes": [
    {
      "code": "    - echo \"---Install for php---\"\n    - sudo apt-get -y install php5-fpm",
      "language": "yaml"
    }
  ]
}
[/block]
This command will use apt-get to install php5-fpm. This will install the PHP FastCGI Process Manager for serving dynamic web content.

Note the use of the -y switch! This option forces a “Yes” answer when the user would normally be prompted “Do you want to continue [Y/n]?” when using `apt-get install`. A distelli deploy will fail waiting for user input without this option.

# Install for NGINX
[block:code]
{
  "codes": [
    {
      "code": "    - echo \"---Install for NGINX---\"\n    - sudo apt-get -y install nginx",
      "language": "yaml"
    }
  ]
}
[/block]
This command will use apt-get to install nginx. nginx is an open source reverse proxy server for HTTP, HTTPS, SMTP, POP3, and IMAP protocols, as well as a load balancer, HTTP cache, and a web server.
[block:api-header]
{
  "type": "basic",
  "title": "PostInstall"
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "  PostInstall:\n    - echo \"===Begin PostInstall===\"",
      "language": "yaml"
    }
  ]
}
[/block]
This section occurs after the install phase. As noted earlier, during the install, the bundled files are unbundled to the $DISTELLI_INSTALLHOME directory. These files are available in PostInstall.

# Updating php.ini
[block:code]
{
  "codes": [
    {
      "code": "    - echo \"---Updating /etc/php5/fpm/php.ini---\"\n    - sudo cp /$DISTELLI_INSTALLHOME/configs/php.ini /etc/php5/fpm/php.ini",
      "language": "yaml"
    }
  ]
}
[/block]
Since the deployed files are now available, we can copy our version of php.ini over the newly installed one on the server.

# Updating sites-available/default
[block:code]
{
  "codes": [
    {
      "code": "    - echo \"---Updating /etc/nginx/sites-available/default---\"\n    - sudo cp /$DISTELLI_INSTALLHOME/configs/default /etc/nginx/sites-available/default",
      "language": "yaml"
    }
  ]
}
[/block]
Here we copy the deployed version of the file **default** over the newly installed one.

# Link to Content
[block:code]
{
  "codes": [
    {
      "code": "    - echo \"---linking to content---\"\n    - sudo ln -sf /$DISTELLI_APPHOME/webapp/ /usr/share/nginx/html/\n    - sudo ln -sf /$DISTELLI_APPHOME/webapp.php /usr/share/nginx/html/",
      "language": "yaml"
    }
  ]
}
[/block]
In this step we link the php web content from the $DISTELLI_APPHOME directory to the nginx html directory. Now the content can be served.

Understanding this step is key to being able to deploy your own applications content. In the example provided, the content can be kept in the webapp directory or a directory of your choosing.
[block:api-header]
{
  "type": "basic",
  "title": "Start"
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "  Start:\n    - echo \"===Begin Start===\"",
      "language": "yaml"
    }
  ]
}
[/block]
This section occurs after the PostInstall section. It also occurs on a Restart

# Restart Services
[block:code]
{
  "codes": [
    {
      "code": "    - echo \"---restarting php---\"\n    - sudo service php5-fpm restart\n\n    - echo \"---restarting nginx---\"\n    - sudo service nginx restart",
      "language": "yaml"
    }
  ]
}
[/block]
And finally we restart the services to pick up any configuration changes.
[block:api-header]
{
  "type": "basic",
  "title": "Preparing to Deploy"
}
[/block]
Now that you have an understanding of what is going to be done, let’s get ready to do your deploy using the example you cloned.

These steps assume you have already created your free Distelli account at [http://www.distelli.com/signup.](http://www.distelli.com/signup).

# Step 1. 
Install the Distell Agent on the destination servers you are deploying to. Each server that you wish to deploy the application to will need the Distelli agent installed. You can find instructions for installing the agent here.

# Step 2. 
On the computer where you cloned the example repository, above, edit the distelli-manifest.yml and change the <username> to your distelli username. For example, if your username is jdoe, then the first line in the distelli-manifest.yml should be:
[block:code]
{
  "codes": [
    {
      "code": "jdoe/PHPNGINXUbuntu:",
      "language": "yaml"
    }
  ]
}
[/block]

[block:callout]
{
  "type": "info",
  "body": "Distelli username is not the same as the email you used to sign-up with."
}
[/block]
# Step 3. 
On the computer where you cloned the example repository, ensure you have already installed the CLI. You can validate by doing a:
[block:code]
{
  "codes": [
    {
      "code": "distelli version",
      "language": "text"
    }
  ]
}
[/block]
If not, you can find instructions here [Installing the CLI](doc:installing-the-cli).

# Step 4. 
In the same directory as the distelli-manifest.yml file, use `distelli create` to create the example application in your account on Distelli, then `distelli push` the application. Replace <username> with your Distelli username.
[block:code]
{
  "codes": [
    {
      "code": "distelli create <username>/PHPNGINXUbuntu\ndistelli push -m “First Push”",
      "language": "text"
    }
  ]
}
[/block]
You have created and pushed your first release of the application PHPNGINXUbuntu to your Distelli account.

#Step 5. 
Create an application environment in the Distelli Web UI. If you have not done this before, here are summarized steps:

1. Login to Distelli at [https://www.distelli.com/login](https://www.distelli.com/login).
2. Click on the Application you just created in the last step **PHPNGINXUbuntu**.
3. Click the **Environments** link.
4. Click the **Create Environment** link.
5. Give the environment a unique name (i.e. NGINX_TEST) and then click **Create Environment**.

You have created an environment named NGINX_TEST. Stay on this UI page to continue.

# Step 6. 
Add servers to the environment.
Ensure you are viewing the newly created environment **NGINX_TEST** and:

1. Click the Servers link.
2. Click the Add Servers link.
3. Check the Add Server box for each server you want to deploy to.
4. Click the Add Selected Servers link.

The server(s) are now added to your environment. Stay on this page to continue.
[block:api-header]
{
  "type": "basic",
  "title": "Deploying the Application"
}
[/block]
# Step 7.
Deploy the applicaiton.

1. From where you left off in Step 6 in the Distelli Web UI, looking at your environment NGINX_TEST, click the link **Overview**.
2. Click the top Green **Deploy** button. 
3. In the resulting dialog box click the **Deploy** button.

You should now see deployment(s) to your server(s). From this screen you can watch the logs, which can be very handy in troubleshooting.

FYI, you could have also initiated the deploy from the command line. In the directory where the distelli-manifest.yml file sits, enter the following command: (**Don’t do this if you already initialized the deploy using the WebUI above**.)
[block:code]
{
  "codes": [
    {
      "code": "distelli deploy -m “First deployment” --env NGINX_TEST",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Validation"
}
[/block]
After the deployment(s) are done, you can validate the application is working on the destination deploy server by browsing to the server file:
[block:code]
{
  "codes": [
    {
      "code": "http://SERVER_IP/webapp.php",
      "language": "text"
    }
  ]
}
[/block]
or browsing to the directory
[block:code]
{
  "codes": [
    {
      "code": "http://SERVER_IP/webapp/",
      "language": "text"
    }
  ]
}
[/block]
If you’re really in a pinch and don’t have access via a browser you can use lynx, curl, wget, or telnet on the destination deployed server to validate the php page is being served.

Try one of the following:
[block:code]
{
  "codes": [
    {
      "code": "lynx http://127.0.0.1/webapp/\ncurl -sSL http://127.0.0.1/webapp/\nwget -qO- http://127.0.0.1/webapp/\n\ntelnet 127.0.0.1 80\nTrying 127.0.0.1…\nConnected to 127.0.0.1.\nEscape character is '^]'.\nGET http://127.0.0.1/webapp/ HTTP/1.0",
      "language": "shell"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Ubuntu 15"
}
[/block]
If you are using Ubuntu 15, there is one line that will need to be unremarked. Check in:
[block:code]
{
  "codes": [
    {
      "code": "/etc/nginx/sites-available/default",
      "language": "text"
    }
  ]
}
[/block]
and look for this:
[block:code]
{
  "codes": [
    {
      "code": "#Unremark the following for Ubuntu15\n#include fastcgi.conf;",
      "language": "text"
    }
  ]
}
[/block]
And unremark the line like this:
[block:code]
{
  "codes": [
    {
      "code": "#Unremark the following for Ubuntu15\ninclude fastcgi.conf;",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Next"
}
[/block]
We are always happy to help [support](http://www.distelli.com/support) you.