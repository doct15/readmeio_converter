---
title: "Chapter - Repositories"
excerpt: ""
---
To get started you will clone an existing application from Distelli's publicly available repository and add it to your own training repository.
[block:api-header]
{
  "type": "basic",
  "title": "What is a Repository"
}
[/block]
A software repository is a storage location from which software packages may be retrieved and installed on a computer.
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/uskEU01oTWRViwTLIsb0",
        "Training_Gfx.png",
        "729",
        "374",
        "#2e695b",
        ""
      ]
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Distelli Integrates with Public Repositories"
}
[/block]
Distelli integrates with:
 * github
 * bitbucket
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/4UWrlRaCTHK4bMxWKjkD",
        "github_bitbucket.png",
        "478",
        "248",
        "#1f5584",
        ""
      ]
    }
  ]
}
[/block]
More on this integration later in the course.
[block:api-header]
{
  "type": "basic",
  "title": "Lab 3.1 - Forking a Repository"
}
[/block]
Distelli has many working examples in our public github repository. You can copy an existing repository by forking the repository into your own github account.

For this training exercise, fork the Distelli Training_App1 repository into your training github account.

1. Ensure you are logged into [https://github.com/](https://github.com/).
2. Navigate to [https://github.com/Distelli/Training_App1](https://github.com/Distelli/Training_App1).
3. Click the **Fork** button (top right).
[block:image]
{
  "images": [
    {
      "image": [
        "https://www.filepicker.io/api/file/rLwCRd0VQSqkHn5vw8rz",
        "github_fork_repo_Training_App1.png",
        "993",
        "689",
        "#5b7baf",
        ""
      ]
    }
  ]
}
[/block]
4. Navigate to the newly forked application in your training repository.
[block:callout]
{
  "type": "warning",
  "body": "Remember to change the # to your student number."
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "https://github.com/trainingstudent#/Training_App1",
      "language": "text"
    }
  ]
}
[/block]

[block:parameters]
{
  "data": {
    "0-0": "1",
    "1-0": "2",
    "2-0": "3",
    "3-0": "4",
    "4-0": "5",
    "5-0": "6",
    "6-0": "7",
    "0-1": "https://github.com/trainingstudent1/Training_App1",
    "1-1": "https://github.com/trainingstudent2/Training_App1",
    "2-1": "https://github.com/trainingstudent3/Training_App1",
    "3-1": "https://github.com/trainingstudent4/Training_App1",
    "4-1": "https://github.com/trainingstudent5/Training_App1",
    "5-1": "https://github.com/trainingstudent6/Training_App1",
    "6-1": "https://github.com/trainingstudent7/Training_App1",
    "7-1": "https://github.com/trainingstudent8/Training_App1",
    "7-0": "8",
    "h-0": "Student #",
    "h-1": "Newly Forked Repo Link"
  },
  "cols": 2,
  "rows": 8
}
[/block]
Congratulations on successfully forking a repository.
[block:api-header]
{
  "type": "basic",
  "title": "Lab 3.2 - Cloning a Repository"
}
[/block]
Next you will clone a copy of the repository to your local system using the git tool. First check that git is installed on your system.

1. Enter the `git --version` command from a terminal (command prompt) window.

An example session:
[block:code]
{
  "codes": [
    {
      "code": "Laptop:~$ git --version\ngit version 1.9.1\nLaptop:~$",
      "language": "shell"
    }
  ]
}
[/block]
2. If git is not installed, install it from here: [http://git-scm.com/downloads](http://git-scm.com/downloads).
3. Next clone the repository using `git clone`. Here is the syntax:
[block:code]
{
  "codes": [
    {
      "code": "git clone https://github.com/trainingstudent8/Training_App1.git",
      "language": "text"
    }
  ]
}
[/block]
Here is an example session.
[block:code]
{
  "codes": [
    {
      "code": "Laptop:~$ git clone https://github.com/trainingstudent#/Training_App1.git\nCloning into 'Training_App1'...\nremote: Counting objects: 18, done.\nremote: Compressing objects: 100% (14/14), done.\nremote: Total 18 (delta 1), reused 17 (delta 0), pack-reused 0\nUnpacking objects: 100% (18/18), done.\nChecking connectivity... done.\nLaptop:~$",
      "language": "text"
    }
  ]
}
[/block]
4. Change to the newly created directory.
[block:code]
{
  "codes": [
    {
      "code": "cd Training_App1",
      "language": "shell"
    }
  ]
}
[/block]
You have successfully cloned a repository to your local system.
[block:api-header]
{
  "type": "basic",
  "title": "Lab 3.3 - Edit distelli-manifest.yml"
}
[/block]
1. In the Training_App1 directory, open the distelli-manifest.yml file in your favorite editor.
2. Change the **#** in the first line to your student number.
3. Save the file.
[block:callout]
{
  "type": "warning",
  "body": "Remember to use your student number, and not \"#\"."
}
[/block]
Example:
[block:code]
{
  "codes": [
    {
      "code": "trainingstudent#/training_app1:\n\n  PkgInclude:\n    - '*'\n\n  PkgExclude:\n    - node_modules/\n\n  PreRelease:\n    - echo \"Begin PreRelease\"\n    - sudo apt-get -y update\n    - sudo apt-get -y install nodejs\n    - sudo apt-get -y install npm\n    - sudo npm install\n    - npm test\n\n  PreInstall:\n    - echo \"Begin PreInstall\"\n    - sudo apt-get -y update\n    - sudo apt-get -y install nodejs\n    - sudo apt-get -y install npm\n\n  PostInstall:\n    - echo \"Begin PostInstall\"\n    - npm install\n    \n  Exec:\n    - echo \"Begin Exec\"\n    - /usr/bin/nodejs app.js",
      "language": "yaml"
    }
  ]
}
[/block]
Great. You have edited the manifest.
[block:api-header]
{
  "type": "basic",
  "title": "Lab 3.4 - Push Repository"
}
[/block]
Now you will save the change, you just made, back to the github repository. To do so, enter the following commands while in the Training_App1 directory:

1. `git config --global user.email "training+student#@distelli.com"`
2. `git config --global user.name "trainingstudent#"`
3. `git add .`
4. `git commit -m "fix manifest"`
5. `git push -u origin master`
[block:callout]
{
  "type": "warning",
  "body": "When doing the `git push` you will be prompted for your github username and password."
}
[/block]
An example session:
[block:code]
{
  "codes": [
    {
      "code": "Laptop:~/Training_App1$ git config --global user.email \"training+student#@distelli.com\"\nLaptop:~/Training_App1$ git config --global user.name \"trainingstudent#\"\nLaptop:~/Training_App1$ git add .\nLaptop:~/Training_App1$ git commit -m \"fix manifest\"\n[master 384d59c] fix manifest\n 1 file changed, 1 insertion(+), 1 deletion(-)\n\nLaptop:~/Training_App1$ git push -u origin master\nUsername for 'https://github.com': trainingstudent#\nPassword for 'https://trainingstudent#@github.com':\nCounting objects: 5, done.\nCompressing objects: 100% (3,3), done.\nWriting objects: 100% (3/3), 306 bytest | 0 bytes/s, done.\nTotal 3 (delta 2), reused 0 (delta 0)\nTo https://github.com/trainingstudent#/Training_App1.git\n    d21644b..384d59c  master -> master\nBranch master set up to track remote branch master from origin\nLaptop:~/Training_App1$",
      "language": "text"
    }
  ]
}
[/block]
Your change to the distelli-manifest.yml file is now been checked into the github repository. You can see this on the github website. Go to the your github repository on the web.
[block:code]
{
  "codes": [
    {
      "code": "https://github.com/trainingstudent#/Training_App1",
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
        "https://www.filepicker.io/api/file/3qCFiY6ETSimW58YBNnD",
        "github_Training_App1_fix_manifest.png",
        "1045",
        "786",
        "#4f6587",
        ""
      ]
    }
  ]
}
[/block]

[block:api-header]
{
  "type": "basic",
  "title": "Training Table of Contents"
}
[/block]
[TOC](doc:toc)