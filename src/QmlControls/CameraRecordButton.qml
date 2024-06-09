import QtQuick          2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts  1.11
import QtQuick.Dialogs  1.3
import QtQuick.Window 2.0

import QGroundControl                       1.0
import QGroundControl.Controls              1.0
import QGroundControl.Palette               1.0
import QGroundControl.MultiVehicleManager   1.0
import QGroundControl.ScreenTools           1.0
import QGroundControl.Controllers           1.0
import QtGraphicalEffects                   1.12

Button {
    id:     root
    z : 3

    //Color Property
    property color transparent: "transparent"
    
    property bool isRecording: false;

    background: Rectangle {
        color: "transparent"
    }
    
    implicitWidth: Screen.width / 15.5
    implicitHeight: implicitWidth

    Image {
        anchors.fill: parent
        source: isRecording ? "/res/Record.svg" : "/res/NoSdCardRed.svg"
    }

    onClicked: {

        if(isRecording == false) {
            isRecording = true
        }else {
            isRecording = false
            _root.visible = false
        }
    }
}

