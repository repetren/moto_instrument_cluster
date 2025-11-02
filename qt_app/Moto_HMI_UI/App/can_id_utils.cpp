#include "bridgeregistry.h"
#include "notificationhandler.h"

// Use CAN frame map from project's GitHub page

void can_id100_handler(BridgeRegistry &bridge, QByteArray &data){
    bridge.gearBox.setValue(static_cast<uint8_t>(data[0]));
    bridge.speedBackend.setValue(static_cast<uint16_t>(data[1]) << 8 | data[2]);
    bridge.rpmBackend.setValue(static_cast<uint16_t>(data[3]) << 8 | data[4]);
    bridge.engineTemp.setValue(static_cast<uint8_t>(data[5]));
    bridge.coolantTemp.setValue(static_cast<uint8_t>(data[6]));
}

void can_id110_handler(BridgeRegistry &bridge, QByteArray &data){
    bridge.turnRight.setFlag(data[0] >> 6 & 0b01);
    bridge.turnLeft.setFlag(data[0] >> 7 & 0b1);
    bridge.beamMode.setValue(data[0] >> 4 & 0b0011);
}

void can_id120_handler(BridgeRegistry &bridge, QByteArray &data) {
    bridge.fuelLevel.setValue(static_cast<uint16_t>(data[0] << 8 | data[1]));
    bridge.litersPerKm.setValue(static_cast<uint16_t>(data[2]));
    bridge.fuelRange.setValue(static_cast<uint16_t>(data[3] << 8 | data[4]));
    bridge.lowFuelLevel.setFlag(static_cast<uint8_t>(data[5]));
}

void can_id121_handler(BridgeRegistry &bridge, QByteArray &data) {
    bridge.odoBackend.setValue(static_cast<uint16_t>(data[0] << 24 | data[1] << 16 | data[2] << 8 | data[3]));
    bridge.tripABackend.setValue(static_cast<uint16_t>(data[4] << 8 | data[5]));
}

void can_id130_handler(NotificationHandler &notificationHandler, QByteArray &data) {
    if (data[2] == 1) {
        notificationHandler.newNotification(data[0] * 100 + data[1]);
    }
    else if (data[2] == 0) {
        notificationHandler.removeNotification(data[0] * 100 + data[1]);
    }
}
