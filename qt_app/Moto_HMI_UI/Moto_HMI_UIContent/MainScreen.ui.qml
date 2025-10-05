

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
    state: "drive"

    Loader {
        id: drive_loader
        anchors.fill: parent

        RpmScale {
            id: backRPM_v001
            anchors.fill: parent
        }

        SpeedValue {
            id: speedValue
            anchors.fill: parent
        }

        Text {
            id: kmTitle
            x: 748
            y: 120
            color: "#4d4d4d"
            text: qsTr("km/h")
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.styleName: "Light"
            font.family: "SF Pro"
        }
    }

    Loader {
        id: bike_loader
        visible: false
        anchors.fill: parent
        active: false

        BikeView {
            id: bikeView
        }
    }

    Tray {
        id: tray
        x: 0
        y: 0
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
        visible: turnLeft.flag
        anchors.fill: parent

        Turn {
            id: turnLeftComponent
        }
    }

    Loader {
        id: turnRightLoader
        x: 1560
        y: 0
        width: 200
        height: 200
        visible: turnRight.flag

        transform: Scale {
            xScale: -1
            yScale: 1
        }

        Turn {
            id: turnRigntComponent
        }
    }

    LightsIcons {
        id: lightsIcons
    }

    NotificationCenter {
        id: notificationCenter

        Button {
            id: button
            x: 1308
            y: 373
            width: 167
            height: 166
            text: qsTr("Change state")
            wheelEnabled: false
            flat: false
            checkable: true

            Connections {
                target: button
                function onCheckedChanged() {
                    if (button.checked) {
                        rootRectangle.state = "bike"
                    } else {
                        rootRectangle.state = "drive"
                    }
                }
            }
        }
    }

    states: [
        State {
            name: "drive"

            PropertyChanges {
                target: drive_loader
                active: true
            }

            PropertyChanges {
                target: bike_loader
                visible: false
                active: false
            }
        },
        State {
            name: "bike"

            PropertyChanges {
                target: drive_loader
                visible: false
                active: false
            }

            PropertyChanges {
                target: bike_loader
                visible: true
                active: true
            }
        }
    ]
}
