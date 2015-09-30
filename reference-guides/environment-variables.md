---
title: "Environment Variables"
excerpt: ""
---
When deploying an application using Distelli, there are several places that Environment Variables are available. Including:

- [Distelli specific environment variables](#distelli-specific-environment-variables)
- [Distelli specific build variables](#distelli-specific-build-variables)
- [User supplied Distelli Manifest environment variables](#user-supplied-manifest-environment-variables)
- [User supplied application environment variables](#user-supplied-application-environment-variables) 
[block:api-header]
{
  "type": "basic",
  "title": "Distelli Specific Environment Variables"
}
[/block]
These are informative variables supplied by Distelli. These are available during all stages of the deployment, except PreRelease. For more information on the stages of deployment see:
* [Distelli Manifest Reference Guide](doc:distelli-manifest)
* [Deployment Types Reference Guide](doc:deployment-types)

### DISTELLI_APPNAME:
The name of the application being deployed. This is specified in the distelli_manifest.yml file and during the `distelli create` command.

### DISTELLI_APPHOME:
The home directory of the deployed application. This is a symlink to the DISTELLI_INSTALLHOME application package.

### DISTELLI_INSTALLHOME:
 The directory where the application package is deployed. An example usage of this variable can be found in the [Getting Started Java Application Guide](https://www.distelli.com/docs/getting-started/java-ubuntu).

### DISTELLI_BUILDNUM:
If this release was created from a successful build in Distelli (even on your build server) then this variable will contain the build number.

### DISTELLI_RELVERSION:
The deployed application release version in Distelli. This will be in the format of:
[block:code]
{
  "codes": [
    {
      "code": "v###",
      "language": "text"
    }
  ]
}
[/block]
Where ### is the incremented application release version. For more information on releases see [Releases](doc:releases).

### DISTELLI_RELEASE:
A URL link to the release page in the Distelli WebUI.

### DISTELLI_RELREPOTYPE:
When using the `CommitData:` section of the distelli-manifest.yml, this environment variable will document the **repository type** (i.e. Git, Mercurial...) is used. 

For more information on the CommitData section of the manifest see [Distelli Manifest](doc:distelli-manifest#commitdata).

For more information on using applications with repo's see:
* [Overview of CI/CD with Distelli](doc:overview-of-cicd-with-distelli) 
* [Integrating with a Repository](doc:integrating-with-a-repository) 
* [Creating an Application from a repository](creating-an-application-from-a-repository)

### DISTELLI_RELBRANCH:
When using the `CommitData:` section of the distelli-manifest.yml, this variable will document what **repository branch** that is associated with this deployed application. (i.e. master.)

### DISTELLI_RELREVISION:
When using the `CommitData:` section of the distelli-manifest.yml, this variable will display the **repository commit** associated with the deployed distelli application release.
[block:api-header]
{
  "type": "basic",
  "title": "Distelli Specific Build Variables"
}
[/block]
Build variables are user specified in the application repository settings. See [Specifying Build Variables](doc:specifying-build-variables).

### DISTELLI_MANIFEST

The DISTELLI_MANIFEST environment variable can be set in the build variables. This allows specification of an alternate Distelli manifest file during the build process. After completing a successful build, Distelli will do a [distelli push](doc:distelli-cli#push) and will consult the manifest specified for instructions on what files to package for the release.

The DISTELLI_MANIFEST environment variable can contain multiple distelli-manifest.yml files listed in a comma-separated format. Use this when dealing with a repository that has multiple applications.
[block:api-header]
{
  "type": "basic",
  "title": "User Supplied Manifest Environment Variables"
}
[/block]
Manifest Environment Variables are user specified in the distelli_manifest.yml file **[Env:](doc:distelli-manifest#env)** section. These variables are specific to an application.

Many of the Distelli [Tutorials](doc:tutorials-index)  exemplify the usage of supplying manifest environment variables. Here is an example distell_manifest.yml that includes usage of application environment variables:
[block:code]
{
  "codes": [
    {
      "code": "YourUserName/SimpleJavaApp:\n  Env:\n    - CLASSPATH: \"$(find lib/ -name '*.jar' | xargs echo | tr ' ' ':')\"\n    - PORT: \"8080\"\n    - JAVA_HOME: \"/$DISTELLI_INSTALLHOME/jre1.8.0_45\"\n    - JVM_ARGS: '\"-Duser.timezone=UTC -Xmx128M -Xms128M\"'\n    - ARGS: \"$PORT\"\n  PreInstall:\n    - 'wget -c -O jre-8u45-linux-x64.tar.gz --no-check-certificate --no-cookies --header \"Cookie: oraclelicense=accept-securebackup-cookie\" \"http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jre-8u45-linux-x64.tar.gz\"'\n    - 'tar -zxvf jre-8u45-linux-x64.tar.gz'\n  Exec:\n    - \"exec $JAVA_HOME/bin/java -cp $CLASSPATH $JVM_ARGS com.example.app.SimpleJavaApp $ARGS\"\n  PkgInclude:\n    - [\"target/*.jar\", \"lib/\"]\n    - [\"lib/*.jar\", \"lib/\"]",
      "language": "yaml"
    }
  ]
}
[/block]
These variables are available at any stage of the deployment except PreRelease.
[block:callout]
{
  "type": "warning",
  "body": "User supplied application environment variables will supersede user supplied manifest environment variables."
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "User Supplied Application Environment Variables"
}
[/block]
These environment variables are specific to an application environment. These are configured in the Distelli WebUI. To set these for an application environment follow these steps.

1. Ensure you are signed in to the Distelli WebUI.
2. Navigate to the application that you want to set environment variables.
3. Navigate to the application environment that you want to set environment variables.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/bEYV6uLSgW5ajWUm6mZG",
        "webui_env_env-vars.png",
        "1062",
        "344",
        "#4aa9aa",
        ""
      ]
    }
  ]
}
[/block]
4. Click in the text input box under the header **Environment Variables**.

In the resulting dialog you can set VARIABLE=Value. These variables will be available to applications deployed to this application environment.

These Variables override the [User Supplied Manifest Environment Variables](#user-supplied-manifest-environment-variables).
[block:api-header]
{
  "type": "basic",
  "title": "Questions or Comments?"
}
[/block]
We're always available to help you with your deployments. Feel free to contact [support](http://www.distelli.com/support) with any questions or comments.