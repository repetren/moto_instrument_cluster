

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import Moto_HMI_UI
import "screenComponents"
import Qt.labs.lottieqt 1.0

Rectangle {
    id: rootRectangle
    width: Constants.width
    height: Constants.height
    color: "#000000"

    RpmScale {
        id: backRPM_v001
        anchors.fill: parent
    }

    GearShifter {
        id: gearShifter
        x: 1304
        y: 0
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 0
    }

    Fuel {
        id: fuel
    }

    Loader {
        id: turnLeftLoader
        visible: lightsBackend.turnLeft
        anchors.fill: parent

        Turn {
            id: turnLeft
        }
    }

    Loader {
        id: turnRightLoader
        x: 1560
        y: 0
        width: 200
        height: 200
        visible: lightsBackend.turnRight

        transform: Scale {
            xScale: -1
            yScale: 1
        }

        Turn {
            id: turnRignt
        }
    }

    LightsIcons {
        id: lightsIcons
    }

    SpeedValue {
        id: speedValue
        anchors.fill: parent
    }

    Text {
        id: kmTitle
        x: 1224
        y: 130
        color: "#4d4d4d"
        text: qsTr("km/h")
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Light"
        font.family: "SF Pro"
    }

    NotificationCenter {
        id: notificationCenter
    }
}
