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

    // Passing outside to check loader state
    property bool loaded

    LottieAnimation {
        id: turnFrameLottie
        source: "../lottie/turnAnimFrame.json"
        loops: -1
        autoPlay: true
    }

    LottieAnimation {
        id: turnIconLottie
        x: 0
        y: -16
        source: "../lottie/turnAnimIcon.json"
        loops: -1
        autoPlay: true
    }

    // Restarting animation at the same time with loader
    Connections {
        target: parent
        function onVisibleChanged() {
            turnFrameLottie.start()
            turnIconLottie.start()
        }
    }
}
