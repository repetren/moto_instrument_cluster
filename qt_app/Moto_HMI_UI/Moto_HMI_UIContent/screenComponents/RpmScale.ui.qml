import QtQuick
import Moto_HMI_UI
import Qt.labs.lottieqt 1.0

Rectangle {
    id: rootRectangle
    width: Constants.width
    height: Constants.height
    color: "#00000000"

    Image {
        id: backRPM_v001
        x: 0
        y: 0
        visible: false
        source: "../images/backRPM_v001.svg"
    }

    Image {
        id: rpmBg
        x: 0
        y: 0
        source: "../images/rpmBg.svg"
        fillMode: Image.PreserveAspectFit
    }

    LottieAnimation {
        id: rmpLineAnimation
        source: "../lottie/rpmLine.json"

        Connections {
            target: telemetryBackend
            onRpmValueChanged: {
                rmpLineAnimation.gotoAndStop(telemetryBackend.rpmValue)
            }
        }

        // Connections {
        //     target: fuelBackend
        //     onFuelLevelChanged: {
        //         rmpLineAnimation.gotoAndStop(fuelBackend.fuelLevel)
        //     }
        // }
    }
}
