# Installatie Joola Infinity Robot
## Android VPN
Eerst moet je mobiel een adres krijgen die verwijst naar de Robot API. Helaas kan dit normaliter niet rechtstreeks in de hosts bestand op een Android telefoon. Hiervoor het je een pseudo VPN (Virtual Private Network) app nodig. In dit geval is er gekozen voor "Virtual switch hosts".

1.	Installeer "Virtual switch hosts" van Google Play Store.
2.	Open de app en klik op Add ![Add](add.png) .
3.	Voeg jouw IP address en hostname paar toe 
192.168.1.234 api-v6.admin.joola.com
4.	Klik op Save ![save](save.png)  
5.	Zet het schuifje ![schuifje](schuifje.png) op Enabled
6.	Klik op de Power knop ![powerknop](powerknop.png)  om de hostfile/VPN te starten. Deze knop wordt dan groen.

## pinfinity_Joola map
In deze git is alles al aanwezig, maar als dat niet zo is, of je wil upgraden, dan moet je de git repository van Wolle-Lukas ophalen: 

```sh
git clone https://github.com/Wolle-Lukas/pinfinity
```
In de Readme.md staat de info zoals die ook in dit bestand gebruikt is.

docker-compose.yaml “XXX” aanpassen naar:
```xml
environment:
      PINFINITY_NAME: "Infinity van Hans"
      PINFINITY_EMAIL: "hansvlig30@hotmail.com"
      PINFINITY_DEVICE_ID: "98D331F340E60001"
      PINFINITY_DEVICE_NAME: "InfinityHans"
      PINFINITY_SERIAL_NUMBER: "JIR2021050068"
```

Run hierna de volgende drie docker commando’s:
```sh
docker compose -f ./docker-compose-certs.yaml up -d --remove-orphans
docker compose -f ./docker-compose-certs.yaml logs
docker compose -f ./docker-compose.yaml up -d --build
```
Deze applicatie kan "praten" met de gepatchte infinity app.
Als je alleen de infinity container wil aanmaken, dan is de laatste commando genoeg. De certificaten blijven wel staan.

De ca.pem (staat in certs) moet je wel op je android telefoon installeren. Hiervoor ga je naar setup --> Beveiliging en privacy --> Meer beveiligingsinstellingen --> Installeren uit apparaatopslag --> CA-certificaat --> Toch installeren --> Dan in Download de ca.pem aanwijzen --> Done

## pinfinity_Android (Mitm)
Komt voor een deel van https://github.com/niklashigi/apk-mitm  

De originele infinity app moet nog gepatched worden, zodat het certificaat van Joola niet meer dwars zit.

De volgende twee commando's voer je hier uit:
```sh
docker compose up --build
docker compose run -v D:\Downloads:/downloads --remove-orphans pinfinity_android bash
```
D:\Downloads kan veranderd worden naar een eigen map.  
Het is verstandig om de --remove-orphans te laten staan, zodat je Docker omgeving redelijk schoon blijft.

Download de inifity app van:  
https://apkpure.com/joola-infinity/com.joola.infinity/versions  
Voor de infinity app kan het beste deze gedownload worden:  
https://apkpure.com/joola-infinity/com.joola.infinity/download/2.1.1

Voer daarna het volgende commando uit in docker shell van de pinfinity_android container.

```sh
apk-mitm JOOLA\ Infinity_2.1.1_APKPure.apk
```

Alles is getest en het werkt.
