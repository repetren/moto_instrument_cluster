

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtQuick.Timeline 1.0

Item {
    id: root
    width: 256
    height: 720

    Text {
        id: text1
        x: 0
        y: 151
        width: 256
        height: 186
        color: "#ffffff"
        text: gearBox.value === 0 ? "N" : gearBox.value
        // text: "N"
        font.pixelSize: 200
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        scale: 1
        renderTypeQuality: Text.HighRenderTypeQuality
        font.styleName: "Bold"
        font.family: "SF Pro"

        Connections {
            target: gearBox
            function onValueChanged() {
                timelineAnimation.stop()
                timelineAnimation.start()
            }
        }
    }

    Text {
        id: kmTitle
        x: 96
        y: 120
        color: "#4d4d4d"
        text: qsTr("Gear")
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Light"
        font.family: "SF Pro"
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                running: true
                loops: 1
                duration: 1000
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 1000
        enabled: true

        KeyframeGroup {
            target: text1
            property: "scale"
            Keyframe {
                value: 1
                easing.bezierCurve: [0.55, 0.055, 0.675, 0.19, 1, 1]
                frame: 0
            }

            Keyframe {
                value: 0.8
                easing.bezierCurve: [0.55, 0.055, 0.675, 0.19, 1, 1]
                frame: 51
            }

            Keyframe {
                value: 1
                easing.bezierCurve: [0.55, 0.055, 0.675, 0.19, 1, 1]
                frame: 105
            }
        }
    }
}
