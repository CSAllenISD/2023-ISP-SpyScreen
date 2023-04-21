import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
Item {
    id: about
    
    Rectangle {
        anchors.fill: parent
        color: "#2596be"

        Rectangle {
            height: parent.height / 2
            width: height
            anchors.centerIn: parent
            border.color: "black"
            color: "lightgray"

            ColumnLayout {
                anchors.fill: parent
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                spacing: parent.height / 20
                Rectangle {
                    Layout.alignment: Qt.AlignTop
                    color: "green"
                    border.color: "black"
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: parent.height / 10
                    Text {
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: parent.width / 20
                        text: qsTr("Dark Mode")
                    }
                    Switch {
                        anchors.right: parent.right
                        anchors.rightMargin: parent.width / 20
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                Rectangle {
                    width: parent.width
                    height: parent.height / 10
                    Text {
                        anchors.right: parent.left
                        text: qsTr("Button Sounds")
                    }
                    Switch {
                        anchors.left: parent.right
                    }
                }
            }

        }        

        Buttons.BackButton {
            label: qsTr("Back")
        }
    }
}