import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import QtMultimedia
Item {
    id: home
    visible: true

    //homepage
    Rectangle {
        anchors.fill: parent
        color: "#2596be"  

        //main stuff
        Image {
            id: logo
            width: parent.width / 4
            height: parent.width / 4
            x: parent.width / 50; y: parent.height / 50
            source: "../images/logo.png"
            fillMode: Image.PreserveAspectFit
        }
        Text {
            text: qsTr("WELCOME TO <br>SPY SCREEN")
            color: "white"
            font.pixelSize: (parent.width / 14)
            horizontalAlignment: Text.AlignHCenter
            font.family: "Acme"
            x: parent.width / 25 + parent.width / 4; y: parent.height / 20
        }

        // for stackview
        ListModel {
            id: listModel
            ListElement {name: qsTr("About"); page: "aboutUs.qml"}
            ListElement {name: qsTr("Activity"); page: "activity.qml"}
            ListElement {name: qsTr("Settings"); page: "settings.qml"}
        }

        // gives format for all three buttons on homepage
        Component {
            id: buttonDelegate
            Item {
                width: gridView.cellWidth; height: gridView.cellHeight
                RoundButton {
                    anchors.fill: parent
                    anchors.leftMargin: parent.width / 12
                    anchors.rightMargin: parent.width / 12
                    radius: parent.width / 10
                    Rectangle {
                        anchors.fill: parent
                        border.color: "black"
                        color: "#0b5394"
                        radius: parent.radius
                        Text {
                            color: "white"
                            font.pixelSize: parent.width / 8
                            text: name
                            anchors.centerIn: parent
                        }
                    }
                    onClicked: stackView.push( page )
                }
            }
        }

        GridView {
            id: gridView
            model: listModel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height / 4
            width: parent.width * 13 / 24
            cellWidth: parent.width / 6
            cellHeight: parent.height / 12
            delegate: buttonDelegate
        }
    }
}
