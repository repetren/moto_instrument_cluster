#include "lightsicons.h"

LightsIcons::LightsIcons(QObject *parent)

    : QObject(parent)

{}

bool LightsIcons::turnLeft() const {
    return m_turnLeft;
}

bool LightsIcons::turnRight() const {
    return m_turnRight;
}

bool LightsIcons::drlState() const {
    return m_drlState;
}

int LightsIcons::beamMode() const {
    return m_beamMode;
}

void LightsIcons::updateTurnLeft(bool flag) {
    m_turnLeft = flag;
    emit turnLeftChanged();
}

void LightsIcons::updateTurnRight(bool flag) {
    m_turnRight = flag;
    emit turnRightChanged();
}

void LightsIcons::updateDrlState(bool flag) {
    m_drlState = flag;
    emit drlStateChanged();
}

void LightsIcons::updateBeamMode(int mode) {
    m_beamMode = mode;
    emit beamModeChanged();
}

