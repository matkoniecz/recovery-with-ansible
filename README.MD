# Linux

```
sudo apt-get remove firefox -y
sudo apt-get update
sudo apt-get install git -y
git clone https://github.com/matkoniecz/recovery-with-ansible
cd recovery-with-ansible
sudo bash run.sh
```

# Windows

## Configure Windows host so it can listen to Ansible commands

See official docs at https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html#host-requirements

## Get WSL to run Ansible from computer that will be configured 
- In start menu search "feat" to get access to "Turn Windows features on and off".
- Scroll to bottom of the list and enable Windows Subsystem for Linux
- Restart system as required.
- Go to Windows Store, download Ubuntu
- Launch Ubuntu

## Unprocessed hints

https://docs.ansible.com/ansible/latest/user_guide/windows.html#windows 

https://docs.ansible.com/ansible/latest/user_guide/windows_faq.html#can-ansible-run-on-windows

https://www.how2shout.com/how-to/how-to-install-ansible-on-windows-10.html 

https://docs.microsoft.com/en-us/windows/wsl/

see Telegram discussion