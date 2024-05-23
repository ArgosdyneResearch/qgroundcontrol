﻿import QtQuick          2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts  1.11
import QtQuick.Dialogs  1.3

import QGroundControl                       1.0
import QGroundControl.Controls              1.0
import QGroundControl.Palette               1.0
import QGroundControl.MultiVehicleManager   1.0
import QGroundControl.ScreenTools           1.0
import QGroundControl.Controllers           1.0
import QtGraphicalEffects                   1.12

Rectangle {
    id: _root
    color: "#3c3434"
    z: 3

    property var rootWidth: null;
    property var rootHeight: null;

    width: rootWidth / 2.2
    height: rootHeight / 1.9

    Rectangle {
        width: parent.width
        height: 2 // 분리선의 두께
        color: "#848282"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height / 7.2 // 분리선의 위치
    }

    Rectangle {
        width: parent.width
        height: 2 // 분리선의 두께
        color: "#848282"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height / 6.4 // 분리선의 위치
    }
    Button {
        width: parent.width
        height: parent.height / 6.4
        anchors.bottom: parent.bottom
        background: Rectangle{
            color: "transparent"
            anchors.fill: parent
        }
        onClicked: {
            console.log("btn Clickeddd");
            _root.visible = false //테스트용
        }
    }
}
