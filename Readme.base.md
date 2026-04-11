Hier is de vertaalde en opgeschoonde Engelse versie in Markdown:

---

# Installation Joola Infinity Robot

## Android VPN

Your mobile device must resolve a hostname that points to the Robot API. On Android, you cannot normally edit the hosts file directly. Use a pseudo VPN (Virtual Private Network) app. In this case, **"Virtual Switch Hosts"** is used.

1. Install **"Virtual Switch Hosts"** from the Google Play Store
2. Open the app and click **Add** ![Add](add.png)
3. Add your IP address and hostname pair:

```
192.168.1.234 api-v6.admin.joola.com
```

4. Click **Save** ![save](save.png)
5. Enable the toggle ![toggle](schuifje.png)
6. Press the **Power button** ![power](powerknop.png) to start the host file or VPN. The button turns green

---

## pinfinity_Joola folder

This repository already contains everything. If not, or if you want to upgrade, clone the repository from Wolle-Lukas:

```sh
git clone https://github.com/Wolle-Lukas/pinfinity
```

The `README.md` contains the same information as used here.

Update `docker-compose.yaml` and replace “XXX” with:

```yaml
environment:
  PINFINITY_NAME: "Infinity of Hans"
  PINFINITY_EMAIL: "hansvlig30@hotmail.com"
  PINFINITY_DEVICE_ID: "98D331F340E60001"
  PINFINITY_DEVICE_NAME: "InfinityHans"
  PINFINITY_SERIAL_NUMBER: "JIR2021050068"
```

Run the following three Docker commands:

```sh
docker compose -f ./docker-compose-certs.yaml up -d --remove-orphans
docker compose -f ./docker-compose-certs.yaml logs
docker compose -f ./docker-compose.yaml up -d --build
```

This application can communicate with the patched Infinity app.

If you only want to create the Infinity container, the last command is enough. The certificates remain available.

You must install `ca.pem` (located in `certs`) on your Android device:

Go to:

Setup → Security and privacy → More security settings → Install from device storage → CA certificate → Install anyway → Select `ca.pem` from Downloads → Done

---

## pinfinity_Android (MITM)

Partly based on:
[https://github.com/niklashigi/apk-mitm](https://github.com/niklashigi/apk-mitm)

The original Infinity app must be patched to bypass the Joola certificate.

Run the following commands:

```sh
docker compose up --build
docker compose run -v D:\Downloads:/downloads --remove-orphans pinfinity_android bash
```

You can change `D:\Downloads` to your own folder.

Keep `--remove-orphans` to maintain a clean Docker environment.

Download the Infinity app from:
[https://apkpure.com/joola-infinity/com.joola.infinity/versions](https://apkpure.com/joola-infinity/com.joola.infinity/versions)

Recommended version:

[https://apkpure.com/joola-infinity/com.joola.infinity/download/2.1.1](https://apkpure.com/joola-infinity/com.joola.infinity/download/2.1.1)

Run this command inside the Docker shell of the `pinfinity_android` container:

```sh
apk-mitm JOOLA\ Infinity_2.1.1_APKPure.apk
```

Everything has been tested and works.

---

## pinfinity_RP folder

This is the Raspberry Pi version. Read the `README.md` in this folder.

