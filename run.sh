#!/usr/bin/bash
# from https://github.com/jkramarz/recovery/blob/master/run.sh
# from https://docs.ansible.com/ansible/latest/modules/apt_module.html
set -ev

sudo apt-get install ansible
echo "localhost ansible_connection=local user=$USER" > inventory
ansible-playbook -v -i inventory site.yml