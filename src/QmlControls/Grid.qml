import QtQuick 2.15
import QtQuick.Controls 2.14
import QtPositioning 5.14
import QtQuick.Window 2.10
import QGroundControl.ScreenTools 1.0

Rectangle {
    id: root
    color: black

    implicitWidth: Screen.width / 3.24
    implicitHeight: Screen.height
    property string white: '#ffffff'
    property string black: '#000000'
    property string blue: '#3D71D7'

    property int hItemDelegate: 52;

    Text {
        id: gridText
        color: white
        text: qsTr("Grid")
        font.pixelSize: ScreenTools.mediumFontPointSize * 2
        font.bold: true
        font.family: 'Arial'
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 12
        anchors.topMargin: 17  // Add margin from top of the parent if needed
    }

    Text{
        id: backtext
        text: qsTr('Back')
        color: blue
        font.pixelSize: ScreenTools.defaultFontPixelHeight * 2
        font.family: 'Arial'
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.topMargin: 17
    }

    Column {
        anchors.top: gridText.bottom
        anchors.topMargin: 20 // Editable margin between text1 and column1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        spacing: 5

        ItemDelegate {
            width: parent.width
            height: hItemDelegate

            Image {
                source: "qrc:/qmlimages/NoneBox.svg"
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                anchors.left: parent.left
                anchors.leftMargin: 90
                text: 'None'
                font.pixelSize: ScreenTools.mediumFontPointSize * 2
                color: white
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        ItemDelegate {
            width: parent.width
            height: hItemDelegate

            Image {
                source: "qrc:/qmlimages/Grid.svg"
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                anchors.left: parent.left
                anchors.leftMargin: 80
                color: white
                text: qsTr("Grid")
                font.pixelSize: ScreenTools.mediumFontPointSize * 2
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        ItemDelegate {
            width: parent.width
            height: hItemDelegate

            Image {
                source: "qrc:/qmlimages/gridLine.svg"
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                anchors.left: parent.left
                anchors.leftMargin: 80
                color: white
                text: qsTr("Grid + Line")
                font.pixelSize: ScreenTools.mediumFontPointSize * 2
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}
