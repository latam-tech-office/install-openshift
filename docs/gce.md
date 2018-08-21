# Installation of OpenShift on Google Cloud Engine (GCE)

* Requirements
* Troubleshooting

## Requirements

In order to successfully create an OpenShift installation on GCE, be sure to have
* **GCE Account**: A valid account for to you setup your credentials.
* **Billing Account**: A billing account assigned a credit card in order to charge.
* **Red Hat Subscription**: OpenShift requires a valid subscription to be able to install packages from Red Hat's repository.

Besides that, it's important to have available
* Ansible (latest: version 2.5)
* Apache LibCloud
```bash
$ pip install apache-libcloud
```

## Setup file: openshift.config

This file contains all the necessary information you might need to have a basic cluster. Here is a example of the contents of this file:

```yaml
cloud_provider: gce

name: openshift
region: us-east1
labels:
   host: openshift

admin_username: demo
admin_ssh_publickey: /home/demo/.ssh/id_rsa.pub

openshift_master_url: master.example.com
openshift_cloudapps_url: cloudapps.example.com

redhat_subscription_username: myuser
redhat_subscription_password: mysecret

gce_credentials_file: /root/demo/somefile.json
gce_project_id: myproject
gce_service_account_email: myuser@myproject.iam.gserviceaccount.com

number_of_masters: 1
number_of_infras: 1
number_of_nodes: 2
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
