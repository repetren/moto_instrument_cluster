# Raspberry Pi 5 Motorcycle Instrument Cluster — Qt, CAN, Real-Time 3D

Digital motorcycle dashboard for Raspberry Pi 5 with a Qt UI, CAN-bus integration, and real-time 3D graphics.

Fully tested and integrated with a [CAN control panel](https://github.com/repetren/stm32_hmi_control_pannel) that uses physical inputs to generate interactive actions on the dashboard. 

![Image](https://github.com/user-attachments/assets/33ac92e3-4b31-4eb6-914c-c40214babb54)

[![Watch the video](https://img.youtube.com/vi/4OIe2Gqz7CM/maxresdefault.jpg)](https://youtu.be/4OIe2Gqz7CM)

### [Watch demo video from idea to final tests on YouTube](https://youtu.be/4OIe2Gqz7CM)

## Requirements
- Raspberry Pi 5
- [Waveshare 2-CH CAN HAT+](https://www.waveshare.com/wiki/2-CH_CAN_HAT+) (MCP2515 based) or compatible CAN interface.
- Tested display configuration - 720 × 1560 px [Waveshare 6.25-inch](https://www.waveshare.com/6.25inch-dsi-lcd.htm). 
- Installed [Boot2Qt](https://doc.qt.io/Boot2Qt/b2qt-qsg-raspberry.html) (Qt 6.9.1)

## Quick start

This project is designed for **Boot2Qt** and **must be built using Qt Creator** with Boot2Qt the Raspberry Pi 5.

### Step 1–3: Prepare Raspberry Pi environment

##### Step - 1. CAN hardware set-up
Uses the [SocketCAN Plugin](https://doc.qt.io/qt-6/qtserialbus-socketcan-overview.html)

```
ip link set can1 up type can bitrate 500000
```
Autostart on boot:
```
mkdir -p /data/user_scripts
cat > /data/user_scripts/setup_can.sh <<'EOF'
#!/bin/sh
ip link set can1 up type can bitrate 500000
EOF
chmod +x /data/user_scripts/setup_can.sh
```

##### Step - 2. Configure Qt Run environment.
Add to **/etc/default/qt** on Raspberry Pi:

```
MESA_LOADER_DRIVER_OVERRIDE=v3d
QML_XHR_ALLOW_FILE_READ=1
```

You can also set this via
Qt Creator → Preferences → Kits → Boot2Qt → Edit Run Environment

Improves GPU performance on Waveshare displays and allows reading local JSON files for error decoding.

[Check basic set up for Waveshare screens and RPi](https://www.waveshare.com/wiki/6.25inch_DSI_LCD)

##### Step - 3. Build & Deploy using Qt Creator
- Open the project in Qt Creator
- Select the Boot2Qt for Raspberry Pi 5 kit
- Press **Run** → Qt Creator will build and deploy to the Pi automatically

[Raspberry Pi quick start guide by Qt](https://doc.qt.io/Boot2Qt/b2qt-qsg-raspberry.html)

## Features
- Touch UI for notification center scrolling and 3D model rotation.
- 3D real-time bike model with light indicator synchronization.
- 2 UI screens. Main dashboard and information screen available below 10 km/h. (safety requirement)
- Real-time performance, low latency
- Modular & configurable for different CAN frame maps
- Notification handling. JSON-based error code mapping
- Physical input integration via [CAN control panel](https://github.com/repetren/stm32_hmi_control_pannel).

##### Decoding CAN signals:
- Telemetry (RPM, Speed, Gears)
- Fuel & Trip (Fuel level, low fuel warning, Odometer, Trip A)
- Lighting (High/Low beam, Turn signals, DRL)
- Safety (Errors, Warnings).

## CAN Frame Map
![Image](https://github.com/user-attachments/assets/5da04f03-c850-4726-8469-995679e1c428)



