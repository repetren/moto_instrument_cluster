#include "telemetrydata.h"

TelemetryData::TelemetryData(QObject *parent)

    : QObject(parent)

{}

// Getter declaration

uint16_t TelemetryData::rpmValue() const {
    return m_rpmValue;
}

uint16_t TelemetryData::speedValue() const {
    return m_speedValue;
}

// Setter declatation
void TelemetryData::updateRpmValue(uint16_t value) {
    m_rpmValue = value;
    emit rpmValueChanged();
}

void TelemetryData::updateSpeedValue(uint16_t value) {
    m_speedValue = value;
    emit speedValueChanged();
}
