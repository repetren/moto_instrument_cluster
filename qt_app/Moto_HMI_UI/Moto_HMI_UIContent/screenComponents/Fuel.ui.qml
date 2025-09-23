import QtQuick
import Moto_HMI_UI
import Qt.labs.lottieqt 1.0
import QtQuick.Controls 6.8
import QtQuick.Studio.Components
import QtQuick.Timeline 1.0

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: "#00000000"
    state: "normalLevel"

    Image {
        id: fuelBG_v001
        anchors.fill: parent
        source: "../images/fuelBG_v001.svg"
        fillMode: Image.PreserveAspectFit
    }
    LottieAnimation {
        id: fuelLevelAnimation
        autoPlay: false
        x: 59
        y: 133
        width: 187
        height: 428
        source: "../lottie/fuelLineAnim_v001.json"
        loops: -1

        //Lottie animation conversion from value from backend to lottie frame
        Connections {
            target: fuelLevel
            onValueChanged: {
                fuelLevelAnimation.gotoAndStop(fuelLevel.value)
            }
        }

        Text {
            id: literPerKm
            x: -35
            y: -33
            color: "#ffffff"
            text: litersPerKm.value + " l"
            font.pixelSize: 30
            font.styleName: "Bold"
            font.family: "SF Pro"
        }

        Text {
            id: kmTitle
            x: -35
            y: 0
            color: "#4d4d4d"
            text: qsTr("/100km")
            font.pixelSize: 30
            font.styleName: "Light"
            font.family: "SF Pro"
        }

        Text {
            id: literPerKm1
            x: -35
            y: 58
            color: "#ffffff"
            text: fuelRange.value + " km"
            font.pixelSize: 30
            font.styleName: "Bold"
            font.family: "SF Pro"
        }

        Text {
            id: kmTitle1
            x: -35
            y: 91
            color: "#4d4d4d"
            text: qsTr("Range")
            font.pixelSize: 30
            font.styleName: "Light"
            font.family: "SF Pro"
        }
    }

    Image {
        id: fuelIcon_v001
        x: 24
        y: 301
        source: "../images/fuelIcon_v001.svg"
        fillMode: Image.PreserveAspectFit
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: lowLevelAnim
                running: true
                loops: -1
                duration: 1000
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 1000
        enabled: false

        KeyframeGroup {
            target: fuelIcon_v001
            property: "opacity"
            Keyframe {
                value: 1
                frame: 0
            }

            Keyframe {
                value: 0.20297
                frame: 500
            }

            Keyframe {
                value: 1
                frame: 1000
            }
        }
    }

    states: [
        State {
            name: "normalLevel"
            when: !lowFuelLevel.flag

            PropertyChanges {
                target: timeline
                enabled: false
            }

            PropertyChanges {
                target: lowLevelAnim
                running: false
            }
        },
        State {
            name: "lowLevel"
            when: lowFuelLevel.flag

            PropertyChanges {
                target: fuelIcon_v001
                opacity: 1
                source: "../images/fuelIcon_allert_v001.svg"
            }

            PropertyChanges {
                target: timeline
                enabled: true
            }

            PropertyChanges {
                target: lowLevelAnim
                running: true
            }
        }
    ]
}
