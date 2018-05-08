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
