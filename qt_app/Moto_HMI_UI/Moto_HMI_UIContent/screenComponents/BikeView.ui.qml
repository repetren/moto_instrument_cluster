

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

Item {
    id: root
    width: Constants.width
    height: Constants.height

    Item {
        id: __materialLibrary__

        PrincipledMaterial {
            id: principledMaterial
            objectName: "New Material"
        }
    }

    Rectangle {
        id: dragArea
        visible: false
        anchors.fill: parent
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

    View3D {
        id: view3D
        anchors.fill: parent
        environment: sceneEnvironment
        SceneEnvironment {
            id: sceneEnvironment
            antialiasingQuality: SceneEnvironment.High
            antialiasingMode: SceneEnvironment.MSAA
        }

        Node {
            id: scene
            DirectionalLight {
                id: directionalLight
            }

            Model {
                id: pan
                source: "#Rectangle"
                materials: principledMaterial

                Model {
                    id: tilt
                    source: "#Rectangle"
                    materials: principledMaterial

                    PerspectiveCamera {
                        id: sceneCamera
                        z: 350
                    }
                }
            }

            Model {
                id: cubeModel
                source: "#Cube"
                materials: principledMaterial
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;matPrevEnvDoc:"SkyBox";matPrevEnvValueDoc:"preview_studio";matPrevModelDoc:"#Sphere"}
D{i:8;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
}
##^##*/

