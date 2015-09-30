---
title: "Building Virtual Servers"
excerpt: "How to Build a Virtual Server for Builds and Deployments"
---
This guide will discuss some useful software that will allow you to quickly build and deploy virtual servers with differing Operating Systems.

This guide expects that the computer you are using can support virtualized environments. The system that you intend on running virtual hosts should have multiple processors (CPU’s), plenty of memory to support the virtualized hosts, and enough disk space for each virtual host’s disk space. You may need to enable some features (Intel VT or AMD-V) in BIOS to support virtualization.
[block:api-header]
{
  "type": "basic",
  "title": "Virtual Server Tools"
}
[/block]
[Oracle VirtualBox](https://www.virtualbox.org/) is a feature rich, high performance virtualization product for enterprise use. It is freely available as Open Source Software under the General Public License (GNU GPL v2).

VirtualBox can run under Linux, Windows, and Mac OS X. 

The computer's primary Operating System (OS) is called the host OS. With VirtualBox you can install and run multiple guest OS’s under the host OS.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/eQETFcFKSBaf3x2vl1K4",
        "virtual_host_guest_desc.png",
        "644",
        "468",
        "#828b31",
        ""
      ]
    }
  ]
}
[/block]
Each guest OS will use some resources of the host OS. In the illustration above you can see the host OS has CPU, Memory, and Disk space resources that are then utilized by the guest OS’s. As noted above, your host OS will need enough resources to run the guests and continue to support the host OS and its applications.

You can not run a 64 bit guest OS on a 32 bit host OS.

**Vagrant** is a tool to easily acquire an OS image and; create and configure a virtual guest OS in VirtualBox. Where VirtualBox will require you to download an OS image and for you to walk through the install process, Vagrant has this image already prepared, installed, and ready to easily and quickly virtualize. But before using Vagrant, you must install VirtualBox.
[block:api-header]
{
  "type": "basic",
  "title": "Installing VirtualBox"
}
[/block]
Installing VirtualBox is rather easy. Simply go to the <a href="https://www.virtualbox.org/wiki/Downloads" target="_blank">download page</a>, and get the executable that is right for your host OS, and run it.

VirtualBox has some great documentation resources. I recommend starting <a href="https://www.virtualbox.org/wiki/End-user_documentation" target="_blank">here</a>

In a future post I will cover running and using VirtualBox standalone without Vagrant. But since Vagrant provides a quick and easy method of getting guest OS’s provisioned and running let’s delve into that.
[block:api-header]
{
  "type": "basic",
  "title": "Installing Vagrant"
}
[/block]
You can install Vagrant from their <a href="https://www.vagrantup.com/downloads.html">download page</a>. 

For documentation on Vagrant, their <a href="http://docs.vagrantup.com/v2/getting-started/index.html" target="_blank">getting started</a> page provides the necessary information to get you up and running. But you shouldn’t need to refer to that page to continue to the next steps. Simply install Vagrant on your host.
[block:api-header]
{
  "type": "basic",
  "title": "Building your First Guest with Vagrant"
}
[/block]
Installing VirtualBox and Vagrant should not have taken you very long. Now that you have them both installed you can build your first virtual guest.

From a command line on your host OS, enter the following:
[block:code]
{
  "codes": [
    {
      "code": "vagrant init ubuntu/trusty32",
      "language": "text"
    }
  ]
}
[/block]
This command will create a file called **Vagrantfile** in the current directory. For the next command to work, you must be in this directory where this configuration Vagrantfile exists. You can move this file to another directory if it suits you. 

The ubuntu/trusty32 Vagrant environment is a 32 bit version of Ubuntu Linux 14.04. The guest OS created will use 1 CPU, 512MB of memory, and create a 40Gb disk drive. The 40GB drive is dynamically allocated so will only be the size that is currently being used, which upon creation is a little less than 1GB.

There are numerous Vagrant “boxes” (images) available in many OS’s. Check <a href="https://atlas.hashicorp.com/boxes/search" target="_blank">here</a> or search on the Internet.

To bring the Virtual guest up, enter the following from the same directory where the Vagrantfile sits:
[block:code]
{
  "codes": [
    {
      "code": "vagrant up",
      "language": "text"
    }
  ]
}
[/block]
The first time you bring this guest up, Vagrant will take a bit of time to download the base image. Bringing the host up later will not take as long. 

If you are using Windows as the host OS and you don’t have a command line ssh client configured, Vagrant may timeout trying to connect to the guest OS. This is OK. You can safely continue on.

After the guest is up, you will not see it. You must use ssh to connect to the guest. Vagrant has setup a private/public key pair for your connection. If your host OS is Windows, skip forward to the next section [Connecting to the Vagrant Guest with Windows](#connecting-to-the-vagrant-guest-with-windows).

On OS X or Linux simply enter the following command from the same directory where the Vagrantfile exists:
[block:code]
{
  "codes": [
    {
      "code": "vagrant ssh",
      "language": "text"
    }
  ]
}
[/block]
This will connect you to the running Virtual guest host with the user “vagrant”. This user has sudo access and you can now create new users and passwords as necessary. 

This server is also ready for installation of the [Distelli Agent](doc:distelli-agent) for doing [Distelli builds](doc:using-your-own-build-server) and consuming [Distelli deployments](doc:deploying-an-application-1). 

See the [Network Considerations](#network-considerations) section below for more information on configuring the Virtual guest for outside access.
[block:api-header]
{
  "type": "basic",
  "title": "Connecting to the Vagrant Guest with Windows"
}
[/block]
If your host OS is Windows you may need an ssh client. One version of ssh client for windows is PuTTY which is available <a href="http://www.putty.org/" target="_blank">here</a>. Download <a href="http://www.putty.org/" target="_blank">PuTTY</a> and run it.

You will need to find out the Vagrant ssh information to connect to the guest OS. From the same directory where the Vagrantfile exists enter:
[block:code]
{
  "codes": [
    {
      "code": "vagrant ssh-config",
      "language": "text"
    }
  ]
}
[/block]
This will tell you the IP and port information you need to connect. Now you can use PuTTY to connect to your Virtual guest OS.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/77QI4UVpTnm1F7LsUH2Y",
        "virtual_windows_ssh-config.png",
        "1132",
        "437",
        "#2f4593",
        ""
      ]
    }
  ]
}
[/block]
You will be prompted for a login name and a password. The credentials are **vagrant/vagrant** respectively.

This will connect you to the running Virtual guest host with the user “vagrant”. This user has sudo access and you can now create new users and passwords as necessary. 

This server is also ready for installation of the [Distelli Agent](doc:distelli-agent) for doing [Distelli builds](doc:using-your-own-build-server) and consuming [Distelli deployments](doc:deploying-an-application-1). 
[block:api-header]
{
  "type": "basic",
  "title": "Network Considerations"
}
[/block]
By default a VirtualBox guest OS will use a network adapter attached to NAT (Network Address Translation). This NAT address issued to the virtual guest is not available outside the guest OS. In other words, if you run a web server in the guest OS, no other host can access it, including the host OS, without setting up special provisions. 

Many of the [Distelli Getting Started tutorials](doc:tutorials-index) present a working web application on port 8000 and above.

To allow access to these ports you will have to stop the guest OS and make some changes to the Vagrantfile configuration file.

From the directory where the Vagrantfile is, stop the guest OS by issuing the following command:
[block:code]
{
  "codes": [
    {
      "code": "vagrant halt",
      "language": "text"
    }
  ]
}
[/block]
Open the **Vagrantfile** in your favorite editor, add the following lines anywhere, and save the file:
[block:code]
{
  "codes": [
    {
      "code": "config.vm.network \"forwarded_port\", guest: 8000, host: 8000\nconfig.vm.network \"forwarded_port\", guest: 8001, host: 8001\nconfig.vm.network \"forwarded_port\", guest: 8002, host: 8002\nconfig.vm.network \"forwarded_port\", guest: 8003, host: 8003\nconfig.vm.network \"forwarded_port\", guest: 8004, host: 8004\nconfig.vm.network \"forwarded_port\", guest: 8005, host: 8005\nconfig.vm.network \"forwarded_port\", guest: 8006, host: 8006\nconfig.vm.network \"forwarded_port\", guest: 8007, host: 8007\nconfig.vm.network \"forwarded_port\", guest: 8008, host: 8008\nconfig.vm.network \"forwarded_port\", guest: 8009, host: 8009",
      "language": "text"
    }
  ]
}
[/block]
After saving the file, boot your guest OS.
[block:code]
{
  "codes": [
    {
      "code": "vagrant up",
      "language": "text"
    }
  ]
}
[/block]
At this point you can walk through the various Distelli [Getting Started](doc:getting-started-builds-and-deploys) Tutorials and validate they are working as expected by browsing from the **host OS** to the appropriate tutorial port. For example the [PHP tutorial](doc:tutorials-index#php) uses port 8006, so after walking through the tutorial and deploying to the virtual guest OS. You would then browse, on the host OS to:
[block:code]
{
  "codes": [
    {
      "code": "http://127.0.0.1:8006",
      "language": "text"
    }
  ]
}
[/block]

[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/SLrozS3S3KnexH8KVQVU",
        "virtual_fw.png",
        "972",
        "447",
        "#074e9f",
        ""
      ]
    }
  ]
}
[/block]
The [Tutorials](doc:tutorials-index) are designed so that they use different port numbers which will allow you to deploy them to the same host.

Have fun and happy deploying!

[Tutorials Index](doc:tutorials-index)