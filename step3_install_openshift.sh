#!/bin/bash
set -xe
pubkey=/home/mauricio/.ssh/id_rsa.pub
ssh -i ${pubkey%.*} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@35.196.23.164 "sudo /root/install_openshift.sh"
