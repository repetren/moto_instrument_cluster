

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import Moto_HMI_UI
import QtQuick3D 6.8
import Generated.QtQuick3D.Bike_uv_from_substance_v002
import QtQuick.Timeline 1.0

Item {
    id: root
    width: Constants.width
    height: Constants.height

    Item {
        id: __materialLibrary__

        Texture {
            id: basicLights1_4K
            source: "../images/BasicLights1_4K.hdr"
            objectName: "Basic Lights1 4K"
        }
    }

    Rectangle {
        id: dragArea
        visible: false
        anchors.fill: parent
        anchors.bottomMargin: 154
    }

    DragHandler {
        id: drag
        target: dragArea
    }

    Connections {
        target: drag
        onTranslationChanged: {
            var panRotation = pan.eulerRotation.y + -delta.y / 4
            var tiltRotation = tilt.eulerRotation.x + delta.x / 4

            if (panRotation > 360) {
                pan.eulerRotation.y = 0
                pan.eulerRotation.y = panRotation - 360
            } else if (panRotation < -360) {
                pan.eulerRotation.y = 0
                pan.eulerRotation.y = panRotation + 360
            } else {
                pan.eulerRotation.y = panRotation
            }

            if (tiltRotation < -32) {
                tilt.eulerRotation.x = -32
            } else if (tiltRotation > 0) {
                tilt.eulerRotation.x = 0
            } else {
                tilt.eulerRotation.x = tiltRotation
            }
            // tilt.eulerRotation.x = tiltRotation
        }
    }

    Connections {
        target: turnLeft
        onFlagChanged: {
            if (turnLeft.flag) {
                animationTurnLeft.start()
                console.log("Left start")
            } else {
                animationTurnLeft.restart()
                animationTurnLeft.stop()
                console.log("Left end")
            }
        }
    }

    Connections {
        target: turnRight
        onFlagChanged: {
            if (turnRight.flag) {
                animationTurnRight.start()
                console.log("right start")
            } else {
                animationTurnRight.restart()
                animationTurnRight.stop()
                console.log("right end")
            }
        }
    }
    View3D {
        id: view3D
        anchors.fill: parent
        importScene: scene
        environment: sceneEnvironment
        SceneEnvironment {
            id: sceneEnvironment
            lightProbe: basicLights1_4K
            tonemapMode: SceneEnvironment.TonemapModeAces
            probeHorizon: 0
            probeExposure: 10
            antialiasingQuality: SceneEnvironment.High
            antialiasingMode: SceneEnvironment.MSAA
        }

        Node {
            id: scene

            Bike_uv_from_substance_v002 {
                id: bike3Dmodel
                turn_leftVisible: true
                turn_rightVisible: true
                turn_right_onVisible: false
                turn_left_onVisible: false
            }

            Model {
                id: pan
                opacity: 0
                source: "#Rectangle"
                eulerRotation.z: -0.00002
                eulerRotation.y: -90
                eulerRotation.x: -0.00002

                Model {
                    id: tilt
                    y: -51
                    opacity: 0
                    source: "#Rectangle"

                    PerspectiveCamera {
                        id: sceneCamera
                        x: -0
                        y: -0
                        fieldOfView: 20
                        z: 763.26178
                    }
                }
            }

            Model {
                id: plane
                source: "#Rectangle"
            }
        }
    }

    Image {
        id: info_line
        x: 276
        y: 497
        source: "../images/info_line.svg"
        fillMode: Image.PreserveAspectFit
    }

    Timeline {
        id: timelineTurnLeft
        animations: [
            TimelineAnimation {
                id: animationTurnLeft
                running: false
                loops: -1
                duration: 2000
                to: 2000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 2000
        enabled: true

        KeyframeGroup {
            id: turn_leftVisible_animation
            target: bike3Dmodel
            property: "turn_leftVisible"
            Keyframe {
                value: true
                frame: 0
            }

            Keyframe {
                value: false
                frame: 46
            }

            Keyframe {
                value: true
                frame: 1000
            }

            Keyframe {
                value: true
                frame: 2000
            }
        }

        KeyframeGroup {
            id: turn_left_onVisible_animation
            target: bike3Dmodel
            property: "turn_left_onVisible"
            Keyframe {
                value: false
                frame: 0
            }

            Keyframe {
                value: true
                frame: 46
            }

            Keyframe {
                value: false
                frame: 1000
            }

            Keyframe {
                value: false
                frame: 2000
            }
        }
    }

    Timeline {
        id: timelineTurnRight
        animations: [
            TimelineAnimation {
                id: animationTurnRight
                running: false
                loops: -1
                duration: 2000
                to: 2000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 2000
        enabled: true

        KeyframeGroup {
            id: turn_rightVisible_animation
            target: bike3Dmodel
            property: "turn_rightVisible"
            Keyframe {
                value: true
                frame: 0
            }

            Keyframe {
                value: false
                frame: 46
            }

            Keyframe {
                value: true
                frame: 1000
            }

            Keyframe {
                value: true
                frame: 2000
            }
        }

        KeyframeGroup {
            id: turn_right_onVisible_animation
            target: bike3Dmodel
            property: "turn_right_onVisible"
            Keyframe {
                value: false
                frame: 0
            }

            Keyframe {
                value: true
                frame: 46
            }

            Keyframe {
                value: false
                frame: 1000
            }

            Keyframe {
                value: false
                frame: 2000
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;matPrevEnvDoc:"SkyBox";matPrevEnvValueDoc:"preview_studio";matPrevModelDoc:"#Sphere"}
D{i:10;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}D{i:11}
}
##^##*/

