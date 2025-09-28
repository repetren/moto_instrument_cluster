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

    // Getter
    int notificationCode() const;

    // Setter
    void newNotification(int code);
    void removeNotification(int code);

signals:
    void newNotificationSignal();
    void removeNotificationSignal();

private:
    int m_notificationCode = 0;
};

#endif // NOTIFICATIONHANDLER_H
