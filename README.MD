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

## Proper Ansible

Blocked by [https://github.com/ansible/ansible/issues/72449](https://github.com/ansible/ansible/issues/72449)

## Current temporary setup script

https://chocolatey.org/docs/installation

```

// remove hibernation pretending to be shutdown, required for dual-boot (not sure is it case of badly designed Linux or evil Microsoft sobotaging Linux)
// sudo required
// https://superuser.com/a/1187234
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d "0" /f

// unpin from taskbar
# https://stackoverflow.com/questions/45152335/unpin-the-microsoft-edge-and-store-taskbar-shortcuts-programmatically
$appname = "Microsoft Edge"
((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | ?{$_.Name -eq $appname}).Verbs() | ?{$_.Name.replace('&','') -match 'Unpin from taskbar'} | %{$_.DoIt(); $exec = $true}
$appname = "Windows Store"
((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | ?{$_.Name -eq $appname}).Verbs() | ?{$_.Name.replace('&','') -match 'Unpin from taskbar'} | %{$_.DoIt(); $exec = $true}

# certificate myself as understanding that running script executes program
Set-ExecutionPolicy Unrestricted -force

# execute https://chocolatey.org/install.ps1
# yes, I am trusting Chocolatey and that they are not hacked, but
# installing using their packages is doing this anyway
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco install keepass -y
choco install firefox -y
choco install notepadplusplus -y
choco install 7zip -y
choco install git -y
choco install adobereader -y
choco install ruby -y
choco install vlc -y
choco install libreoffice -y
choco install androidstudio -y
choco install vscodium -y
choco install inkscape -y
choco install gimp -y
choco install python -y

clean C:\Users\mateusz\AppData\Local\Temp\chocolatey ( [cache cleanup is in premium version, wtf](https://github.com/chocolatey/choco/issues/1124#issuecomment-352315426) )

https://gitlab.com/geekygirlsarah/remove_win10_apps/-/blob/master/Uninstall_Win10_Apps.ps1

Get-AppxPackage -AllUsers Microsoft.3DBuilder | Remove-AppxPackage                      # Uninstall 3D Builder
Get-AppxPackage -AllUsers Microsoft.WindowsAlarms | Remove-AppxPackage                  # Uninstall Alarms and Clock
#Get-AppxPackage -AllUsers Microsoft.WindowsCalculator | Remove-AppxPackage             # Uninstall Calculator
Get-AppxPackage -AllUsers Microsoft.windowscommunicationsapps | Remove-AppxPackage      # Uninstall Calendar and Mail
#Get-AppxPackage -AllUsers *OneCalendar* | Remove-AppxPackage                            # Uninstall Calendar
Get-AppxPackage -AllUsers Microsoft.WindowsCamera | Remove-AppxPackage                  # Uninstall Camera
Get-AppxPackage -AllUsers Microsoft.BingFoodAndDrink | Remove-AppxPackage               # Uninstall Food & Drink
Get-AppxPackage -AllUsers Microsoft.MicrosoftOfficeHub | Remove-AppxPackage             # Uninstall Get Office
Get-AppxPackage -AllUsers *Skype* | Remove-AppxPackage                                  # Uninstall Get Skype
Get-AppxPackage -AllUsers Microsoft.Getstarted | Remove-AppxPackage                     # Uninstall Get Started
Get-AppxPackage -AllUsers Microsoft.WindowsZuneMusic | Remove-AppxPackage               # Uninstall Groove Music
Get-AppxPackage -AllUsers Microsoft.ZuneMusic | Remove-AppxPackage                      # Uninstall Groove Music
Get-AppxPackage -AllUsers Microsoft.BingHealthAndFitness | Remove-AppxPackage           # Uninstall Health
Get-AppxPackage -AllUsers Microsoft.WindowsMaps | Remove-AppxPackage                    # Uninstall Maps
Get-AppxPackage -AllUsers *messaging* | Remove-AppxPackage                              # Uninstall Mail, Messaging
Get-AppxPackage -AllUsers Microsoft.MicrosoftSolitaireCollection | Remove-AppxPackage    # Uninstall Microsoft Solitaire Collection
Get-AppxPackage -AllUsers Microsoft.BingFinance | Remove-AppxPackage                    # Uninstall Money
Get-AppxPackage -AllUsers Microsoft.WindowsZuneVideo | Remove-AppxPackage               # Uninstall Movies & TV
Get-AppxPackage -AllUsers Microsoft.ZuneVideo | Remove-AppxPackage                      # Uninstall Movies & TV
Get-AppxPackage -AllUsers Microsoft.BingNews | Remove-AppxPackage                       # Uninstall News
Get-AppxPackage -AllUsers Microsoft.Office.OneNote | Remove-AppxPackage                 # Uninstall OneNote
Get-AppxPackage -AllUsers Microsoft.OneConnect | Remove-AppxPackage                     # Uninstall Paid Wi-Fi & Cellular
Get-AppxPackage -AllUsers Microsoft.People | Remove-AppxPackage                         # Uninstall People
Get-AppxPackage -AllUsers Microsoft.WindowsPhone | Remove-AppxPackage                   # Uninstall Phone Companion
# Get-AppxPackage -AllUsers Microsoft.Windows.Photos | Remove-AppxPackage                 # Uninstall Photos
Get-AppxPackage -AllUsers Microsoft.Reader | Remove-AppxPackage                         # Uninstall Reader
Get-AppxPackage -AllUsers Microsoft.BingSports | Remove-AppxPackage                     # Uninstall Sports
Get-AppxPackage -AllUsers Microsoft.Office.Sway | Remove-AppxPackage                    # Uninstall Sway
Get-AppxPackage -AllUsers Microsoft.BingTravel | Remove-AppxPackage                     # Uninstall Travel
Get-AppxPackage -AllUsers Microsoft.SoundRecorder | Remove-AppxPackage                  # Uninstall Voice Recorder
Get-AppxPackage -AllUsers Microsoft.BingWeather | Remove-AppxPackage                    # Uninstall Weather
Get-AppxPackage -AllUsers Microsoft.XboxApp | Remove-AppxPackage                        # Uninstall Xbox


# *** Auto-installed apps ***

Get-AppxPackage -AllUsers *ACG* | Remove-AppxPackage                                    # Uninstall ACG Media Player
Get-AppxPackage -AllUsers *CandyCrush* | Remove-AppxPackage                             # Uninstall Candy Crush
Get-AppxPackage -AllUsers *Facebook* | Remove-AppxPackage                               # Uninstall Facebook
Get-AppxPackage -AllUsers *Plex* | Remove-AppxPackage                                   # Uninstall Plex server
Get-AppxPackage -AllUsers *Spotify* | Remove-AppxPackage                                # Uninstall Spotify
Get-AppxPackage -AllUsers *Twitter* | Remove-AppxPackage                                # Uninstall Twitter
Get-AppxPackage -AllUsers *Viber* | Remove-AppxPackage                                  # Uninstall Viber
Get-AppxPackage -AllUsers *3d* | Remove-AppxPackage                                     # View 3D
Get-AppxPackage -AllUsers *DolbyAccess* | Remove-AppxPackage                            # DolbyAccess



```

Start -> Settings -> Lock screen -> disable windows spotlight

windows decrappifiers

https://community.spiceworks.com/user-groups/windows-decrapifier-group

contains 

```
#News/Feeds taskbar item
Reg Add "$reglocation\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" /T REG_DWORD /V "ShellFeedsTaskbarViewMode" /D 2 /F
```

disablings news/feeds

## Configure Windows host so it can listen to Ansible commands

See official docs at https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html#host-requirements

## Minimum Powershell version

Run in Powershell console:

`Get-Host | Select-Object Version`

If it is >4 then it is OK. For lower versions extra steps are needed.


## WinRM service

WinRM service must be configured so that Ansible can connect to it.

See https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html#winrm-setup (note https://github.com/ansible/ansible/issues/72449 )

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
`Set-Item -Path WSMan:\localhost\Service\Auth\Basic -Value $true` (note https://github.com/ansible/ansible/issues/72449 )

[Enable](https://dev.to/gmarokov/configure-your-dev-windows-machine-with-ansible-41aj) Unencrypted connection:
`Set-Item -Path WSMan:\localhost\Service\AllowUnencrypted -Value $true`

### Install Linux on Windows
- Go to Windows Store, download Ubuntu
- Launch Ubuntu

```
choco install wsl-ubuntu-1804
```

from https://superuser.com/questions/1271682/is-there-a-way-of-installing-ubuntu-windows-subsystem-for-linux-on-win10-v170

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

https://stackoverflow.com/questions/58345011/setup-windows-10-workstation-using-ansible-installed-on-wsl

https://opensource.com/article/19/2/ansible-windows-admin
