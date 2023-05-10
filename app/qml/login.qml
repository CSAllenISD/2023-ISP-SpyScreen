import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import QtMultimedia

Item {
    id: home
    visible: true
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight

    Rectangle {
        anchors.fill: parent
        color: "#2596be"
        width: parent.width
        height: parent.height

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
            font.pixelSize: parent.width / 14
            horizontalAlignment: Text.AlignHCenter
            font.family: "Acme"
            x: parent.width / 25 + parent.width / 4; y: parent.height / 20
        }

        
        Rectangle {
            id: loginBox
            anchors.fill: parent
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height / 10
            anchors.topMargin: parent.height * 3 / 5
            anchors.rightMargin: parent.width / 3
            anchors.leftMargin: parent.width / 3
            color: "transparent"

            Rectangle {
                id: registerButton
                anchors.left: parent.left
                width: parent.width / 3
                height: parent.height
                color: "transparent"

                RoundButton {
                    height: parent.height / 2
                    width: parent.width - parent.width / 10
                    anchors.centerIn: parent
                    anchors.horizontalCenter: parent.horizontalCenter
                    radius: parent.width / 10
                    Rectangle {
                        anchors.fill: parent
                        border.color: "black"
                        color: "#0b5394"
                        radius: parent.radius
                        Text {
                            color: "white"
                            font.pixelSize: parent.width / 6
                            text: qsTr("Take Photo")
                            anchors.centerIn: parent
                        }
                    }
                    onClicked: stackView.push( "home.qml" )
                }
            }
            Rectangle {
                id: loginField
                anchors.right: parent.right
                width: parent.width * 2 / 3
                height: parent.height
                color: "transparent"
                TextField {
                    width: parent.width * 5 / 6
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter 
                    height: parent.height / 5
                    font.pixelSize: parent.height / 6
                    color: "black"
                    placeholderText: qsTr("Name")

                    background: Rectangle {
                        anchors.fill: parent
                        color: "white"
                        border.color: "gray"
                    }
                }
            }
        }
    }
}
