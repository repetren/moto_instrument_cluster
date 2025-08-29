

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
    width: 256
    height: 720

    Text {
        id: text1
        x: 0
        y: 151
        width: 256
        height: 186
        color: "#ffffff"
        text: qsTr("N")
        font.pixelSize: 200
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        renderTypeQuality: Text.HighRenderTypeQuality
        font.styleName: "Bold"
        font.family: "SF Pro"
    }

    Text {
        id: kmTitle
        x: 96
        y: 130
        color: "#4d4d4d"
        text: qsTr("Gear")
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Light"
        font.family: "SF Pro"
    }
}
