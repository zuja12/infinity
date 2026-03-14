# version: '1.0'
# author: Jan Zuur
# This Dockerfile sets up an environment for working with Android SDK and the apk-mitm tool, which is used for modifying APK files. It installs the necessary dependencies, including the Android SDK command-line tools, and configures the environment variables for Android development. The apk-mitm tool is installed globally using npm, allowing you to use it to modify APK files within the container.
# To build the Docker image, run:
# docker build -t pinfinity_android .
# or if you have the yaml file also:
# docker compose up --build
# This build process may take some time.
# The docker-compose.yaml file looks like this:
# services:
#   pinfinity_android:
#     container_name: pinfinity_android
#     build:
#       context: .
#       dockerfile: Dockerfile
#     image: pinfinity_android:latest
#     stdin_open: true
#     tty: true
#     volumes:
#       - D:\Downloads:/downloads
#
# To run the container and use the apk-mitm tool, you can use:
# docker compose run --remove-orphans pinfinity_android bash
# if you have the yaml file, otherwise:
# docker compose run -v D:\Downloads:/downloads --remove-orphans pinfinity_android bash
# This command mounts the D:\Downloads directory from your host machine to the /downloads directory in the container, allowing you to access your APK files. The --remove-orphans flag ensures that any orphaned containers are removed after the command is executed.
# You may find it necessary to adjust the volume mount path (D:\Downloads) to match the location of your APK files on your host machine. Once inside the container, you can navigate to the /downloads directory and use the apk-mitm command to modify your APK files as needed.
# Possible command to run the apk-mitm command.
# apk-mitm [your apk file here]
# or directly in this file:
# RUN apk-mitm /downloads/your-apk-file.apk
# This can be an APK or a XAPK file. The output will be a modified file that can be installed on an Android device.
# -patched will be added to the filename of the modified APK.
# The infinity app can be downloaded from: https://apkpure.com/joola-infinity/com.joola.infinity/versions
#
FROM node:20-bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV ANDROID_HOME=/opt/android-sdk
ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV PATH=${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/build-tools/34.0.0:${PATH}

WORKDIR /opt

RUN apt-get update && apt-get install -y --no-install-recommends \
    openjdk-17-jdk \
    ca-certificates \
    wget \
    unzip \
    zip \
    git \
 && rm -rf /var/lib/apt/lists/*

RUN wget -q https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O cmdline-tools.zip \
 && mkdir -p ${ANDROID_HOME}/cmdline-tools \
 && unzip -q cmdline-tools.zip -d ${ANDROID_HOME}/cmdline-tools \
 && mv ${ANDROID_HOME}/cmdline-tools/cmdline-tools ${ANDROID_HOME}/cmdline-tools/latest \
 && rm cmdline-tools.zip

RUN yes | sdkmanager --licenses > /dev/null \
 && sdkmanager \
    "platform-tools" \
    "build-tools;34.0.0" \
    "platforms;android-34"

# RUN apt-get update \
#  && apt-get install -y --no-install-recommends apk-mitm \
#  && rm -rf /var/lib/apt/lists/*
# apk-mitm is not available in the default repositories, so we install it globally using npm.
RUN npm install -g apk-mitm