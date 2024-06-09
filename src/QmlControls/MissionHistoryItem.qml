import QtQuick          2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts  1.11
import QtQuick.Dialogs  1.3
import QtQuick.Window 2.0

import QGroundControl                       1.0
import QGroundControl.Controls              1.0
import QGroundControl.Palette               1.0
import QGroundControl.ScreenTools           1.0

Item {
    id: root
    implicitWidth: 260
    implicitHeight: 300
    property int fontSize: 30
    property string timeIndicatorColor: "gray"
    property alias dateTimeText: datetimeText.text
    property alias missionMapSource: missionMap.source
    property alias missionTypeImageSource: missionTypeImage.source
    property alias missionNameText: missionName.text

    ColumnLayout {
        id: rowLayout
        anchors.fill: parent

        Rectangle {
            color: "black"
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 3 / 5
            radius: 0

            Image {
                id: missionMap
                anchors.fill: parent
                source: "qrc:/qtquickplugin/images/template_image.png"
            }

            Image {
                id: missionTypeImage
                height: parent.height * 0.2
                width: parent.height * 0.2
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 0
                source: "qrc:/qtquickplugin/images/template_image.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        Rectangle {
            color: "white"
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 2 / 5

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 10
                TextInput {
                    id: missionName
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: "New Mission"
                    font.pixelSize: fontSize
                }

                Text {
                    id: datetimeText
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    color: timeIndicatorColor
                    text: qsTr("03/06/2024 09:32")
                    font.pixelSize: fontSize
                }
            }
        }
    }
}

