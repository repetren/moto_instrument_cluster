

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls

Item {
    id: root
    width: 822
    height: 113

    property alias error: errorText.text

    Text {
        id: errorText
        color: "#ffffff"
        text: qsTr("Error")
        font.pixelSize: 40
        anchors.verticalCenterOffset: -1
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent
    }
}
