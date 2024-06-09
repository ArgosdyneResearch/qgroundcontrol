import QtQuick          2.12
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
    id: root
    color: defaultBackGroundColor
    z: 3

    //Color Property
    property color defaultTextColor: "white"
    property color transparent: "transparent"
    property color blue: "#3d71d7"
    property color defaultBackGroundColor: Qt.rgba(0, 0, 0, 0.6)

    //Size Property
    property int defaultFontSize: Qt.platform.os === "android" ? ScreenTools.smallFontPointSize : ScreenTools.mediumFontPointSize

    implicitWidth: Screen.width
    implicitHeight: defaultFontSize * 5.8

    Row {
        id:                     viewButtonRow
        anchors.top:            parent.top
        anchors.bottom:         parent.bottom
        width: parent.width
        anchors.fill: parent

        Button {
            width: viewButtonRow.width
            height: parent.height
            background: Rectangle {
                color: transparent
                Row {
                    Rectangle {
                        height: parent.height - defaultFontSize * 2
                        anchors.verticalCenter: parent.verticalCenter
                        Row {
                            anchors.fill: parent
                            anchors.leftMargin: viewButtonRow.width / 6 - defaultFontSize * 8
                            spacing: defaultFontSize
                            Image {
                                source: "/res/TopMenuGpsStatus.svg"
                                height: defaultFontSize * 4
                                width: height
                            }
                            Image {
                                source: "/res/TopMenuSignalLevel.svg"
                                height: defaultFontSize * 4
                                width: height
                            }
                            anchors.bottom: parent.bottom
                        }
                    }

                    Rectangle {
                        height: parent.height - defaultFontSize * 2
                        anchors.verticalCenter: parent.verticalCenter
                        Row {
                            anchors.fill: parent
                            anchors.leftMargin: viewButtonRow.width / 6 * 2 - defaultFontSize * 8
                            spacing: defaultFontSize
                            Image {
                                source: "/res/TopMenuRemoteControllerConnectionStatus.svg"
                                height: defaultFontSize * 4
                                width: height
                            }
                            Image {
                                source: "/res/TopMenuSignalLevel.svg"
                                height: defaultFontSize * 4
                                width: height
                            }
                            anchors.bottom: parent.bottom
                        }
                    }
                    Rectangle {
                        height: parent.height - defaultFontSize * 2
                        anchors.verticalCenter: parent.verticalCenter
                        Row {
                            anchors.fill: parent
                            anchors.leftMargin: viewButtonRow.width / 6 * 3 - defaultFontSize * 8
                            spacing: defaultFontSize
                            Image {
                                source: "/res/TopMenuImageTransferStatus.svg"
                                height: defaultFontSize * 4
                                width: height
                            }
                            Image {
                                source: "/res/TopMenuSignalLevel.svg"
                                height: defaultFontSize * 4
                                width: height
                            }
                            anchors.bottom: parent.bottom
                        }
                    }
                    Rectangle {
                        height: parent.height - defaultFontSize * 2
                        anchors.verticalCenter: parent.verticalCenter
                        Row {
                            anchors.fill: parent
                            anchors.leftMargin: viewButtonRow.width / 6 * 4 - defaultFontSize * 8
                            spacing: defaultFontSize
                            Image {
                                source: "/res/TopMenuBattery2.svg"
                                height: defaultFontSize * 4
                                width: height
                            }
                            Text {
                                height: parent.height - defaultFontSize * 2.4                                
                                font.pixelsize: ScreenTools.defaultFontPixelHeight * 4.1
                                text: qsTr("N/A")
                                color: defaultTextColor
                            }
                            anchors.bottom: parent.bottom
                        }
                    }

                    Rectangle {
                        height: parent.height - defaultFontSize * 2
                        anchors.verticalCenter: parent.verticalCenter
                        Row {
                            anchors.fill: parent
                            anchors.leftMargin: viewButtonRow.width / 6 * 5 - defaultFontSize * 8 
                            spacing: defaultFontSize
                            Image {
                                source: "/res/TopMenuBatteryPower.svg"
                                height: defaultFontSize * 4
                                width: height
                            }
                            Text {
                                height: parent.height - defaultFontSize * 2.4                               
                                font.pixelsize: ScreenTools.defaultFontPixelHeight * 4.1
                                text: qsTr("N/A")
                                color: defaultTextColor
                            }
                            anchors.bottom: parent.bottom
                        }
                    }

                    Rectangle {
                        height : parent.height - defaultFontSize * 2
                        anchors.verticalCenter: parent.verticalCenter
                        Row {
                            anchors.leftMargin: viewButtonRow.width - defaultFontSize * 10
                            anchors.fill: parent
                            Image {
                                source: "/res/TopMenuUp.svg"
                                height: defaultFontSize * 4
                                width: height
                            }
                              anchors.bottom: parent.bottom
                        }
                    }
                }
            }
            onClicked: {
                console.log("btn Click");                
            }
        }
    }
}
