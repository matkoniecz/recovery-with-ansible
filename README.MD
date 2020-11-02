# Linux

```
sudo apt-get remove firefox -y
sudo apt-get update
sudo apt-get install git -y

# TODO: merge it into ansible?
# clone my private repo
git clone https://gitlab.com/matkoniecz/boot_restore_script.git
# clone my public dotfile repo
git clone https://github.com/matkoniecz/my_public_dotfiles.git

git clone https://github.com/matkoniecz/recovery-with-ansible
cd recovery-with-ansible
git fetch origin
sudo bash run.sh
```

# Windows

## Current temporary setup script

https://chocolatey.org/docs/installation

```
choco install keepass -y
choco install firefox -y
choco install notepadplusplus -y
choco install 7zip -y
choco install git -y
choco install adobereader -y
choco install ruby -y
choco install vlc -y

choco install libreoffice -y
choco install androidstudio
```

## Configure Windows host so it can listen to Ansible commands

See official docs at https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html#host-requirements

## Minimum Powershell version

Run in Powershell console:

`Get-Host | Select-Object Version`

If it is >4 then it is OK. For lower versions extra steps are needed.


## WinRM service

WinRM service must be configured so that Ansible can connect to it.

See https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html#winrm-setup

Make your trusted network private, as WinRM will work [only in private networks](https://dev.to/gmarokov/configure-your-dev-windows-machine-with-ansible-41aj) (changing WinRM behavior is possible but not recommended).

[Run](https://dev.to/gmarokov/configure-your-dev-windows-machine-with-ansible-41aj) `Enable-PSRemoting` in powershell as an admin.

## Get WSL to run Ansible from computer that will be configured 

### Enable WSL

See https://docs.microsoft.com/en-us/windows/wsl/install-win10

- In start menu search "feat" to get access to "Turn Windows features on and off".
- Scroll to bottom of the list and enable Windows Subsystem for Linux
- Restart system as required.

```
 Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

was [mentioned](https://dev.to/gmarokov/configure-your-dev-windows-machine-with-ansible-41aj) as a proper alternative

[Enable](https://dev.to/gmarokov/configure-your-dev-windows-machine-with-ansible-41aj) Basic Auth:
`Set-Item -Path WSMan:\localhost\Service\Auth\Basic -Value $true`

[Enable](https://dev.to/gmarokov/configure-your-dev-windows-machine-with-ansible-41aj) Unencrypted connection:
`Set-Item -Path WSMan:\localhost\Service\AllowUnencrypted -Value $true`

### Install Linux on Windows
- Go to Windows Store, download Ubuntu
- Launch Ubuntu

```
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile Ubuntu.appx -UseBasicParsing
```

was [mentioned](https://dev.to/gmarokov/configure-your-dev-windows-machine-with-ansible-41aj) as a proper alternative

though it appears to download specific Ubuntu version

## Linux on Windows

- Launch Ubuntu (as WSL)
- Note that Windows drives are in `/mnt/`
tmp test:

```
cd ~
sudo apt-get update
sudo apt-get install git -y
git clone https://github.com/matkoniecz/recovery-with-ansible
cd recovery-with-ansible
cd windows_test
git fetch origin
sudo bash run.sh
```

once Ansible will be Windows ready:
```
cd ~
sudo apt-get update
sudo apt-get install git -y

# TODO: merge it into ansible?
# clone my private repo
git clone https://gitlab.com/matkoniecz/boot_restore_script.git
# clone my public dotfile repo
git clone https://github.com/matkoniecz/my_public_dotfiles.git

git clone https://github.com/matkoniecz/recovery-with-ansible
cd recovery-with-ansible
git fetch origin
sudo bash run.sh
```

## Unprocessed hints

https://github.com/Wintus/Ansible-WSL

https://github.com/gmarokov/ansible-playbook-postinstall-win

https://docs.ansible.com/ansible/latest/user_guide/windows.html#windows 

https://docs.ansible.com/ansible/latest/user_guide/windows_faq.html#can-ansible-run-on-windows

https://www.how2shout.com/how-to/how-to-install-ansible-on-windows-10.html 

https://docs.microsoft.com/en-us/windows/wsl/

see Telegram discussion

https://stackoverflow.com/questions/58345011/setup-windows-10-workstation-using-ansible-installed-on-wsl

https://opensource.com/article/19/2/ansible-windows-admin
