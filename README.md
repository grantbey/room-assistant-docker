# Room-Assistant Docker

This docker runs [room-assistant](https://github.com/mKeRix/room-assistant) for the purposes of scanning for BLE iBeacons and publishing the results to an MQTT server.

# Installation

## Pre-requisites
Bluetooth must be installed and configured on your host machine.

Verify that the command `hciconfig dev` outputs a device and that the device is listed as `UP RUNNING`. If the device is down, run `sudo hciconfig hci0 up`.

Disable bluetooth on the host machine to ensure it does not conflict:
`sudo systemctl stop bluetooth && sudo systemctl disable bluetooth`

You may have to install the correct firmware for your bluetooth device. See [here](https://github.com/winterheart/broadcom-bt-firmware) for more details.

## Install the docker container
1. Pull the image

``docker pull grantbey/room:latest``

2. Start the container

``docker run -d --name="room" --privileged --restart=always --net=host -v <local config directory>:/root/room-assistant/config grantbey/room:latest``
Note: `--privileged` doesn't seem to be necessary, but `--net=host` is.

## Arguments
`--name="room"`: give the container whichever name you like
`-v <local config directory>:/root/room-assistant/config`: this should map to a local directory where your config file resides. You can download the sample config file [here](https://github.com/mKeRix/room-assistant/raw/master/config/default.json). Note that this file _must_ be renamed to `local.json` in order for this to work. See the [source repository](https://github.com/mKeRix/room-assistant) for details on configuration.
`--restart=always`: ensures that the docker will start automatically. See [here](https://docs.docker.com/engine/admin/start-containers-automatically/#use-a-restart-policy).