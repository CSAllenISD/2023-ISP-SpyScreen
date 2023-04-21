import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import QtMultimedia
from PyQt5.QtCore import QProcess

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
        def take_photo():
            process = QProcess()
            process.start('python3', ['../facialRec/takePhoto.py'])
            process.waitForFinished()
        Button {
            text: "Take Photo"
            onClicked: take_photo()
        }

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

        Text {
            text: qsTr("Please Log In")
            color: "white"
            font.pixelSize: parent.width / 42
            horizontalAlignment: Text.AlignHCenter
            font.family: "Acme"
            anchors.centerIn: parent
        }

        Rectangle {
            id: loginBox
            anchors.fill: parent
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height / 10
            anchors.topMargin: parent.height * 3 / 5
            anchors.rightMargin: parent.width / 4
            anchors.leftMargin: parent.width / 4
            color: "transparent"

            Rectangle {
                id: regesterButton
                anchors.left: parent.left
                width: parent.width / 3
                height: parent.height
                color: "transparent"

                RoundButton {
                    height: parent.height / 2
                    width: parent.width - parent.width / 6
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
                            font.pixelSize: parent.width / 8
                            text: qsTr("Register")
                            anchors.centerIn: parent
                        }
                    }
                    onClicked: stackView.push( "settings.qml" )
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
                    height: 30
                    font.pixelSize: 15
                    color: "black"
                    placeholderText: qsTr("Username")
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
