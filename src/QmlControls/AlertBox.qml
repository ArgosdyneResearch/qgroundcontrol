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

Rectangle {
    id:    root
    color: isRed ? red : yellow
    z : 3      

    //Color Property
    property bool isRed: false
    property color red: "#DF3712"
    property color yellow: "#FCA600"
    property color transparent: "transparent"

    //Size Property
    property int defaultFontSize: Qt.platform.os === "android" ? ScreenTools.smallFontPointSize : ScreenTools.mediumFontPointSize
    
    implicitWidth: Screen.width / 6.6
    implicitHeight: Screen.height / 14.4    

    Button {
        width: parent.width / 7.4
        height: parent.height / 1.9
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        background: Rectangle {
            color: transparent
            Image {
                source: isRed ? "/res/CloseWhite.svg" : "/res/CloseLightgray.svg"  
                anchors.fill: parent
            }
        }
        onClicked: {
            console.log("btn Clicked")
        }
    }
}


