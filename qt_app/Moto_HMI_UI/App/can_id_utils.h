#ifndef CAN_ID_UTILS_H
#define CAN_ID_UTILS_H

#include "bridgeregistry.h"
#include "notificationhandler.h"

void can_id100_handler(BridgeRegistry &bridge, QByteArray &data);
void can_id110_handler(BridgeRegistry &bridge, QByteArray &data);
void can_id120_handler(BridgeRegistry &bridge, QByteArray &data);
void can_id121_handler(BridgeRegistry &bridge, QByteArray &data);
void can_id130_handler(NotificationHandler &notificationHandler, QByteArray &data);

#endif // CAN_ID_UTILS_H
