---
title: "Installing Dependencies"
excerpt: ""
---
Builds and Deployments typically need to pre-install dependencies before building or executing deployed software. This may include extra services or libraries not installed by default.

You have the ability to install dependencies during your Distelli builds and deployments by taking advantage of the flexibility of the Distelli manifest.

For builds use the [PreRelease section of the Distelli Manifest](doc:distelli-manifest#prerelease).

For deployment use the [PreInstall section of the Distelli Manifest](doc:distelli-manifest#preinstall).

[Installing Packages Using apt-get](#installing-packages-using-apt-get)
[Installing Packages Using yum](#installing-packages-using-yum)
[Installing Applications Using powershell](#installing-applications-using-powershell)
[Installing Packages from Custom Repository](#installing-packages-from-custom-repository)
[Installing Packages without Repository](#installing-packages-without-repository)
[Installing Projects from Source](#installing-projects-from-source)
[Installing MAC Packages](#installing-mac-packages)

[block:api-header]
{
  "type": "basic",
  "title": "Installing Packages Using apt-get"
}
[/block]
The Advanced Packaging Tool (apt) has a broad install and support base for numerous flavors of linux. When using apt-get to install applications, it is strongly recommended that you first do an apt-get update.

To install packages, add something like this to your distelli-manifest.yml:
[block:code]
{
  "codes": [
    {
      "code": "  - sudo apt-get -y update\n  - sudo apt-get -y install make build-essential ruby curl git ",
      "language": "text"
    }
  ]
}
[/block]
Before using apt-get to install any packages, ensure you to an `apt-get update` to ensure your index is up to date.

Use of the `-y` parameter when running apt-get to avoid any requirements for human interaction. This will make sure the deploy will not stall waiting for user input.
[block:api-header]
{
  "type": "basic",
  "title": "Installing Packages Using yum"
}
[/block]
The Yellowdog Updater, Modified (yum) utility works with linux systems that use the RPM Package Manager (originally Red Hat Package Manager).

To install packages, add something like this to your distelli-manifest.yml:
[block:code]
{
  "codes": [
    {
      "code": "  - sudo yum -y makecache\n  - sudo yum -y install zlib-dev openssl-devel",
      "language": "text"
    }
  ]
}
[/block]
Use of the `-y` parameter when running yum to avoid any requirements for human interaction. This will make sure the deploy will not stall waiting for user input.
[block:api-header]
{
  "type": "basic",
  "title": "Installing Applications Using powershell"
}
[/block]
Using powershell on Windows you can download and unzip application dependencies during a deployment.

Below are 2 examples based on differing versions of powershell.

# Powershell v3+ example
[block:code]
{
  "codes": [
    {
      "code": "  - powershell -Command (new-object System.Net.WebClient).DownloadFile('http://windows.php.net/downloads/releases/archives/php-5.6.8-Win32-VC11-x64.zip','php.zip')\n  - powershell add-type -assemblyname \"system.io.compression.filesystem\" ; [System.io.compression.zipfile]::ExtractToDirectory('\"%DISTELLI_INSTALLHOME%\\php.zip\"','\"%APPDIR%\"')",
      "language": "text"
    }
  ]
}
[/block]
# Powershell v2 example
[block:code]
{
  "codes": [
    {
      "code": "  - powershell -Command (new-object System.Net.WebClient).DownloadFile('http://windows.php.net/downloads/releases/archives/php-5.6.8-Win32-VC11-x64.zip','php.zip')\n  - PowerShell (New-Object -COM Shell.Application).NameSpace('\"%APPDIR%\"').CopyHere((New-Object -COM Shell.Application).NameSpace('\"%DISTELLI_INSTALLHOME%\\php.zip\"').Items(), 16);",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Installing Packages from Custom Repository"
}
[/block]
Some packages, you may wish to install, are not part of the default repository and you may need to add custom repositories. Here are some examples:
[block:code]
{
  "codes": [
    {
      "code": "  - sudo add-apt-repository -y ppa:rethinkdb/ppa \n  - sudo apt-get -y update\n  - sudo apt-get -y install rethinkdb",
      "language": "text"
    }
  ]
}
[/block]
Enabling the EPEL (Extra Packages for Enterprise Linux) Repository eample:
[block:code]
{
  "codes": [
    {
      "code": "   - sudo yum -y install python\n   - sudo rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm\n   - sudo yum -y update\n   - sudo yum -y install python-pip\n   - sudo yum -y install python-virtualenv",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Installing Packages without Repository"
}
[/block]
For some applications, there may be a package,  but no corresponding repository. These are still easy to install but require the extra step of downloading.
[block:code]
{
  "codes": [
    {
      "code": "  - wget http://http.us.debian.org/debian/pool/main/p/python-debian/python-debian_0.1.27_all.deb\n  - sudo dpkg -i python-debian_0.1.27_all.deb",
      "language": "text"
    }
  ]
}
[/block]
Another example:
[block:code]
{
  "codes": [
    {
      "code": "  - wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu1404-3.0.3.tgz\n  - tar xvfz mongodb-linux-x86_64-ubuntu1404-3.0.3.tgz\n  - sudo mkdir -p /usr/local/mongodb\n  - sudo cp -R -n mongodb-linux-x86_64-ubuntu1404-3.0.3/ /usr/local/mongodb",
      "language": "text"
    }
  ]
}
[/block]
Another example:
[block:code]
{
  "codes": [
    {
      "code": "  - wget https://protobuf.googlecode.com/files/protobuf-2.4.1.tar.gz\n  - tar -xzvf protobuf-2.4.1.tar.gz\n  - cd protobuf-2.4.1 && ./configure --prefix=/usr && make && sudo make install",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Installing Projects from Source"
}
[/block]
Some dependencies can only be installed from a source package.

You can easily include the steps in your manifest and run the appropriate commands to install the dependencies.

Here is an example installing rvm from rvm.io.
[block:code]
{
  "codes": [
    {
      "code": "  - gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3\n  - curl -sSL https://get.rvm.io | bash -s stable --ruby",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Installing MAC Packages"
}
[/block]
Using Homebrew over installing from scratch has several benefits. For a lot of packages, it has binary packages available, removing the need to compile packages when installing them. However, should one of them need to be compiled from source, Homebrew can also manage dependencies and the installation process for you.

Here is an example:
[block:code]
{
  "codes": [
    {
      "code": "  - brew update\n  - brew install beanstalk",
      "language": "text"
    }
  ]
}
[/block]
Note the `brew update` which is similar to `apt-get update`. This ensures Homebrew has the most recent packages in its index.
[block:api-header]
{
  "type": "basic",
  "title": "Conditional Installations"
}
[/block]
In the situation where you will be redeploying on top of an existing deployment, you may want to first check if something is already installed before re-installing it.  Here is an example installing Ruby rbenv:
[block:code]
{
  "codes": [
    {
      "code": "  - echo \"Begin Dependency Install\"\n  - if [ -a ~/.rbenv/bin/rbenv ]; then\n  -   echo \"rbenv already installed\"\n  - else\n  -   echo \"Installing rbenv\"\n  -   sudo apt-get -y update\n  -   sudo apt-get -y install git curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev\n  -   git clone git://github.com/sstephenson/rbenv.git ~/.rbenv\n  -   echo 'export PATH=\"$HOME/.rbenv/bin:$PATH\"' >> ~/.bash_profile\n  -   export PATH=\"$HOME/.rbenv/bin:$PATH\"\n  -   echo 'eval \"$(rbenv init -)\"' >> ~/.bash_profile\n  -   set +e\n  -   eval \"$(~/.rbenv/bin/rbenv init -)\"\n  -   set -e\n  -   git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build\n  -   echo 'export PATH=\"$HOME/.rbenv/plugins/ruby-build/bin:$PATH\"' >> ~/.bash_profile\n  -   export PATH=\"$HOME/.rbenv/plugins/ruby-build/bin:$PATH\"\n  - fi\n  - set +e\n  - eval \"$(~/.rbenv/bin/rbenv init -)\"\n  - set -e\n  - VARRUBY=\"$(ruby -v || true)\"\n  - if [[ ${VARRUBY:0:10} == \"ruby 1.9.3\" ]]; then\n  -   echo \"ruby 1.9.3 exists\"\n  - else\n  -   rbenv install -v 1.9.3-p551\n  -   rbenv global 1.9.3-p551\n  -   ruby -v\n  - fi\n  - if [ -a ~/.rbenv/shims/bundle ]; then\n  -   echo \"bundle already installed\"\n  - else\n  -   echo \"Installing bundler\"\n  -   gem install bundler\n  -   set +e\n  -   eval \"$(~/.rbenv/bin/rbenv init -)\"\n  -   set -e\n  - fi",
      "language": "text"
    }
  ]
}
[/block]