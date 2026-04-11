# Introduction
This README focuses on running the Infinity software on a standard Raspberry Pi using Raspberry Pi OS Lite (64-bit, without a desktop environment).

It will likely also work on DietPi or other Raspberry Pi–based operating systems.

Be aware that some python files have been altered to make this work.  
***So when you change the username, the system will not run!***  
It is not a problem to change the password of infinity and/or root.

***If you have made new certificates, do not forget to copy the certs folder from the Infinity_Joola folder to this folder.***

---

# Raspberry Pi Shell Commands

## SSH configuration

Enable remote root login, for WinSCP or SCP:

```sh
sudo nano /etc/ssh/sshd_config
```

Find this line and change it:

```
PermitRootLogin yes
```

Restart SSH:

```sh
sudo service ssh restart
```

## View boot log

```sh
sudo journalctl
```

## Open configuration tool

```sh
sudo raspi-config
```

## Show active ports

```sh
netstat -lntu
```

---

# Setup Infinity

## Step 1. Configure `start.sh`

Edit `start.sh` and update:

* Product information
* Serial number
* Personal settings

## Step 2. Prepare SD card

Use Raspberry Pi Imager:

1. Select your Raspberry Pi model
2. Select OS: Raspberry Pi OS Lite (64-bit)
3. Fill in:

* Hostname: `Infinity`
* Username: `infinity`
* Password: `BaseInf`

## Step 3. Boot and connect

Insert the SD card and boot the Raspberry Pi.

Connect via SSH:

```sh
ssh infinity@<IP_ADDRESS>
```

## Step 4. Update system

```sh
sudo apt update
sudo apt upgrade
```

## Step 5. Install dependencies

```sh
sudo apt install uvicorn
sudo apt install python3-fastapi
```

## Step 6. Copy files and setup service

Use WinSCP or scp to copy all project files to the user home directory.

```
/home/infinity
```

Make scripts executable and install the service:

```sh
sudo chmod +x *.sh
sudo systemctl daemon-reload
sudo cp infinity-start.service /etc/systemd/system/
sudo systemctl enable infinity-start.service

You can do this on the run running system:
sudo systemctl start infinity-start.service
sudo systemctl status infinity-start.service

or just:
sudo reboot
```

Basically your done.

---

# Test the system

Open a browser and go to:

```
https://<IP_ADDRESS>/node/notifications
```

If the page loads, the system is running.

# DietPi commands
| command | description |
|----------|----------|
| dietpi-launcher | All the DietPi programs in one place |
| dietpi-config | Feature rich configuration tool for your device |
| dietpi-software | Select optimised software for installation |
| htop            | Resource monitor |
| cpu             | Shows CPU information and stats |

# DietPi installation infinity
Basic accounts for DietPi are: dietpi and root  
You can create a new account infinity with the command
```sh
adduser infinity
# add sudo rights to infinity
usermod -aG sudo infinity
# add dietpi rights to infinity
usermod -aG dietpi infinity
# not necessary, populate with default bash configuration files
cp /etc/skel/.bashrc /home/infinity/
cp /etc/skel/.profile /home/infinity/
chown infinity:infinity /home/infinity/.bashrc /home/infinity/.profile
```
or just create a new folder named /home/infinity.

Activate Bluetooth:  
*dietpi-config &#8594; 4  : Advanced Options.*  
Install OpenSSH server:  
*dietpi-software &#8594; SSH Server &#8594; OpenSSH server*  
Start the installation:  
*dietpi-software &#8594; Install*

PermitRootLogin is located in /etc/ssh/sshd_config.d/dietpi.conf


