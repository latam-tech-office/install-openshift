# Installation of Red Hat OpenShift Container Platform

Select where you want to install OpenShift on:
* [Microsoft Azure](https://github.com/latam-tech-office/install-openshift/blob/master/docs/azure.md)
* [Google Cloud Engine (aka GCE)](https://github.com/latam-tech-office/install-openshift/blob/master/docs/gce.md)
* Amazon Web Services (aka AWS)

# Before anything

These playbooks relies on some specific Ansible modules. Regardless what cloud provider you choose, make sure you've got the following:

1. [Ansible Azure Preview's Role](https://github.com/Azure/azure_preview_modules)
```
$ ansible-galaxy install Azure.azure_preview_modules
```

2. Upgrade Azure Python SDKs required by new Azure modules
```
$ pip install -r ~/.ansible/roles/Azure.azure_preview_modules/files/requirements-azure.txt
```
