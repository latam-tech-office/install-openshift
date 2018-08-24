#!/bin/bash

set -xe
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/openshift-metrics/config.yml -e openshift_metrics_install_metrics=False
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/openshift-metrics/config.yml
