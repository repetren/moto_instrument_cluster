

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import Moto_HMI_UI
import QtQuick.Timeline 1.0
import Qt5Compat.GraphicalEffects

Rectangle {
    id: root
    width: Constants.width
    height: Constants.height
    visible: true
    color: "#00ffffff"
    state: "clear"

    NotificationCode {
        id: testcode
    }

    Component {
        id: notification
        Notification {}
    }

    Image {
        id: notification_bg
        source: "../images/notification_bg.svg"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: notification_highlight
        source: "../images/notification_highlight.svg"
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
    }

    // declarig global variables for notification handling
    property var instance: null
    property int code: 0

    SwipeView {
        id: swipeView
        x: 403
        y: 607
        width: 755
        height: 113
        visible: true

        transformOrigin: Item.Center
        clip: true
        orientation: Qt.Vertical

        TripInfo {
            id: tripInfo
        }

        Notification {
            id: trip
        }

        Connections {
            // Removing highlight state on scroll
            target: swipeView
            onCurrentIndexChanged: {
                highlightAnimation.stop()
                root.state = "clear"
            }
        }

        Connections {
            target: notificationHandler
            onNewNotificationSignal: {

                code = notificationHandler.notificationCode

                // Notification update or second throw
                for (var i = 0; i < swipeView.count; i++) {
                    // Checking for existed same error in list
                    if (swipeView.itemAt(i).notificationCode === code) {

                        // Moving notification component to list top and highligting
                        swipeView.currentIndex = i
                        swipeView.moveItem(i, 2)
                        root.state = "highlight"
                        highlightAnimation.start()
                        return
                    }
                }

                // notification initialisation
                instance = notification.createObject(swipeView, {
                                                         "notificationCode": code,
                                                         "notificationText": testcode.errorToText(
                                                                                 code)
                                                     })
                swipeView.insertItem(2, instance)
                swipeView.currentIndex = 2
                root.state = "highlight"
                highlightAnimation.start()
            }

            onRemoveNotificationSignal: {

                code = notificationHandler.notificationCode

                for (var i = 0; i < swipeView.count; i++) {
                    if (swipeView.itemAt(i).notificationCode === code) {
                        if (i === swipeView.currentIndex) {
                            swipeView.currentIndex++
                        }
                        swipeView.itemAt(i).destroy()
                        return
                    }
                }
            }
        }
    }

    Image {
        id: notification_line
        source: "../images/notification_line.svg"
        fillMode: Image.PreserveAspectFit
    }

    Timeline {
        id: highlightTimeline
        animations: [
            TimelineAnimation {
                id: highlightAnimation
                onFinished: {
                    root.state = "highlight"
                }
                running: false
                loops: 1
                duration: 1000
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 1000
        enabled: false

        KeyframeGroup {
            target: notification_highlight
            property: "opacity"
            Keyframe {
                value: 1
                easing.bezierCurve: [0.895, 0.03, 0.685, 0.22, 1, 1]
                frame: 0
            }

            Keyframe {
                value: 0.49853
                easing.bezierCurve: [0.895, 0.03, 0.685, 0.22, 1, 1]
                frame: 629
            }
        }
    }

    Item {
        id: clipingMask
        width: 1560
        height: 720
        visible: false

        Image {
            id: bug
            x: 508
            y: 234
            width: 545
            height: 251
            visible: false
            source: "../images/bug_for_tests.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: mask
            visible: false
            source: "../images/notification_mask.svg"
            fillMode: Image.PreserveAspectFit
        }

        OpacityMask {
            anchors.fill: clipingMask
            source: bug
            maskSource: mask
        }
    }

    states: [
        State {
            name: "clear"

            PropertyChanges {
                target: notification_highlight
                visible: false
            }

            PropertyChanges {
                target: highlightTimeline
                enabled: false
            }

            PropertyChanges {
                target: highlightAnimation
                running: false
            }
        },
        State {
            name: "highlight"

            PropertyChanges {
                target: highlightTimeline
                enabled: true
            }

            PropertyChanges {
                target: highlightAnimation
                running: true
            }

            PropertyChanges {
                target: notification_highlight
                opacity: 0.499
            }
        }
    ]
    transitions: [
        Transition {
            id: transition
            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 0
                    }

                    PropertyAnimation {
                        target: notification_highlight
                        property: "opacity"
                        easing.bezierCurve: [0.895, 0.03, 0.685, 0.22, 1, 1]
                        duration: 596
                    }
                }
            }
            to: "*"
            from: "*"
        }
    ]
}

/*##^##
Designer {
    D{i:0}D{i:29;transitionDuration:2000}
}
##^##*/

