

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

        Image {
            id: bike_bg
            source: "images/bike_bg.png"
            fillMode: Image.PreserveAspectFit
        }

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

    ButtonMode {
        id: buttonMode
        x: 1354
        y: 491
        width: 164
        height: 68
    }

    NotificationCenter {
        id: notificationCenter
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
                opacity: 1
                visible: false
                active: false
            }

            PropertyChanges {
                target: bikeView
                opacity: 0
                scale: 0.8
            }

            PropertyChanges {
                target: bike_bg
                opacity: 0
            }
        },
        State {
            name: "bike"

            PropertyChanges {
                target: drive_loader
                opacity: 0
                visible: false
                scale: 0.8
                active: false
            }

            PropertyChanges {
                target: bike_loader
                visible: true
                active: true
            }
        }
    ]
    transitions: [
        Transition {
            id: transition
            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: bikeView
                        property: "opacity"
                        duration: 540
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: bikeView
                        property: "scale"
                        duration: 125
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: bike_loader
                        property: "opacity"
                        duration: 527
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: drive_loader
                        property: "opacity"
                        duration: 343
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: drive_loader
                        property: "scale"
                        duration: 175
                    }
                }
            }

            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: bike_bg
                        property: "opacity"
                        duration: 334
                    }
                }
            }
            to: "*"
            from: "*"
        }
    ]
}

/*##^##
Designer {
    D{i:0}D{i:1}D{i:5}D{i:6}D{i:7}D{i:27;transitionDuration:2000}
}
##^##*/

