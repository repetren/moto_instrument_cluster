

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import Moto_HMI_UI

Item {
    id: rootRectangle
    width: Constants.width
    height: Constants.height

    Item {
        id: item1
        x: -250
        y: 0
        width: parent.width
        height: parent.height

        Text {
            id: speedText
            y: 121

            color: "#ffffff"
            text: speedBackend.value
            anchors.left: parent.left
            // text: "100"
            anchors.right: parent.right
            anchors.leftMargin: 737
            anchors.rightMargin: 585
            font.pixelSize: 400
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            renderTypeQuality: Text.VeryHighRenderTypeQuality
            scale: 1.2
            font.styleName: "Bold"
            font.family: "SF Pro"

            // Adjusting 'x' margin for non-monospace fontSizeMode
            // Helps to achieve equal tabular look
            Connections {
                target: speedBackend
                function onValueChanged() {
                    let speed = speedBackend.value

                    if (speed >= 0 && speed < 10) {
                        speedText.anchors.leftMargin = 1236
                    } else if (speed >= 10 && speed < 100) {
                        speedText.anchors.leftMargin = 1000
                    } else if (speed >= 100 && speed < 200) {
                        speedText.anchors.leftMargin = 780
                    } else {
                        speedText.anchors.leftMargin = 730
                    }
                }
            }
        }
    }
}
