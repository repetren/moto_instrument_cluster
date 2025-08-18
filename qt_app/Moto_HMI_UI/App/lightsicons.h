#ifndef LIGHTSICONS_H
#define LIGHTSICONS_H

#include <QObject>

class LightsIcons : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool turnLeft READ turnLeft NOTIFY turnLeftChanged FINAL)
    Q_PROPERTY(bool turnRight READ turnRight NOTIFY turnRightChanged FINAL)
    Q_PROPERTY(bool drlState READ drlState NOTIFY drlStateChanged FINAL)
    Q_PROPERTY(int beamMode READ beamMode NOTIFY beamModeChanged FINAL)

public:
    explicit LightsIcons (QObject *parent = nullptr);

    bool turnLeft() const;
    bool turnRight() const;
    bool drlState() const;
    int beamMode() const;

    void updateTurnLeft(bool flag);
    void updateTurnRight(bool flag);
    void updateDrlState(bool flag);
    void updateBeamMode(int mode);

signals:
    void turnLeftChanged();
    void turnRightChanged();
    void drlStateChanged();
    void beamModeChanged();

private:
    bool m_turnLeft = false;
    bool m_turnRight = false;
    bool m_drlState = false;
    int m_beamMode = 0;
};

#endif // LIGHTSICONS_H
