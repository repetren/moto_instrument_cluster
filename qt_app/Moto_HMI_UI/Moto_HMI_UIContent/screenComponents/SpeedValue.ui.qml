

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
        x: 0
        y: 0
        width: parent.width
        height: parent.height

        Text {
            id: speedText
            y: 121

            color: "#ffffff"
            text: speedBackend.value
            // text: "100"
            font.pixelSize: 400
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            renderTypeQuality: Text.VeryHighRenderTypeQuality
            scale: 1
            font.styleName: "Bold"
            font.family: "SF Pro"

            // Adjusting 'x' margin for non-monospace fontSizeMode
            // Helps to achieve equal tabular look
            Connections {
                target: speedBackend
                function onValueChanged() {
                    let speed = speedBackend.value

                    switch (speed % 10) {
                    case 1:
                        speedText.anchors.horizontalCenterOffset = -38.5
                        break
                    case 2:
                        speedText.anchors.horizontalCenterOffset = -11.2
                        break
                    case 3:
                        speedText.anchors.horizontalCenterOffset = -5.4
                        break
                    case 4:
                        speedText.anchors.horizontalCenterOffset = -1.4
                        break
                    case 5:
                        speedText.anchors.horizontalCenterOffset = -6.5
                        break
                    case 6:
                        speedText.anchors.horizontalCenterOffset = -0.4
                        break
                    case 7:
                        speedText.anchors.horizontalCenterOffset = -20.4
                        break
                    case 8:
                        speedText.anchors.horizontalCenterOffset = -1.1
                        break
                    case 9:
                        speedText.anchors.horizontalCenterOffset = -0.4
                        break
                    default:
                        speedText.anchors.horizontalCenterOffset = 0
                    }
                }
            }
        }
    }
}
