Hier is de vertaalde en opgeschoonde Engelse versie:

---

# Installation Joola Infinity Robot

This guide is only intended if you are using this repository.

## Android VPN

Your mobile device must resolve a hostname that points to the Robot API. On Android, you cannot normally edit the hosts file directly. Use a pseudo VPN (Virtual Private Network) app. In this case, **"Virtual Switch Hosts"** is used.

1. Install **"Virtual Switch Hosts"** from the Google Play Store
   [https://play.google.com/store/apps/details?id=com.virtual_switch_hosts.app](https://play.google.com/store/apps/details?id=com.virtual_switch_hosts.app)
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

The `README.md` contains the same information as used here.

Run the following Docker commands if you also want to generate new certificates. Otherwise, only run the last command, for example after changing the YAML file:

```sh
docker compose -f ./docker-compose-certs.yaml up -d --remove-orphans
docker compose -f ./docker-compose-certs.yaml logs
docker compose -f ./docker-compose.yaml up -d --build
```

This application can communicate with the patched Infinity app from the `pinfinity_Android` folder.

You must install `ca.pem` (located in `certs`) on your Android device:

Go to:

Setup → Security and privacy → More security settings → Install from device storage → CA certificate → Install anyway → Select `ca.pem` from Downloads → Done

---

## pinfinity_Android (MITM)

No action is required here. The patched APK files are already included.

Version 2.1.1 can be installed directly on an Android device.

For `.xapk` files, use **"XAPK Installer"**:
[https://play.google.com/store/apps/details?id=com.wuliang.xapkinstaller](https://play.google.com/store/apps/details?id=com.wuliang.xapkinstaller)

Everything has been tested and works.

---

## pinfinity_RP folder

This is the Raspberry Pi version. Read the `README.md` in this folder.
