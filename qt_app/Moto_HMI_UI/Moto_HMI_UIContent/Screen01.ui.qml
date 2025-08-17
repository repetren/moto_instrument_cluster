

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import Moto_HMI_UI
import "screenComponents"

Rectangle {
    id: rootRectangle
    width: Constants.width
    height: Constants.height
    color: "#000000"

    Image {
        id: backRPM_v001
        visible: true
        anchors.fill: parent
        source: "images/backRPM_v001.svg"
    }

    FuelLevel {
        id: fuelLevel
    }

    states: [
        State {
            name: "clicked"
        }
    ]
}
