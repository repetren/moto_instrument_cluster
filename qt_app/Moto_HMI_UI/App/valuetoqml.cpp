#include "valuetoqml.h"

ValueToQML::ValueToQML(QObject *parent)

    : QObject(parent)

{}

uint16_t ValueToQML::value() const {
    return m_value;
}

void ValueToQML::setValue(uint16_t newValue) {
    if (newValue != m_value) {
        m_value = newValue;
        emit valueChanged();
    }
}
