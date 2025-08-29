

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    width: 822
    height: 113

    property alias notificationText: tripA.text
    property int notificationCode: 0

    RowLayout {
        id: rowLayout2
        y: 39
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 50
        RowLayout {
            id: rowLayout
            Text {
                id: tripA
                color: "#ffffff"
                text: qsTr("Trip A")
                font.pixelSize: 30
                font.styleName: "Bold"
                font.family: "SF Pro"
            }

            Text {
                id: tripAKm
                color: "#ffffff"
                text: tripAValue.value
                font.pixelSize: 30
                font.family: "SF Pro"
            }
        }

        RowLayout {
            id: rowLayout1
            Text {
                id: tripA1
                color: "#ffffff"
                text: qsTr("ODO")
                font.pixelSize: 30
                font.styleName: "Bold"
                font.family: "SF Pro"
            }

            Text {
                id: tripAKm1
                color: "#ffffff"
                text: odoValue.value
                font.pixelSize: 30
                font.family: "SF Pro"
            }
        }
    }
}
