set -xe

ansible-playbook uninstall_openshift.yaml

ansible-playbook install_openshift.yaml \
              -e redhat_subscription_username=<RED HAT ACCESS USERNAME> \
              -e redhat_subscription_password=<RED HAT ACCESS PASSWORD> \
              -e openshift_master_url=<MASTER URL> \
              -e openshift_cloudapps_url=<CLOUDAPPS URL> \
              -e dns_zone=<Optional: DNS ZONE>

bin/install_openshift.sh
