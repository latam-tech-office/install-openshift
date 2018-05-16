# Installation of OpenShift on Microsoft Azure

* Requirements
* Troubleshooting

## Requirements

In order to successfully create an OpenShift installation on Azure, be sure to have
* **Azure Account**: A valid account for your to setup your credentials. 
* **Azure Subscription**: This allows you to create any virtual machines on demand.
* **Red Hat Subscription**: OpenShift requires a valid subscription to be able to install packages from Red Hat's repository.


Besides that, it's important to have available
* Ansible (latest: version 2.5)
* Ansible's Module for Azure 
```bash
$ pip install ansible[azure]
```

## Setup file: openshift.config

This file contains all the necessary information you might need to have a basic cluster. Here is a example of the contents of this file:
```yaml
cloud_provider: azure

name: openshift
region: southcentralus
labels:
   host: openshift

admin_username: demo
admin_ssh_publickey: /home/demo/.ssh/id_rsa.pub

openshift_master_url: master.example.com
openshift_cloudapps_url: cloudapps.example.com

redhat_subscription_username: myuser
redhat_subscription_password: mysecret

azure_subscription_id: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
azure_tenant: yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy
azure_client_id: zzzzzzzz-zzzz-zzzz-zzzz-zzzzzzzzzzzz
azure_secret: wwwwwwww-wwww-wwww-wwww-wwwwwwwwwwww


bastion_definition: { hostname: "openshift-bastion", machine: "Standard_D4s_v3", disk_type: "pd-standard", disk_size: 100 }
master_definition:
   - { hostname: "openshift-master1", machine: "Standard_D8s_v3", disk_type: "pd-standard", disk_size: 100, disk_docker_size: 20, disk_docker_type: "pd-standard" }
infra_definition:
   - { hostname: "openshift-infra1", machine: "Standard_D4s_v3", disk_type: "pd-standard", disk_size: 40, disk_docker_size: 20, disk_docker_type: "pd-standard" }
node_definition:
   - { hostname: "openshift-node1", machine: "Standard_D2s_v3", disk_type: "pd-standard", disk_size: 40, disk_docker_size: 20, disk_docker_type: "pd-standard" }
   - { hostname: "openshift-node2", machine: "Standard_D2s_v3", disk_type: "pd-standard", disk_size: 40, disk_docker_size: 20, disk_docker_type: "pd-standard" }
```

## Step #1: Networking 

Now, all you need to do, it's to run the Ansible's playbooks that it will create everything automatically. The first step will create all the necessary networking capabilities on Azure:

```bash
$  ./step1_create_network.yaml
```

## Step #2: Computing 

Once the networking is ready, you may proceed with the creation of all the necessary computing capabilities in order to deploy the whole cluster

```bash
$ ./step2_create_computing.yaml
```

## Step #3: OpenShift Installation

The last step, will start the installation of OpenShift 

```bash
$ ./step3_install_openshift.sh
```
## Deleting All

After you've done using your OpenShift Container Platform, you can get rid of everything by running

```bash
$ ansible-playbook delete_all.yaml
```

This will delete all the instances, storage and networking that was associated with your cluster
