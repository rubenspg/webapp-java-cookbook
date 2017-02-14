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


# webapp-java Cookbook

This cookbook will deploy a simple Java application in a Tomcat webserver.

## Requirements

### Platform

- Java

### Cookbooks

- `tomcat` - Web server for Java applications

## Attributes

TODO: List your cookbook attributes here.

e.g.
### webapp-java::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['webapp-java']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### webapp-java::default

TODO: Write usage instructions for each cookbook.

e.g.
Just include `webapp-java` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[webapp-java]"
  ]
}
```

## Contributing

TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Authors: TODO: List authors
