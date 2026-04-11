# Installatie Joola Infinity Robot

Deze uitleg is alleen bedoeld als je deze git gebruikt.

## Android VPN
Eerst moet je mobiel een adres krijgen die verwijst naar de Robot API. Helaas kan dit normaliter niet rechtstreeks in de hosts bestand op een Android telefoon. Hiervoor het je een pseudo VPN (Virtual Private Network) app nodig. In dit geval is er gekozen voor "Virtual switch hosts".

1.	Installeer "Virtual switch hosts" van Google Play Store (https://play.google.com/store/apps/details?id=com.virtual_switch_hosts.app&hl=nl).
2.	Open de app en klik op Add ![Add](add.png) .
3.	Voeg jouw IP address en hostname paar toe 
192.168.1.234 api-v6.admin.joola.com
4.	Klik op Save ![save](save.png)  
5.	Zet het schuifje ![schuifje](schuifje.png) op Enabled
6.	Klik op de Power knop ![powerknop](powerknop.png)  om de hostfile/VPN te starten. Deze knop wordt dan groen.

## pinfinity_Joola map
In de Readme.md staat de info zoals die ook in dit bestand gebruikt is.

Run de volgende drie docker commando’s als je ook nieuwe certificaten wil maken, anders alleen de laatste commando (b.v. bij een wijziging in de yaml bestand):
```sh
docker compose -f ./docker-compose-certs.yaml up -d --remove-orphans
docker compose -f ./docker-compose-certs.yaml logs
docker compose -f ./docker-compose.yaml up -d --build
```
Deze applicatie kan "praten" met de gepatchte infinity app, zoals die in de pinfinity_Android map staat.

De ca.pem (staat in certs) moet je op je android telefoon installeren. Hiervoor ga je naar setup &#8594; Beveiliging en privacy &#8594; Meer beveiligingsinstellingen &#8594; Installeren uit apparaatopslag &#8594; CA-certificaat &#8594; Toch installeren &#8594; Dan in Download de ca.pem aanwijzen &#8594; Done

## pinfinity_Android (Mitm)
Hier hoef je niets te doen. De de gepatchte APK's staan hier al. De 2.1.1 kan zonder andere tools geïnstalleerd worden op een Android telefoon.  
Voor een xapk bestand heb je de "XAPK installer" nodig (https://play.google.com/store/apps/details?id=com.wuliang.xapkinstaller&hl=nl).

Alles is getest en het werkt.

## pinfinity_RP folder
This is the Raspbarry Pi version. Read the Readme.md in this folder.
