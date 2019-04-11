# device_id

A Flutter plugin for retrieving the uid of a device

## Getting Started

To retrieve the id just import and call `String device_id = await DeviceId.getID;`.
To retrieve the imei call `String imei = await DeviceId.getIMEI;`.
To retrieve the meid call `String meid = await DeviceId.getMEID;`.
For imei and meid platform version >=26 is required, otherwise it will produces a PlatformExcpetion
Now you are good to go!
Note: device ids are not safe as you think, rooted/jailbreaked devices are able to change the ids.