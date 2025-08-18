

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import Moto_HMI_UI

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: "#00000000"

    Image {
        id: highBeam
        x: 244
        y: 28
        visible: lightsBackend.beamMode === 2
        source: "../images/highBeam.svg"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: drlIcon
        x: 126
        y: 34
        source: "../images/drlIcon.svg"
        fillMode: Image.PreserveAspectFit
        visible: lightsBackend.drlState
    }

    Image {
        id: lowBeam
        x: 244
        y: 28
        visible: lightsBackend.beamMode === 1
        source: "../images/lowBeam.svg"
        fillMode: Image.PreserveAspectFit
    }
}
