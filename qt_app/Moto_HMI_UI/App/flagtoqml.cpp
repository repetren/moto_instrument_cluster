#include "flagtoqml.h"

FlagToQML::FlagToQML(QObject *parent)

    : QObject(parent)

{}

bool FlagToQML::flag() const {
    return m_flag;
}

void FlagToQML::setFlag(bool newFlag) {
    if (newFlag != m_flag) {
        m_flag = newFlag;
        emit flagChanged();
    }
}
