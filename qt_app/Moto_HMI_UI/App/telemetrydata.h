#ifndef TELEMETRYDATA_H
#define TELEMETRYDATA_H

#include <QObject>

class TelemetryData : public QObject
{
    Q_OBJECT

    Q_PROPERTY(uint16_t rpmValue READ rpmValue NOTIFY rpmValueChanged FINAL)
    Q_PROPERTY(uint16_t speedValue READ speedValue NOTIFY speedValueChanged FINAL)


public:
    explicit TelemetryData(QObject *parent = nullptr);

    //Getter functions
    uint16_t rpmValue() const;
    uint16_t speedValue() const;

    //Setter functions
    void updateRpmValue(uint16_t value);
    void updateSpeedValue(uint16_t value);

signals:
    void rpmValueChanged();
    void speedValueChanged();

private:
    uint16_t m_rpmValue = 0;
    uint16_t m_speedValue = 225;
};

#endif // TELEMETRYDATA_H
