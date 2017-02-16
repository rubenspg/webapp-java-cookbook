[![Build Status](https://travis-ci.org/rubenspg/webapp-java-cookbook.svg?branch=master)](https://travis-ci.org/rubenspg/webapp-java-cookbook)

# Cookbook to deploy Java application using ChefDK

## Description

In order to rebuild your environment at any time without loosing installed packages or configuration, this project is an example
of Infrastructure as Code.
The ChefDK + Vagrant tools allow you to code your infrastructure (VM, OS, Hypervisor, proxy, packages, etc) using Chefto provision your application and configure it.

## Webapp-java Cookbook

This cookbook will deploy a simple Java application in a Tomcat webserver.

### Requirements

#### Platform

- Java

#### Cookbooks

- `application` - Download and start the Java application

### Attributes

* default['application']['user_name']   = System user name
* default['application']['user_group']  = System group name
* default[:application][:url]           = URL of the zip file containing the jar file.
* default[:application][:name]          = Application name
* default[:application][:home_dir]      = Application's root folder
* default[:application][:zip_file]      = Zip file's name
* default[:application][:jar_file]      = Jar file's name
* default[:application][:config_file]   = Config file's name (YML)

## How to use

### Dependencies

To start, install the following tools:

* [Vagrant](https://www.vagrantup.com/)
  * [Berkshelf plugin]()
* [Virtual Box](https://www.virtualbox.org/)
* [ChefDK](https://downloads.chef.io/chefdk)

### Getting started

This repository is configured to deploy a VM into Virtual Box and provision a Java application using Chef.

### Cloning the repo

First clone or create a fork of this repository. Then, follow the next steps.

```
git clone git@github.com:rubenspg/webapp-java-cookbook.git
```

### Executing Kitchen

ChefDk is the Chef development kit that contains all the tools you need to develop and test your infrastructure.
Kitchen is a tool to automatically test cookbook data across any combination of platforms and test suites.

Now, you have cloned this repo, enter in the root folder and execute the following command to create a VM via Vagrant
and provision our cookbook:
```
kitchen converge
```

### Execute a test to check if the service is running

Once your VM is ready, you can check if your application was correclty deployed. You can check verifying if the following command return the expected result:

```
curl http://localhost:8889
```

You should get something like:

```
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Metrics</title>
</head>
<body>
  <h1>Operational Menu</h1>
  <ul>
    <li><a href="/metrics?pretty=true">Metrics</a></li>
    <li><a href="/ping">Ping</a></li>
    <li><a href="/threads">Threads</a></li>
    <li><a href="/healthcheck">Healthcheck</a></li>
  </ul>
</body>
</html>

```

### Troubleshooting

If the application does not starts correctly or the installation failed for some reason, you can check the Kitchen log:

```
cat .kitchen/logs/default-ubuntu-1404.log
```

If you prefer login into the VM and check the logs:

```
kitchen login

cat /usr/share/satest/satest.log
```

## TravisCI

TravisCI is continous integration service linked to this repository that executes the build process.
It checks code issues (foodcritic and Rubocop) and executes the cookbook using Kitchen in a Docker container.

Here is the link of the builds: https://travis-ci.org/rubenspg/webapp-java-cookbook

## Contributing

You are welcome to contribute. Just follow these steps:

### Clone or fork the repository

```
git clone git@github.com:rubenspg/webapp-java-cookbook.git
```

### Do some work

```
git checkout master
git pull origin master
git checkout -b contrib/branch_name
```

### Check for foodcritic and Rubocop issues

A good practice is to check if your changed files have foodcritic and Rubocop issues. To execute those tests just run (root folder):
***Note that it will run the unit tests too***
```
chef exec rake
```

### Execute the tests

Before you commit and push your changes, run the tests to make sure everything is working:
```
chef exec rspec
```

You will be able to see the code coverage:
```
ChefSpec Coverage report generated...

  Total Resources:   7
  Touched Resources: 7
  Touch Coverage:    100.0%

You are awesome and so is your test coverage! Have a fantastic day!

```

### Create a PR
```
git push -u origin contrib/branch_name
```
