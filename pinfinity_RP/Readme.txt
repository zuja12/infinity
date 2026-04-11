In start.sh staat alle product en serienummer informatie.

hostname: Infinity
User: infinity
pw: BaseInf
Ook voor root
sudo nano /etc/ssh/sshd_config
Find PermitRootLogin and change it to yes
sudo service ssh restart
Look at bootlog:
sudo journalctl

Configuratie veranderen:
sudo raspi-config
Aktieve poorten:
netstat -lntu

Winscp om bestanden te kopieren
scp via command voor terminal

Eerst:
sudo apt update
sudo apt upgrade

sudo apt install nginx

Onderstaande twee zijn niet nodig!
rem sudo systemctl start nginx
rem sudo apt install certbot
rem sudo apt install python3-certbot-nginx

sudo apt install uvicorn
sudo apt install python3-fastapi

/etc/hosts aanpassen (hoeft niet):
192.168.1.172 api-v6.admin.joola.com

sudo chmod +x *.sh

sudo cp infinity-start.service /etc/systemd/system/

nginx blijkt niet nodig te zijn:
uvicorn app.main:app --host 0.0.0.0 --port 8001 --ssl-keyfile certs/key.pem --ssl-certfile certs/cert.pem

/etc/nginx/sites-available/default aanpassen met gegevens uit nginx.conf

sudo reboot

Test: https://[ipadres]/node/notifications
