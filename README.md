# Room-Assistant Docker

This docker runs [room-assistant](https://github.com/mKeRix/room-assistant) for the purposes of scanning for BLE iBeacons and publishing the results to an MQTT server.

# Installation

## Pre-requisites
Bluetooth must be installed and configured on your host machine.

Verify that the command `hciconfig dev` outputs a device and that the device is listed as `UP RUNNING`. If the device is down, run `sudo hciconfig hci0 UP`.

## Install the docker container
`docker pull grantbey/room`
`docker run -d --name="room" --privileged --net=host -v <local config directory>:/root/room-assistant/config grantbey/room`

## Arguments
`--name="room"`: give the container whichever name you like
`-v <local config directory>:/root/room-assistant/config`: this should map to a local directory where your config file resides. You can download the sample config file [here](https://github.com/mKeRix/room-assistant/raw/master/config/default.json). Note that this file _must_ be renamed to `local.json` in order for this to work. See the [source repository](https://github.com/mKeRix/room-assistant) for details on configuration.