#!/usr/bin/bash
# https://github.com/jkramarz/recovery/blob/master/run.sh
# https://docs.ansible.com/ansible/latest/modules/apt_module.html
# https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html
set -ev

sudo apt-get install ansible -y
echo "localhost ansible_connection=local user=$USER" > inventory
ansible-playbook -v -i inventory site.yml
