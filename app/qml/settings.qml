import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
Item {
    id: about
    
    Rectangle {
        anchors.fill: parent
        color: "#2596be"
        
        ListModel {
            id: listModel
            ListElement {name: qsTr("Log Out"); page: "login.qml"}
        }

        Component {
            id: buttonDelegate
            Item {
                width: gridView.cellWidth; height: gridView.cellHeight
                RoundButton {
                    anchors.fill: parent
                    anchors.leftMargin: parent.width * (1/3)
                    // anchors.rightMargin: parent.width * (1/3)
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: parent.height / 10
                    width: parent.width / 2
                    //radius: parent.width / 10
                    Rectangle {
                        anchors.fill: parent
                        border.color: "black"
                        width: parent.width
                        height: parent.height
                        color: "#2596be"
                        //radius: parent.radius
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
        
        Rectangle {
            height: parent.height / 2
            width: height
            anchors.centerIn: parent
            border.color: "black"
            color: "#0b5394"
            GridView {
                id: gridView
                model: listModel
                cellWidth: parent.width * (2/3)
                cellHeight: parent.height / 12
                delegate: buttonDelegate
            }
            // ColumnLayout {
            //     anchors.fill: parent
            //     anchors.horizontalCenter: parent.horizontalCenter
            //     anchors.top: parent.top
            //     spacing: parent.height / 20
            //     // Rectangle {
            //     //     Layout.alignment: Qt.AlignTop
            //     //     color: "green"
            //     //     border.color: "black"
            //     //     Layout.preferredWidth: parent.width
            //     //     Layout.preferredHeight: parent.height / 10
            //     //     Text {
            //     //         anchors.left: parent.left
            //     //         anchors.verticalCenter: parent.verticalCenter
            //     //         anchors.leftMargin: parent.width / 20
            //     //         text: qsTr("Dark Mode")
            //     //     }
            //     //     Switch {
            //     //         anchors.right: parent.right
            //     //         anchors.rightMargin: parent.width / 20
            //     //         anchors.verticalCenter: parent.verticalCenter
            //     //     }
            //     // }
            //     // Rectangle {
            //     //     width: parent.width
            //     //     height: parent.height / 10
            //     //     Text {
            //     //         anchors.right: parent.left
            //     //         text: qsTr("Button Sounds")
            //     //     }
            //     //     Switch {
            //     //         anchors.left: parent.right
            //     //     }
            //     // }
            // }

        }        

        Buttons.BackButton {
            label: qsTr("Back")
        }
    }
}