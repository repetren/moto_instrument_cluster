#include "bridgetoqml.h"

BridgeToQML::BridgeToQML(QObject *parent)

    : QObject(parent)

{}

uint16_t BridgeToQML::value() const {
    return m_value;
}

bool BridgeToQML::flag() const {
    return m_flag;
}

void BridgeToQML::setValue(uint16_t newValue) {
    m_value = newValue;
    emit valueChanged();
}

void BridgeToQML::setFlag(bool newFlag) {
    m_flag = newFlag;
    emit flagChanged();
}
