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

