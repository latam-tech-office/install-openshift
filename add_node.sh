#!/bin/bash
set -xe
ansible-playbook add_node.yaml
pubkey=/root/.ssh/id_rsa.pub
ssh -i ${pubkey%.*} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@35.196.58.231 "sudo /root/add_node.sh"
ssh -i ${pubkey%.*} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@35.196.58.231 "sudo rm -rf add_node.sh"
