import QtQuick
import Moto_HMI_UI

// Window {
//     width: mainScreen.width
//     height: mainScreen.height

//     visible: true
//     title: "Moto_HMI_UI"

//     Screen01 {
//         id: mainScreen
//     }

// }

Window {

    property int piWidth: 1560;
    property int piHeight: 720

    property bool isPi: true

    //adjusting resolution for preview on Mac and Pi
    width: isPi ? piHeight : piWidth/2;
    height: isPi ? piWidth : piHeight/2;

    visible: true
    title: "Raspberry_v006"

    Screen01 {
        id: mainScreen
        x: isPi ? -420 : -(piWidth/4);
        y: isPi ? 420 : -(piHeight/4);
        // scaling for convinient view on mac
        scale: isPi ? 1 : 0.5;
        rotation: isPi ? 90 : 0;
    }

}

