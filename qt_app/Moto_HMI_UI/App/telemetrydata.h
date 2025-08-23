#ifndef TELEMETRYDATA_H
#define TELEMETRYDATA_H

#include <QObject>

class TelemetryData : public QObject
{
    Q_OBJECT

    Q_PROPERTY(uint16_t rpmValue READ rpmValue NOTIFY rpmValueChanged FINAL)


public:
    explicit TelemetryData(QObject *parent = nullptr);

    //Getter functions
    uint16_t rpmValue() const;

    //Setter functions
    void updateRpmValue(uint16_t value);

signals:
    void rpmValueChanged();

private:
    uint16_t m_rpmValue = 500;
};

#endif // TELEMETRYDATA_H
