import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
Item {
    id: about
    
    Rectangle {
        anchors.fill: parent
        color: "#2596be"

        RoundButton {
            width: parent.width / 8
            height: parent.height / 15
            anchors.left: parent.left
            anchors.leftMargin: parent.width / 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height / 10
            radius: parent.height / 60

            onClicked: stackView.pop()
            Rectangle {
                anchors.fill: parent
                border.color: "black"
                color: "#0b5394"
                radius: parent.radius
                Text {
                    text: "Back"
                    font.pointSize: parent.width / 8
                    anchors.centerIn: parent
                    color: "white"
                    font.family: "Acme" 
                }
            }
        }
    }
}