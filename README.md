# Cookbook to deploy Java application using ChefDK

## Description

In order to rebuild your environment at any time without loosing installed packageas, or configuration this project is an example
of Infrastructure as Code.
The ChefDK + Vagrant tools allow you to code your infrastructure (VM, OS, Hypervisor, proxy, packages, etc) using Chefto provision your application and configure it.

## webapp-java Cookbook

This cookbook will deploy a simple Java application in a Tomcat webserver.

### Requirements

#### Platform

- Java

#### Cookbooks

- `tomcat` - Web server for Java applications

### Attributes

TODO: List your cookbook attributes here.

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

Then execute the Vagrant file to create and provision the VM:

.

### Execute a test to check if the service is running

#### Rake

Once your VM is ready, you can check if your application was correclty deployed. You can check verifying if the following command return the expected result:

```
curl http://localhost:8080
```

### Troubleshooting

If the application does not startu correctly or the installation failed for some reason, you can enter in the VM via Kitchen:

```
kitchen login
```

In the VM, you can check the following logs:

* Tomcat
```
cat /var/logs/tomcat/catalina.out
```

* Chef
```
cat /var/logs/chef/chef.log
```

## Contributing

You are welcome to contribute. Just follow these steps:

### Clone or fork the repository

```
git clone git@github.com:rubenspg/dev-env.git
```

### Do some work

```
git checkout master
git pull origin master
git checkout -b contrib/branch_name
```

### Create a PR
```
git push -u origin contrib/branch_name
```
