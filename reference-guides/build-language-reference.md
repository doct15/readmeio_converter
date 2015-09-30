---
title: "Build Language Reference"
excerpt: ""
---
This document outlines required and recommended steps for successful builds, with Distelli, by language.

The instructions are specific to using [Distelli build servers](doc:using-your-own-build-server) and the [Distelli manifest](doc:distelli-manifest) for specifying build instructions.

<hr>

The Distelli manifest provides distinct sections to execute instructions during distinct stages, including:
[block:parameters]
{
  "data": {
    "h-0": "Action",
    "h-1": "Distelli Phase",
    "0-0": "Build",
    "1-0": "Deploy",
    "2-0": "Deploy",
    "3-0": "Deploy",
    "4-0": "Deploy",
    "0-1": "PreRelease",
    "5-0": "Deploy",
    "6-0": "Deploy",
    "h-2": "Order",
    "1-1": "PreInstall",
    "2-1": "Install",
    "3-1": "PostInstall",
    "4-1": "PreStart",
    "5-1": "Start OR Exec",
    "6-1": "PostStart",
    "0-2": "This phase is used to specify any build and/or test steps that must pass before a release is created.",
    "1-2": "Happens before Install. Application bundle has not been unbundled to the destination server.\nTypically used to install system level prerequisites.",
    "2-2": "If this section is included in your manifest, the application bundle will not be unbundled to the destination server.\n\nIf this section is not included in your manifest, it is during this phase that the application bundle is unbundled to the destination server.",
    "3-2": "At this phase, after install, your application bundle is available on the destination server. Now is when you may want to run application specific install steps.",
    "4-2": "Steps to complete before starting or executing your application.",
    "5-2": "This is the step(s) to launch your application. If both \"Start\" and \"Exec\" sections are included, only the Exec section will be executed.",
    "6-2": "Steps to complete after the application is started or executed."
  },
  "cols": 3,
  "rows": 7
}
[/block]
Here is an example Distelli manifest:
[block:code]
{
  "codes": [
    {
      "code": "jdoe/NodeExpress:\n\n  PkgInclude:\n    - '*'\n\n  PkgExclude:\n    - node_modules/\n\n  PreRelease:\n    - sudo apt-get -y update\n    - sudo apt-get install nodejs -y\n    - sudo apt-get install npm -y\n    - npm install\n    - npm test\n\n  PreInstall:\n    - sudo apt-get -y update\n    - sudo apt-get install nodejs -y\n    - sudo apt-get install npm -y\n\n  PostInstall:\n    - npm install\n\n  Exec:\n    - /usr/bin/nodejs app.js",
      "language": "text"
    }
  ]
}
[/block]
The goal of this document is to provide suggested build steps, by language, when building on Distelli build servers.

<hr>

Choose a language from one of the links below:

[Go](#go)
[Java](#java)
[NodeJS](#nodejs)
[PHP](#php)
[Ruby](#ruby)
[Rust](#rust)

[block:api-header]
{
  "type": "basic",
  "title": "Go"
}
[/block]

[block:parameters]
{
  "data": {
    "0-0": "Language:",
    "1-0": "Versions:",
    "2-0": "Tools used:",
    "3-0": "",
    "0-1": "Go",
    "1-1": "1.0.3+",
    "2-1": "curl: A software transfer tool",
    "2-2": "[http://curl.haxx.se/](http://curl.haxx.se/) ",
    "0-2": "The Go programming language. [https://golang.org/](https://golang.org/) ",
    "3-1": "git: A version control tool",
    "3-2": "[http://git-scm.com/](http://git-scm.com/) ",
    "4-1": "gimme: A go version manager",
    "4-2": "[https://github.com/travis-ci/gimme](https://github.com/travis-ci/gimme)"
  },
  "cols": 3,
  "rows": 5
}
[/block]
This example uses the `gimme` tool to download and install versions of `go`.

### Installing Tools

This code will ensure the apt-get index is up to date then install the necessary tools. If the tools already exist, apt-get will simply warn and the PreRelease phase will continue.
[block:code]
{
  "codes": [
    {
      "code": "  PreRelease:\n    - sudo apt-get -y update\n    - sudo apt-get -y install curl git\n    - mkdir -p ~/bin\n    - curl -sL -o ~/bin/gimme https://raw.githubusercontent.com/travis-ci/gimme/master/gimme\n    - chmod +x ~/bin/gimme\n    - export PATH=$PATH:~/bin",
      "language": "text"
    }
  ]
}
[/block]

### Specifying a Go Version to Use

Using the `gimme` tool you can easily install a version of go. Here is an example installing version 1.4
[block:code]
{
  "codes": [
    {
      "code": "    - gimme 1.4 ",
      "language": "text"
    }
  ]
}
[/block]
After installing the version you must `source` the environment.
[block:code]
{
  "codes": [
    {
      "code": "    - source ~/.gimme/envs/latest.env",
      "language": "text"
    }
  ]
}
[/block]
### Getting Go Dependencies

This will install any Go dependencies your application may need.
[block:code]
{
  "codes": [
    {
      "code": "    - go get -d -v ./...",
      "language": "text"
    }
  ]
}
[/block]

### Building a Go Application

This will build the Go application.
[block:code]
{
  "codes": [
    {
      "code": "    - go build -v ./...",
      "language": "text"
    }
  ]
}
[/block]
### Running Go Tests

This will run tests.
[block:code]
{
  "codes": [
    {
      "code": "    - go test -v ./...",
      "language": "text"
    }
  ]
}
[/block]
### Full Go Example
[block:code]
{
  "codes": [
    {
      "code": "  PreRelease:\n    - sudo apt-get -y update\n    - sudo apt-get -y install curl git\n    - mkdir -p ~/bin\n    - curl -sL -o ~/bin/gimme https://raw.githubusercontent.com/travis-ci/gimme/master/gimme\n    - chmod +x ~/bin/gimme\n    - export PATH=$PATH:~/bin\n    - gimme 1.4 \n    - source ~/.gimme/envs/latest.env\n    - go get -d -v ./...\n    - go build -v ./...\n    - go test -v ./...",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "NodeJS"
}
[/block]

[block:parameters]
{
  "data": {
    "0-0": "Language:",
    "1-0": "Version:",
    "2-0": "Tools Used:",
    "0-1": "node.js",
    "1-1": "v0.1.14+",
    "1-2": "nvm ls-remote",
    "0-2": "javascript runtime [https://nodejs.org/](https://nodejs.org/) ",
    "2-1": "curl: A software transfer tool",
    "2-2": "[http://curl.haxx.se/](http://curl.haxx.se/)",
    "3-1": "nvm: Node version manager",
    "3-2": "[https://github.com/creationix/nvm](https://github.com/creationix/nvm)",
    "4-1": "build essentials: compiler, libraries, and tools",
    "5-1": "libssl-dev: ssl development libraries"
  },
  "cols": 3,
  "rows": 6
}
[/block]
This example uses the `nvm` tool to download and install versions of `node.js`.

### Installing Tools

This code will ensure the apt-get index is up to date then install the necessary tools. If the tools already exist, apt-get will simply warn and the PreRelease phase will continue.
[block:code]
{
  "codes": [
    {
      "code": "  PreRelease:\n    - sudo apt-get -y update\n    - sudo apt-get -y install build-essential libssl-dev curl\n    - curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.0/install.sh | bash\n    - source ~/.nvm/nvm.sh",
      "language": "text"
    }
  ]
}
[/block]
### Specifying a node.js Version to Use

Using the `nvm` tool you can easily install a version of node.js. Here is an example installing version v0.12.7. Note, you could also install node.js version *stable*.
[block:code]
{
  "codes": [
    {
      "code": "    - nvm install v0.12.7",
      "language": "text"
    }
  ]
}
[/block]
### Getting node.js Packages

This will install any node.js packages and dependencies your application may need.
[block:code]
{
  "codes": [
    {
      "code": "    - npm install",
      "language": "text"
    }
  ]
}
[/block]
### Running Go Tests

This will run tests.
[block:code]
{
  "codes": [
    {
      "code": "    - npm test",
      "language": "text"
    }
  ]
}
[/block]
### Full node.js Example
[block:code]
{
  "codes": [
    {
      "code": "  PreRelease:\n    - sudo apt-get -y update\n    - sudo apt-get -y install build-essential libssl-dev curl\n    - curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.0/install.sh | bash\n    - source ~/.nvm/nvm.sh\n    - nvm install v0.12.7\n    - npm install\n    - npm test",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Java"
}
[/block]

[block:parameters]
{
  "data": {
    "0-0": "Language:",
    "0-1": "Java",
    "1-0": "Versions:",
    "2-0": "Tools:",
    "1-1": "6+",
    "2-1": "ant",
    "3-1": "gradle",
    "4-1": "maven",
    "4-2": "version 3"
  },
  "cols": 3,
  "rows": 5
}
[/block]
### Specifying a Java Version to use

Using the `webupd8team/java` repository we can easily install versions of Java.
[block:code]
{
  "codes": [
    {
      "code": "  PreRelease:\n    - sudo add-apt-repository ppa:webupd8team/java\n    - sudo apt-get -y update\n    - echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections\n    - echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections    \n    - sudo apt-get -y install oracle-java7-installer\n    - sudo apt-get -y install oracle-java7-set-default",
      "language": "text"
    }
  ]
}
[/block]
### Installing Tools

These steps will install the necessary tools. If the tools already exist, apt-get will simply warn and the PreRelease phase will continue.
[block:code]
{
  "codes": [
    {
      "code": "    - sudo apt-get -y install ant\n    - sudo apt-get -y install maven\n    - sudo apt-get -y install gradle",
      "language": "text"
    }
  ]
}
[/block]
### Building the Java application

This code will build your Java application based on the existing build instruction file. In particular:
* ./gradlew
* build.gradle
* pom.xml
[block:code]
{
  "codes": [
    {
      "code": "    - if [[ -f gradlew ]]; then\n    -   ./gradlew assemble \n    - elif [[ -f build.gradle ]]; then\n    -   gradle assemble\n    - elif [[ -f pom.xml ]]; then\n    -   mvn install -DskipTests=true -Dmaven.javadoc.skip=true -B -V\n    - fi",
      "language": "text"
    }
  ]
}
[/block]
### Testing the Java application

This code will test your Java application based on the existing build instruction file. If no file is found it will use `ant test`.
[block:code]
{
  "codes": [
    {
      "code": "    - if [[ -f gradlew ]]; then\n    -   ./gradlew check \n    - elif [[ -f build.gradle ]]; then\n    -   gradle check\n    - elif [[ -f pom.xml ]]; then\n    -   mvn test -B\n    - else\n    -   ant test\n    - fi",
      "language": "text"
    }
  ]
}
[/block]
### Full Java example
[block:code]
{
  "codes": [
    {
      "code": "PreRelease:\n    - sudo add-apt-repository ppa:webupd8team/java\n    - sudo apt-get -y update\n    - echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections\n    - echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections\n    - sudo apt-get -y install oracle-java7-installer\n    - sudo apt-get -y install oracle-java7-set-default\n    - sudo apt-get -y install ant\n    - sudo apt-get -y install maven\n    - sudo apt-get -y install gradle\n    \n    - if [[ -f gradlew ]]; then\n    -   ./gradlew assemble \n    - elif [[ -f build.gradle ]]; then\n    -   gradle assemble\n    - elif [[ -f pom.xml ]]; then\n    -   mvn install -DskipTests=true -Dmaven.javadoc.skip=true -B -V\n    - fi\n\n    - if [[ -f gradlew ]]; then\n    -   ./gradlew check \n    - elif [[ -f build.gradle ]]; then\n    -   gradle check\n    - elif [[ -f pom.xml ]]; then\n    -   mvn test -B\n    - else\n    -   ant test\n    - fi\n",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Ruby"
}
[/block]

[block:parameters]
{
  "data": {
    "0-0": "Language:",
    "1-0": "Versions:",
    "2-0": "Tools Used:",
    "0-1": "Ruby\njruby\nrbx",
    "1-1": "ruby 1.8.6+\njruby 1.6.8+\nrbx 1.4.3+",
    "2-1": "curl: A software transfer tool",
    "3-1": "rvm: A ruby version manager",
    "2-2": "[http://curl.haxx.se/](http://curl.haxx.se/) ",
    "3-2": "[https://rvm.io/](https://rvm.io/) ",
    "0-2": "Ruby programming language"
  },
  "cols": 3,
  "rows": 4
}
[/block]
### Installing Tools

This code will ensure the apt-get index is up to date then install the necessary tools. If the tools already exist, apt-get will simply warn and the PreRelease phase will continue.
[block:code]
{
  "codes": [
    {
      "code": "  PreRelease:\n    - sudo apt-get -y update\n    - sudo apt-get -y install curl\n    - gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3\n    - curl -sSL https://get.rvm.io | bash -s stable --autolibs=enabled \n    - source ~/.rvm/scripts/rvm",
      "language": "text"
    }
  ]
}
[/block]
### Specifying a Ruby Version to Use
[block:code]
{
  "codes": [
    {
      "code": "    - rvm install ruby-1.9.3\n    - rvm use 1.9.3",
      "language": "text"
    }
  ]
}
[/block]
### Installing Build Dependencies
[block:code]
{
  "codes": [
    {
      "code": "    - gem install bundle",
      "language": "text"
    }
  ]
}
[/block]
### Building the Application
[block:code]
{
  "codes": [
    {
      "code": "    - if [[ -f Gemfile ]]; then\n    -   if [[ -f Gemfile.lock ]]; then\n    -     bundle install --jobs=3 --retry=3 --deployment\n    -   else\n    -     bundle install --jobs=3 --retry=3\n    -   fi\n    - fi",
      "language": "text"
    }
  ]
}
[/block]
### Testing the Application
[block:code]
{
  "codes": [
    {
      "code": "    - if [[ -f Gemfile ]]; then\n    -   bundle exec rake\n    - else\n    -   rake\n    - fi",
      "language": "text"
    }
  ]
}
[/block]
### Full Ruby Example
[block:code]
{
  "codes": [
    {
      "code": "  PreRelease:\n    - sudo apt-get -y update\n    - sudo apt-get -y install curl\n    - gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3\n    - curl -sSL https://get.rvm.io | bash -s stable --autolibs=enabled \n    - source ~/.rvm/scripts/rvm\n    - rvm install ruby-1.9.3\n    - rvm use 1.9.3\n    - gem install bundle\n    - if [[ -f Gemfile ]]; then\n    -   if [[ -f Gemfile.lock ]]; then\n    -     bundle install --jobs=3 --retry=3 --deployment\n    -   else\n    -     bundle install --jobs=3 --retry=3\n    -   fi\n    - fi\n    - if [[ -f Gemfile ]]; then\n    -   bundle exec rake\n    - else\n    -   rake\n    - fi",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Rust"
}
[/block]

[block:parameters]
{
  "data": {
    "0-0": "Language:",
    "1-0": "Versions:",
    "2-0": "Tools Used:",
    "0-1": "Rust",
    "0-2": "The Rust programming language [https://www.rust-lang.org/](https://www.rust-lang.org/)",
    "1-1": "0.7+",
    "2-1": "ppa:hansjorg/rust rust language repository",
    "2-2": "rust version manager [https://launchpad.net/~hansjorg/+archive/ubuntu/rust](https://launchpad.net/~hansjorg/+archive/ubuntu/rust) ",
    "3-1": "cargo: rust package manager",
    "3-2": "[https://crates.io/](https://crates.io/) ",
    "4-1": "gcc: compiler",
    "4-2": "To compile rust packages for cargo"
  },
  "cols": 3,
  "rows": 5
}
[/block]
This example uses ppa:hansjorg/rust to install versions of rust.

### Installing Tools

This code will ensure the apt-get index is up to date, add the ppa:hansjorg/rust, and then install the necessary tools. If the tools already exist, apt-get will simply warn and the PreRelease phase will continue.
[block:code]
{
  "codes": [
    {
      "code": "  PreRelease:\n    - echo \"Begin PreInstall\"\n    - sudo add-apt-repository -y ppa:hansjorg/rust\n    - sudo apt-get -y update\n    - sudo apt-get -y install gcc",
      "language": "text"
    }
  ]
}
[/block]
### Specifying a Rust Version to Use 

Using the `ppa:hansjorg/rust` you can easily install a version of rust and cargo. Here is an example installing the nightly build.
[block:code]
{
  "codes": [
    {
      "code": "    - sudo apt-get -y install rust-nightly",
      "language": "text"
    }
  ]
}
[/block]
Other install options include:
[block:code]
{
  "codes": [
    {
      "code": "rust-0.10\nrust-stable\nrust-nightly",
      "language": "text"
    }
  ]
}
[/block]
### Getting Rust Package Manager

Cargo is the package manager for rust and is used to run the builds and tests.
[block:code]
{
  "codes": [
    {
      "code": "    - sudo apt-get -y install cargo-nightly",
      "language": "text"
    }
  ]
}
[/block]
### Building a Rust Application

This will build the rust application.
[block:code]
{
  "codes": [
    {
      "code": "    - cargo build --verbose",
      "language": "text"
    }
  ]
}
[/block]
### Running the Tests

The following will run your rust tests.
[block:code]
{
  "codes": [
    {
      "code": "    - cargo test --verbose",
      "language": "text"
    }
  ]
}
[/block]
### Full Rust Example
[block:code]
{
  "codes": [
    {
      "code": "  PreRelease:\n    - echo \"Begin PreInstall\"\n    - sudo add-apt-repository -y ppa:hansjorg/rust\n    - sudo apt-get -y update\n    - sudo apt-get -y install gcc\n    - sudo apt-get -y --force-yes install rust-stable\n    - sudo apt-get -y --force-yes install cargo-nightly\n    - cargo build --verbose\n    - cargo test --verbose",
      "language": "text"
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "PHP"
}
[/block]

[block:parameters]
{
  "data": {
    "0-0": "Language:",
    "1-0": "Versions:",
    "2-0": "Tools Used:",
    "0-1": "PHP",
    "0-2": "The PHP language.",
    "1-1": "5.2.17+",
    "2-1": "phpenv: php version manager",
    "3-1": "php-build: php version download and build tool",
    "2-2": "https://github.com/CHH/phpenv",
    "3-2": "https://github.com/php-build/php-build",
    "4-1": "composer: PHP Package manager",
    "4-2": "https://getcomposer.org"
  },
  "cols": 3,
  "rows": 5
}
[/block]
### Setting the Database Password

This section sets an environment variable that will be used later to provision the database root login.
[block:code]
{
  "codes": [
    {
      "code": "  Env:\n    - MYSQL_ROOT_PASSWORD: \"pa55w0rd\"",
      "language": "text"
    }
  ]
}
[/block]
### Installing Tools

This code will ensure the apt-get index is up to date and then install the necessary dependencies.
[block:code]
{
  "codes": [
    {
      "code": "  PreInstall:\n    - sudo apt-get -y update\n    - sudo apt-get -y install git\n    - 'sudo debconf-set-selections <<< \"mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD\"'\n    - 'sudo debconf-set-selections <<< \"mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD\"'\n    - sudo apt-get -y build-dep php5\n    - sudo apt-get -y install libmcrypt-dev libreadline-dev",
      "language": "text"
    }
  ]
}
[/block]
Install phpenv the php version manager
[block:code]
{
  "codes": [
    {
      "code": "    - git clone https://github.com/CHH/phpenv.git\n    - phpenv/bin/phpenv-install.sh\n    - export PATH=\"~/.phpenv/bin:$PATH\"\n    - eval \"$(phpenv init -)\"",
      "language": "text"
    }
  ]
}
[/block]
Install php-build the php version downloader
[block:code]
{
  "codes": [
    {
      "code": "    - git clone https://github.com/php-build/php-build.git\n    - sudo php-build/install.sh",
      "language": "text"
    }
  ]
}
[/block]
### Specifying PHP Version to Use
[block:code]
{
  "codes": [
    {
      "code": "    - php-build -i development 5.4.9 ~/.phpenv/versions/5.4.9\n    - phpenv rehash\n    - phpenv versions\n    - phpenv global 5.4.9\n    - php --version",
      "language": "text"
    }
  ]
}
[/block]
### Installing Composer Package Manager and Install Packages
[block:callout]
{
  "type": "warning",
  "body": "Composer requires PHP 5.3.2+"
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "    - curl -sS https://getcomposer.org/installer | php\n    - if [[ -f composer.json ]]; then\n    -   php composer.phar install\n    - fi\n    - php composer.phar require symfony/framework-bundle ",
      "language": "text"
    }
  ]
}
[/block]
You can `require` other dependencies in the manifest file at the end of this section, as the above example depicts installing symfony/framework-bundle.

### Installing phpunit and Run Tests
[block:code]
{
  "codes": [
    {
      "code": "    - wget https://phar.phpunit.de/phpunit.phar\n    - chmod +x phpunit.phar\n    - sudo mv phpunit.phar /usr/local/bin/phpunit\n    - phpunit --version\n    - phpunit",
      "language": "text"
    }
  ]
}
[/block]
### Full PHP Example
[block:code]
{
  "codes": [
    {
      "code": "  Env:\n    - MYSQL_ROOT_PASSWORD: \"pa55w0rd\"\n    \n  PreInstall:\n    - sudo apt-get -y update\n    - sudo apt-get -y install git\n    - 'sudo debconf-set-selections <<< \"mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD\"'\n    - 'sudo debconf-set-selections <<< \"mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD\"'\n    - sudo apt-get -y build-dep php5\n    - sudo apt-get -y install libmcrypt-dev libreadline-dev\n    \n    - git clone https://github.com/CHH/phpenv.git\n    - phpenv/bin/phpenv-install.sh\n    - export PATH=\"~/.phpenv/bin:$PATH\"\n    - eval \"$(phpenv init -)\"\n    \n    - git clone https://github.com/php-build/php-build.git\n    - sudo php-build/install.sh\n    \n    - php-build -i development 5.4.9 ~/.phpenv/versions/5.4.9\n    - phpenv rehash\n    - phpenv versions\n    - phpenv global 5.4.9\n    - php --version\n    \n    - curl -sS https://getcomposer.org/installer | php\n    - if [[ -f composer.json ]]; then\n    -   php composer.phar install\n    - fi\n    - php composer.phar require symfony/framework-bundle \n    \n    - wget https://phar.phpunit.de/phpunit.phar\n    - chmod +x phpunit.phar\n    - sudo mv phpunit.phar /usr/local/bin/phpunit\n    - phpunit --version\n    - phpunit",
      "language": "text"
    }
  ]
}
[/block]