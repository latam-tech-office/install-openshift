# Installation of OpenShift on Microsoft Azure

## Requirements

In order to successfully create an OpenShift installation on Azure, be sure to have
* Azure Account
A valid account for your to setup your credentials. 
* Azure Subscription
This allows you to create any virtual machines on demand.
* Red Hat Subscription
OpenShift requires a valid subscription to be able to install packages from Red Hat's repository.


Besides that, it's important to have available
* Ansible (latest: version 2.5)
* Ansible's Module for Azure 
```
$ pip install ansible[azure]
```

a_b_c
## Setup
After cloning
