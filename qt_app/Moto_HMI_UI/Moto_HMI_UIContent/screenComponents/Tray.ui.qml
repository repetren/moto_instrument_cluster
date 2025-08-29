

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
    width: Constants.width
    height: Constants.height
    id: root

    Text {
        id: clock
        y: 633
        width: 117
        height: 36
        color: "#ffffff"
        text: qsTr("18:35")
        anchors.left: parent.left
        anchors.leftMargin: 80
        font.pixelSize: 35
        horizontalAlignment: Text.AlignLeft
        font.family: "SF Pro"
    }

    Text {
        id: outsideTemp
        y: clock.y
        width: 117
        height: 36
        color: "#ffffff"
        text: qsTr("18.5°C")
        anchors.right: parent.right
        anchors.rightMargin: clock.anchors.leftMargin
        font.pixelSize: 35
        horizontalAlignment: Text.AlignRight
        font.family: "SF Pro"
    }
}
