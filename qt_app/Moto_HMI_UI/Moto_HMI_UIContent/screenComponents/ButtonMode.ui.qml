

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
    width: 200
    height: 100
    state: "unchecked"

    Rectangle {
        id: rectangle
        color: "#00ffffff"
        radius: 40
        border.color: "#ffffff"
        border.width: 5
        anchors.fill: parent

        Text {
            id: text1
            color: "#ffffff"
            text: qsTr("Info")
            anchors.fill: parent
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Button {
        id: button
        opacity: 0
        text: qsTr("")
        anchors.fill: parent
        checkable: true

        Connections {
            id: pressedCondition
            target: button
            function onPressed() {
                root.state = "pressed"
            }
        }

        Connections {
            id: checkedCondition
            target: button
            function onCheckedChanged() {
                if (button.checked) {
                    root.state = "checked"
                    parent.state = "bike"
                } else {
                    root.state = "unchecked"
                    parent.state = "drive"
                }
            }
        }

        Connections {
            target: speedBackend
            function onValueChanged() {
                if (speedBackend.value >= 10) {
                    parent.state = "drive"
                    button.checked = false
                    root.state = "unchecked"
                }
            }
        }
    }
    states: [
        State {
            name: "unchecked"

            PropertyChanges {
                target: rectangle
                border.width: 2
            }
        },
        State {
            name: "pressed"

            PropertyChanges {
                target: rectangle
                color: "#ffffff"
                border.color: "#00ffffff"
            }

            PropertyChanges {
                target: text1
                visible: false
                color: "#646464"
            }
        },
        State {
            name: "checked"

            PropertyChanges {
                target: button
                opacity: 0
            }

            PropertyChanges {
                target: rectangle
                color: "#ffffff"
                border.color: "#00ffffff"
            }

            PropertyChanges {
                target: text1
                color: "#000000"
                text: qsTr("Back")
            }
        }
    ]
}
