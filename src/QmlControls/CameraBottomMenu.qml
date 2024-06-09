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
    property color fontColorWhite: "white"
    property color fontColorlightGray: "#a7a7a7"
    property color defaultBackGroundColor: "#3b3737"

    //Size Property
    property int defaultFontSize: Qt.platform.os === "android" ? ScreenTools.smallFontPointSize : ScreenTools.mediumFontPointSize

    implicitWidth: Screen.width
    implicitHeight: defaultFontSize * 9

    Row {
        anchors.fill: parent
        width: parent.width
        id: viewButtonRow
        spacing: 0
        Button {
            width: viewButtonRow.width * 0.107
            height: viewButtonRow.height
            background: Rectangle { color: transparent }

            Image {
                width: parent.width / 3.7
                height: parent.height / 1.5
                source: "/res/CameraBottomMenuAngleButton.svg"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Image {
                width: parent.width / 12
                height: parent.height / 7.5
                source: "/res/CameraBottomMenuAngleDotButton.svg"
                x: parent.width / 2.6
                y: parent.height / 5.3
            }

            Text {
                text: "0 °"
                color: "white"
                x: parent.width / 1.7
                y: parent.height / 8
                font.pixelSize: defaultFontSize * 2
            }

        }
        Button {
            width: viewButtonRow.width * 0.024
            height: viewButtonRow.height
            background: Rectangle { color: transparent }

            Image {
                source: "/res/BackArrowButton.svg"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width /1.8
                height: parent.height / 2.1
            }
            onClicked: {
                flickAble.contentX = Math.max(0, flickAble.contentX - flickAble.width)
            }
        }

        //Flickable
        Rectangle {
            width: viewButtonRow.width * 0.755
            height: viewButtonRow.height
            color: transparent
            clip: true
            Flickable {
                anchors.fill: parent
                contentWidth: parent.width * 2.6
                contentHeight: parent.height
                id: flickAble

                Row {
                    Button {
                        width: flickAble.width / 5
                        height: flickAble.height
                        background: Rectangle { color: transparent }

                        Column {
                            anchors.centerIn: parent
                            spacing: defaultFontSize
                            Text {
                                text: "8K"
                                color: fontColorWhite
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2.4
                            }
                            Text {
                                text: "RESOLUTION"
                                color: fontColorlightGray
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2
                            }
                        }
                    }
                    Button {
                        width: flickAble.width / 5
                        height: flickAble.height
                        background: Rectangle { color: transparent }

                        Column {
                            anchors.centerIn: parent
                            spacing: defaultFontSize
                            Text {
                                text: "60FPS"
                                color: fontColorWhite
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2.4
                            }
                            Text {
                                text: "FRAME RATE"
                                color: fontColorlightGray
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2
                            }
                        }

                    }
                    Button {
                        width: flickAble.width / 5
                        height: flickAble.height
                        background: Rectangle { color: transparent }

                        Column {
                            anchors.centerIn: parent
                            spacing: defaultFontSize
                            Text {
                                text: "MP4"
                                color: fontColorWhite
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2.4
                            }
                            Text {
                                text: "FORMAT"
                                color: fontColorlightGray
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2
                            }
                        }
                    }
                    Button {
                        width: flickAble.width / 5
                        height: flickAble.height
                        background: Rectangle { color: transparent }

                        Column {
                            anchors.centerIn: parent
                            spacing: defaultFontSize
                            Text {
                                text: "AUTO"
                                color: fontColorWhite
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2.4
                            }
                            Text {
                                text: "EXPOSURE MODE"
                                color: fontColorlightGray
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2
                            }
                        }
                    }
                    Button {
                        width: flickAble.width / 5
                        height: flickAble.height
                        background: Rectangle { color: transparent }

                        Column {
                            anchors.centerIn: parent
                            spacing: defaultFontSize
                            Text {
                                text: "1/60"
                                color: fontColorlightGray
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2.4
                            }
                            Text {
                                text: "SHUTTER"
                                color: fontColorlightGray
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2
                            }
                        }
                    }
                    Button {
                        width: flickAble.width / 5
                        height: flickAble.height
                        background: Rectangle { color: transparent }

                        Column {
                            anchors.centerIn: parent
                            spacing: defaultFontSize
                            Text {
                                text: "100"
                                color: fontColorWhite
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2.4
                            }
                            Text {
                                text: "ISO"
                                color: fontColorlightGray
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2
                            }
                        }
                    }
                    Button {
                        width: flickAble.width / 5
                        height: flickAble.height
                        background: Rectangle { color: transparent }

                        Column {
                            anchors.centerIn: parent
                            spacing: defaultFontSize
                            Text {
                                text: "+2.3"
                                color: fontColorWhite
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2.4
                            }
                            Text {
                                text: "EV"
                                color: fontColorlightGray
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2
                            }
                        }
                    }
                    Button {
                        width: flickAble.width / 5
                        height: flickAble.height
                        background: Rectangle { color: transparent }
                        id: btnWB

                        Column {
                            anchors.centerIn: parent
                            spacing: defaultFontSize
                            Image {
                                source: "/res/CameraBottomMenuWbButton.svg"
                                width: btnWB.width / 8.1
                                height: width
                            }

                            Text {
                                text: "EV"
                                color: fontColorlightGray
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2
                            }
                        }
                    }
                    Button {
                        width: flickAble.width / 5
                        height: flickAble.height
                        background: Rectangle { color: transparent }

                        Column {
                            anchors.centerIn: parent
                            spacing: defaultFontSize
                            Text {
                                text: "1.0x"
                                color: fontColorWhite
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2.4
                            }
                            Text {
                                text: "DIGITAL ZOOM"
                                color: fontColorlightGray
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2
                            }
                        }
                    }
                    Button {
                        width: flickAble.width / 5
                        height: flickAble.height
                        background: Rectangle { color: transparent }

                        Column {
                            anchors.centerIn: parent
                            spacing: defaultFontSize
                            Text {
                                text: "AF"
                                color: fontColorWhite
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2.4
                            }
                            Text {
                                text: "AF"
                                color: fontColorlightGray
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2
                            }
                        }
                    }
                    Button {
                        width: flickAble.width / 5
                        height: flickAble.height
                        background: Rectangle { color: transparent }

                        Column {
                            anchors.centerIn: parent
                            spacing: defaultFontSize
                            Text {
                                text: "NONE"
                                color: fontColorWhite
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2.4
                            }
                            Text {
                                text: "COLOR"
                                color: fontColorlightGray
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2
                            }
                        }
                    }
                    Button {
                        width: flickAble.width / 5
                        height: flickAble.height
                        background: Rectangle { color: transparent }
                        id: btnStyle

                        Column {
                            anchors.centerIn: parent
                            spacing: defaultFontSize
                            Image {
                                source: "/res/CameraBottomMenuStyleButton.svg"
                                width: btnStyle.width / 4.4
                                height: btnStyle.height / 3.3
                            }

                            Text {
                                text: "EV"
                                color: fontColorlightGray
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2
                            }
                        }
                    }
                    Button {
                        width: flickAble.width / 5
                        height: flickAble.height
                        background: Rectangle { color: transparent }

                        Column {
                            anchors.centerIn: parent
                            spacing: defaultFontSize
                            Text {
                                text: "MANUAL"
                                color: fontColorWhite
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2.4
                            }
                            Text {
                                text: "PIV"
                                color: fontColorlightGray
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.pixelSize: defaultFontSize * 2
                            }
                        }
                    }
                }

                //Smooth Moving Animation
                Behavior on contentX {
                    NumberAnimation {
                        duration: defaultFontSize * 30
                        easing.type: Easing.InOutQuad
                    }
                }
            }
        }

        Button {
            width: viewButtonRow.width * 0.024
            height: viewButtonRow.height
            background: Rectangle { color: transparent }

            Image {
                source: "/res/FrontArrowButton.svg"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width /1.8
                height: parent.height / 2.1
            }

            onClicked: {
                flickAble.contentX = Math.min(flickAble.contentWidth - flickAble.width, flickAble.contentX + flickAble.width)
            }
        }
        Button {
            width: viewButtonRow.width * 0.09
            height: viewButtonRow.height
            background: Rectangle { color: transparent }

            Image {
                source: "/res/CameraBottomMenuSettingButton.svg"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width / 3
                height: parent.height / 2
            }

        }
    }


}


