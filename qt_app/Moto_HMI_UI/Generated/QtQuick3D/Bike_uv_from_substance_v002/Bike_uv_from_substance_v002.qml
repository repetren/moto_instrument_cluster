import QtQuick
import QtQuick3D

Node {
    id: node
    property alias turn_left_onVisible: turn_left_on.visible
    property alias turn_right_onVisible: turn_right_on.visible
    property alias turn_rightVisible: turn_right.visible
    property alias turn_leftVisible: turn_left.visible

    // Resources

    // Nodes:
    Node {
        id: rootNode
        objectName: "RootNode"
        Model {
            id: chain_low
            objectName: "chain_low"
            x: 10.121294021606445
            y: -28.560792922973633
            z: -42.692073822021484
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/chain_low_mesh.mesh"
            materials: [
                main
            ]
        }
        Model {
            id: drl_low
            objectName: "drl_low"
            x: -7.629395440744702e-06
            y: 28.871065139770508
            z: 60.63840866088867
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/drl_low_mesh.mesh"
            materials: [ main ]
        }
        Model {
            id: engine_low
            objectName: "engine_low"
            x: -0.3779159486293793
            y: -16.16959571838379
            z: 9.920129776000977
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/engine_low_mesh.mesh"
            materials: [
                main
            ]
        }
        Model {
            id: exhaust_pipes_low
            objectName: "exhaust pipes_low"
            x: -9.472259521484375
            y: -24.82756233215332
            z: -19.83832359313965
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/exhaust_pipes_low_mesh.mesh"
            materials: [
                main
            ]
        }
        Model {
            id: frame_low
            objectName: "frame_low"
            x: -9.155272891803179e-06
            y: 1.5438659191131592
            z: -28.24544334411621
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/frame_low_mesh.mesh"
            materials: [
                main
            ]
        }
        Model {
            id: front_brakes_low
            objectName: "front brakes_low"
            x: -0.6617569327354431
            y: -31.737876892089844
            z: 72.97921752929688
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/front_brakes_low_mesh.mesh"
            materials: [
                main
            ]
        }
        Model {
            id: front_mask_low
            objectName: "front mask_low"
            x: -7.629395440744702e-06
            y: 28.871065139770508
            z: 60.63840866088867
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/front_mask_low_mesh.mesh"
            materials: [
                main
            ]
        }
        Model {
            id: front_wheel_low
            objectName: "front wheel_low"
            x: 0.09438324719667435
            y: -31.705799102783203
            z: 75.22423553466797
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/front_wheel_low_mesh.mesh"
            materials: [
                main
            ]
        }
        Model {
            id: fuel_tank_hatch_low
            objectName: "fuel tank hatch_low"
            x: 0.06980285048484802
            y: 37.50546646118164
            z: 12.31155776977539
            rotation: Qt.quaternion(0.707107, -0.707107, 6.18172e-08, 6.18172e-08)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/fuel_tank_hatch_low_mesh.mesh"
            materials: [
                main
            ]
        }
        Model {
            id: gas_tank_low
            objectName: "gas tank_low"
            x: -4.5776364459015895e-06
            y: 21.56201934814453
            z: 13.22372817993164
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/gas_tank_low_mesh.mesh"
            materials: [
                main
            ]
        }
        Model {
            id: glass
            objectName: "glass"
            x: -7.629395440744702e-06
            y: 28.871065139770508
            z: 60.63840866088867
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/glass_mesh.mesh"
            materials: glass1
        }
        Model {
            id: lights
            objectName: "lights"
            x: -7.629395440744702e-06
            y: 28.871065139770508
            z: 60.63840866088867
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/lights_mesh.mesh"
            materials: [
                main
            ]
        }
        Model {
            id: protective_pads_low
            objectName: "protective pads_low"
            x: 1.0245193243026733
            y: -25.246980667114258
            z: -47.59614562988281
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/protective_pads_low_mesh.mesh"
            materials: [
                main
            ]
        }
        Model {
            id: rear_brakes_low
            objectName: "rear brakes_low"
            x: -11.816204071044922
            y: -22.732547760009766
            z: -47.190650939941406
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/rear_brakes_low_mesh.mesh"
            materials: [
                main
            ]
        }
        Model {
            id: rear_wheel_low
            objectName: "rear wheel_low"
            x: -0.2368103265762329
            y: -31.705799102783203
            z: -69.70082092285156
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/rear_wheel_low_mesh.mesh"
            materials: [
                main
            ]
        }
        Model {
            id: screen_low
            objectName: "screen_low"
            x: 1.4545996189117432
            y: -2.508133888244629
            z: 0.5432894229888916
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 100
            scale.y: 100
            scale.z: 100
            source: "meshes/screen_low_mesh.mesh"
            materials: [
                main
            ]
        }
        Model {
            id: seats_low
            objectName: "seats_low"
            x: -1.5258789289873675e-06
            y: 20.733325958251953
            z: -45.07609558105469
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/seats_low_mesh.mesh"
            materials: [
                main
            ]
        }
        Model {
            id: spring_low
            objectName: "spring_low"
            x: 2.637747287750244
            y: -8.353974342346191
            z: -16.21681022644043
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/spring_low_mesh.mesh"
            materials: [
                main
            ]
        }
        Model {
            id: steering_rack_low
            objectName: "steering rack_low"
            y: 13.072587966918945
            z: 58.96400833129883
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/steering_rack_low_mesh.mesh"
            materials: [
                main
            ]
        }
        Model {
            id: turn_left
            objectName: "turn_left"
            x: -7.629395440744702e-06
            y: 28.871065139770508
            opacity: 1
            visible: true
            z: 60.63840866088867
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/turn_left_mesh.mesh"
            receivesShadows: true
            castsShadows: true
            materials: [
                main
            ]
        }
        Model {
            id: turn_right
            objectName: "turn_right"
            x: -9.155272891803179e-06
            y: 1.5438659191131592
            z: -28.24544334411621
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            scale.x: 0.1
            scale.y: 0.1
            scale.z: 0.1
            source: "meshes/turn_right_mesh.mesh"
            receivesShadows: true
            castsShadows: true
            materials: [
                main
            ]
        }

        Model {
            id: turn_left_on
            x: -0
            y: 28.871
            visible: true
            source: "meshes/turn_left_mesh.mesh"
            castsShadows: false
            castsReflections: false
            receivesShadows: false
            z: 60.63841
            scale.z: 0.1
            scale.y: 0.1
            scale.x: 0.1
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            objectName: "turn_left"
            materials: emssion_material
        }

        Model {
            id: turn_right_on
            x: -0
            y: 1.544
            source: "meshes/turn_right_mesh.mesh"
            castsReflections: false
            receivesShadows: false
            castsShadows: false
            z: -28.24544
            scale.z: 0.1
            scale.y: 0.1
            scale.x: 0.1
            rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
            objectName: "turn_right"
            materials: emssion_material
        }
    }

    Connections {
        target: beamMode
        onValueChanged: {
            switch(beamMode.value) {
            case 0:
                drl_low.materials = [ main ]
                lights.materials = [ main ]
                break
            case 1:
                drl_low.materials = [ emssion_material ]
                lights.materials = [ main ]
                break
            case 2:
                drl_low.materials = [ emssion_material ]
                lights.materials = [ emssion_material ]
                break
            case 3:
                drl_low.materials = [ emssion_material ]
                lights.materials = [ emssion_material ]
                break
            }

        }
    }

    // Connections {
    //     target: turnLeft
    //     onFlagChanged: {
    //         if (turnLeft.flag) {
    //             if (turnBlink.flag === true) {
    //                 turn_left.materials = [ emssion_material ]
    //             } else {
    //                 turn_left.materials = [ main ]
    //             }
    //         } else {
    //             turn_left.materials = [ main ]
    //         }
    //     }
    // }

    // Connections {
    //     target: turnRight
    //     onFlagChanged: {
    //         if (turnRight.flag) {
    //             if (turnBlink.flag === true) {
    //                 turn_right.materials = [ emssion_material ]
    //             } else {
    //                 turn_right.materials = [ main ]
    //             }
    //         } else {
    //             turn_right.materials = [ main ]
    //         }
    //     }
    // }

    Node {
        id: __materialLibrary__

        PrincipledMaterial {
            id: main
            emissiveMap: emission
            metalness: 1
            roughnessMap: roughness
            normalMap: normal
            metalnessMap: metalic
            emissiveFactor.z: 1
            emissiveFactor.y: 1
            emissiveFactor.x: 1
            baseColorMap: base
            objectName: "main"
            baseColor: "#ffffff"
            roughness: 1
        }

        Texture {
            id: base
            source: "../../../Moto_HMI_UIContent/images/DefaultMaterial_BaseColor.png"
            objectName: "base"
        }

        PrincipledMaterial {
            id: glass1
            transmissionFactor: 1
            objectName: "glass"
        }

        Texture {
            id: emission
            source: "../../../Moto_HMI_UIContent/images/DefaultMaterial_Emission.png"
            objectName: "emission"
        }

        Texture {
            id: metalic
            source: "../../../Moto_HMI_UIContent/images/DefaultMaterial_Metallic.png"
            objectName: "metalic"
        }

        Texture {
            id: normal
            source: "../../../Moto_HMI_UIContent/images/DefaultMaterial_Normal.png"
            objectName: "normal"
        }

        Texture {
            id: roughness
            source: "../../../Moto_HMI_UIContent/images/DefaultMaterial_Roughness.png"
            objectName: "roughness"
        }

        PrincipledMaterial {
            id: emssion_material
            roughnessMap: roughness
            roughness: 1
            objectName: "emssion_material"
            normalMap: normal
            metalnessMap: metalic
            metalness: 1
            emissiveMap: emission_on
            emissiveFactor.z: 16
            emissiveFactor.y: 16
            emissiveFactor.x: 16
            baseColorMap: base_on
            baseColor: "#ffffff"
        }

        Texture {
            id: base_on
            source: "../../../Moto_HMI_UIContent/images/DefaultMaterial_BaseColor_on.png"
            objectName: "base_on"
        }

        Texture {
            id: emission_on
            source: "../../../Moto_HMI_UIContent/images/DefaultMaterial_Emission_on.png"
            objectName: "emission_on"
        }
    }

    // Animations:
}

/*##^##
Designer {
    D{i:0;cameraSpeed3d:25;cameraSpeed3dMultiplier:1;matPrevEnvDoc:"SkyBox";matPrevEnvValueDoc:"preview_studio";matPrevModelDoc:"#Sphere"}
}
##^##*/
