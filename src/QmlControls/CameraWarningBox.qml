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
    id: root
    color: black
    z: 3

    //Color Picker
    property color black: "#222020"
    property color gray: "#848282"
    property color blue: "#276BF0"
    property color white: "white"
    property color transparent: "transparent"

    //Size Property
    property int defaultFontSize: Qt.platform.os === "android" ? ScreenTools.smallFontPointSize : ScreenTools.mediumFontPointSize

    radius: defaultFontSize * 1.2     
    implicitWidth: Screen.width / 4.1
    implicitHeight: Screen.height / 3.4

    Rectangle {
        width: parent.width
        height: 2 
        color: gray
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height / 4.7
    }

    Rectangle {
        width: parent.width
        height: 2 
        color: gray
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height / 5.3 
    }

    //Left button
    Button {
        width: parent.width / 2
        height: parent.height / 5.3
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        background: Rectangle{
            color: transparent
            anchors.fill: parent
        }

        Text {
            text: qsTr("CANCEL")
            color: blue
            anchors.centerIn: parent
            font.pixelSize: parent.width / 7.7
            font.bold: true
        }
        onClicked: {
            console.log("Left btn Click");
        }
    }

    //Right button
    Button {
        width: parent.width / 2
        height: parent.height / 5.3
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        background: Rectangle{
            color: transparent
            anchors.fill: parent
        }

        Text {
            text: qsTr("OK")
            color: blue
            anchors.centerIn: parent
            font.pixelSize: parent.width / 7.7
            font.bold: true
        }

        onClicked: {
            console.log("Right btn Click");
            _root.visible = false 
        }
    }

    //Vertical Separator

    Rectangle {
        width: 2
        height: parent.height / 5.3
        color: gray        
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
    }

    Rectangle {
        width: parent.width
        height: parent.height / 4.7
        anchors.top: parent.top
        color: transparent
        id: topRect

        Rectangle {
            anchors.centerIn: parent
            color: transparent
            width: parent.width / 2.8
            height: parent.height / 1.4
            id: rect

            Row {
                id: row
                spacing: parent.width / 14
                Image {
                    id: img
                    source: "/res/Warning.svg"
                    width: topRect.height / 1.2
                    height: topRect.height / 1.2
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    id: txt
                    text: qsTr("Warning")
                    font.pixelSize: rect.width / 5.6
                    anchors.verticalCenter: parent.verticalCenter
                    color: white
                }
            }
        }
    }
}
