#ifndef NOTIFICATIONHANDLER_H
#define NOTIFICATIONHANDLER_H

#include <QObject>

class NotificationHandler : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int notificationCode READ notificationCode NOTIFY newNotificationSignal FINAL)
    Q_PROPERTY(int notificationCode READ notificationCode NOTIFY removeNotificationSignal FINAL)

public:
    explicit NotificationHandler(QObject *parent = nullptr);

    // Notification code getter function
    int notificationCode() const;

    // Notification setter function
    void newNotification(int code);
    void removeNotification(int code);

signals:
    void newNotificationSignal();
    void removeNotificationSignal();

private:
    int m_notificationCode = 0;
};

#endif // NOTIFICATIONHANDLER_H
