

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

    property alias notificationText: notificationText.text
    property int notificationCode: 0

    Text {
        id: notificationText
        color: "#ffffff"
        text: qsTr("Error")
        font.pixelSize: 35
        anchors.centerIn: parent
        font.family: "SF Pro"
    }
}
