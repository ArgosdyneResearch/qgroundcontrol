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
    id:     root
    color: defaultBackGroundColor
    z : 3    

    //Color Property
    property color defaultTextColor: "white"
    property color transparent: "transparent"
    property color blue: "#3d71d7"
    property color defaultBackGroundColor: Qt.rgba(0, 0, 0, 0.4)

    //Size Property
    property int defaultFontSize: Qt.platform.os === "android" ? ScreenTools.smallFontPointSize : ScreenTools.mediumFontPointSize

    implicitWidth: Screen.width
    implicitHeight: defaultFontSize * 9

    Row {
        id:                     viewButtonRow
        anchors.top:            parent.top
        anchors.bottom:         parent.bottom
        width: parent.width
        anchors.fill: parent

        //Logo Button
        Button {
            width: viewButtonRow.width * 0.115
            height: parent.height
            background: Rectangle {
                color: transparent
                Image {
                    source: "/res/TopMenuHomeButton.svg"
                    anchors.centerIn: parent
                    width: defaultFontSize * 8
                    height: parent.height - defaultFontSize
                }
            }
            onClicked: {
                console.log("Logo btn Click");
            }
        }
        //Move to MainPage Button
        Button {
            width: viewButtonRow.width * 0.19
            height: parent.height
            clip: true
            background: Rectangle {
                color: blue
                Row {
                anchors.fill: parent
                Rectangle {
                        height: parent.height - defaultFontSize * 3.2
                        anchors.verticalCenter: parent.verticalCenter
                        Row {
                            anchors.fill: parent
                            anchors.leftMargin: defaultFontSize * 2.8
                            spacing: defaultFontSize * 1.5
                    Image {
                        source: "/res/TopMenuManualFlight.svg"
                        height: parent.height
                        width: height
                    }
                            Column {
                            spacing: defaultFontSize
                            Text {
                                font.pixelSize: defaultFontSize * 1.8
                                text: qsTr("Intelligent Photo")
                                color: defaultTextColor
                                opacity: 0.8
                            }
                            Text {
                                font.pixelSize: defaultFontSize * 2.5
                                text: qsTr("Manual Flight")
                                font.bold: true
                                color: defaultTextColor
                            }
                            }
                            anchors.bottom: parent.bottom
                        }
                    }
                }
            }
            onClicked: {
                console.log("MainPage btn Click");
            }
        }
        //Drone Status Show Button
        Button {
            width: viewButtonRow.width * 0.5
            height: parent.height
            background: Rectangle {
                color: transparent
                Row {
                    Rectangle {
                        height: parent.height - defaultFontSize * 4.8
                        anchors.verticalCenter: parent.verticalCenter
                        Row {
                            anchors.fill: parent
                            anchors.leftMargin: defaultFontSize * 5
                            spacing: defaultFontSize
                            Image {
                                source: "/res/TopMenuBattery.svg"
                                height: defaultFontSize * 4
                                width: height
                            }
                            Text {
                                height: parent.height - defaultFontSize * 2.4
                                font.pixelSize: defaultFontSize * 4.1
                                text: qsTr("N/A")
                                color: defaultTextColor
                            }
                            anchors.bottom: parent.bottom
                        }
                    }

                    Rectangle {
                        height: parent.height - defaultFontSize * 4.8
                        anchors.verticalCenter: parent.verticalCenter
                        Row {
                            anchors.fill: parent
                            anchors.leftMargin: defaultFontSize * 26
                            spacing: defaultFontSize
                            Image {
                                source: "/res/TopMenuAltitude.svg"
                                height: defaultFontSize * 4
                                width: height
                            }
                            Text {
                                height: parent.height - defaultFontSize * 2.4
                                font.pixelSize: defaultFontSize * 4.1
                                text: qsTr("N/A")
                                color: defaultTextColor
                            }
                            anchors.bottom: parent.bottom
                        }
                    }

                    Rectangle {
                        height: parent.height - defaultFontSize * 4.8
                        anchors.verticalCenter: parent.verticalCenter
                        Row {
                            anchors.fill: parent
                            anchors.leftMargin: defaultFontSize * 46
                            spacing: defaultFontSize
                            Image {
                                source: "/res/TopMenuDistance.svg"
                                height: defaultFontSize * 4
                                width: height
                            }
                            Text {
                                height: parent.height - defaultFontSize * 2.4
                                font.pixelSize: defaultFontSize * 4.1
                                text: qsTr("N/A")
                                color: defaultTextColor
                            }
                            anchors.bottom: parent.bottom
                        }
                    }
                    Rectangle {
                        height: parent.height - defaultFontSize * 4.8
                        anchors.verticalCenter: parent.verticalCenter
                        Row {
                            anchors.fill: parent
                            anchors.leftMargin: defaultFontSize * 66
                            spacing: defaultFontSize
                            Image {
                                source: "/res/TopMenuSpeed.svg"
                                height: defaultFontSize * 4
                                width: height
                            }
                            Text {
                                height: parent.height - defaultFontSize * 2.4
                                font.pixelSize: defaultFontSize * 4.1
                                text: qsTr("N/A")
                                color: defaultTextColor
                            }
                            anchors.bottom: parent.bottom
                        }
                    }
                }
            }
            onClicked: {
                console.log("Drone Status btn Click");
            }
        }
        // Obstacle Status Icon
        Button {
            width: viewButtonRow.width * 0.062
            height: parent.height
            background: Rectangle {
                color: transparent
                Image {
                    source: "/res/TopMenuObstacleSensorOff.svg"
                    anchors.centerIn: parent
                }
            }
            onClicked: {
                console.log("Red btn Click");
            }
        }
        //Show Map Style Button
        Button {
            width: viewButtonRow.width * 0.062
            height: parent.height
            background: Rectangle {
                color: transparent
                Image {
                    source: "/res/TopMenuMapTool.svg"
                    anchors.centerIn: parent
                }
            }
            onClicked: {
                console.log("Red btn Click");
            }
        }
        //Setting Button
        Button {
            width: viewButtonRow.width * 0.07
            height: parent.height
            background: Rectangle {
                color: transparent
                Image {
                    source: "/res/TopMenuSetting.png"
                    anchors.centerIn: parent
                }
            }
            onClicked: {
                console.log("Red btn Click");
            }
        }

    }
}


