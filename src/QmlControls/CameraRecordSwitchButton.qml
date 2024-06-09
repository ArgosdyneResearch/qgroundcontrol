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

    implicitWidth: Screen.width / 22.6
    implicitHeight: implicitWidth

    background: Rectangle {
        color: transparent
    }   

    Image {
        anchors.fill: parent
        source: "/res/ShootRecordSwitch.svg"
    }

    onClicked: {
        _root.visible = false
    }
}
