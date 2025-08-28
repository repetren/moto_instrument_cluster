#include "notificationhandler.h"
#include <qdebug.h>

NotificationHandler::NotificationHandler(QObject *parent)

    : QObject(parent)

{}

int NotificationHandler::notificationCode() const {
    return m_notificationCode;
}

void NotificationHandler::newNotification(int code) {
    m_notificationCode = code;
    emit newNotificationSignal();
}

void NotificationHandler::removeNotification(int code) {
    m_notificationCode = code;
    emit removeNotificationSignal();
}
