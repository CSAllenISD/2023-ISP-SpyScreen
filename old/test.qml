import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3
import QtQml.Models 2.15
import QtQuick.Layouts 2.15
import QtQuick.Controls.Styles 1.4
import Qt.labs.settings 1.1
import QtQuick.LocalStorage 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Controls.Universal 2.4
import QtQuick.Controls.impl 2.4
import QtQuick.Templates 2.4
import QtQuick.Templates.Private 2.4

import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.3
import QtQuick.Controls.Styles 1.4
import Qt.labs.settings 1.1
import QtQuick.LocalStorage 2.0
import QtQuick.Controls.Material 2.4
import QtQuick.Controls.Universal 2.4
import QtQuick.Controls.impl 2.4
import QtQuick.Templates 2.4
import QtQuick.Templates.Private 2.4

import Qt.core 4.0
//import QtQuick.Dialogs 1.3
import QtQml.Models 2.15
//import QtCore 4.0
Item {
    id: home
    visible: true

    Rectangle {
        anchors.fill: parent
        color: "#2596be"  

        Image {
            id: logo
            width: parent.width / 4
            height: parent.width / 4
            x: parent.width / 50; y: parent.height / 50
            source: "../images/logo.png"
            fillMode: Image.PreserveAspectFit
        }
        Button {
            id: pythonButton
            text: "Start Python Script"
            onClicked: {
                var pythonScript = "/path/to/your/script.py" // replace with the path to your Python script
                var process = Qt.createQProcess(null)
                process.start("/usr/bin/python", [pythonScript])
            }
        }

        Text {
            text: qsTr("WELCOME TO <br>SPY SCREEN")
            color: "white"
            font.pointSize: (parent.width / 14)
            horizontalAlignment: Text.AlignHCenter
            font.family: "Acme"
            x: parent.width / 25 + parent.width / 4; y: parent.height / 20
        }

        ListModel {
            id: listModel
            ListElement {name: qsTr("About"); page: "aboutUs.qml"}
            ListElement {name: qsTr("Activity"); page: "activity.qml"}
            ListElement {name: qsTr("Settings"); page: "settings.qml"}
        }
        
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
                            font.pointSize: parent.width / 8
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
