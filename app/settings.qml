import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
ApplicationWindow {
	visible: true
   	title: "Spy Screen"
    width: screen.desktopAvailableWidth 
    height: screen.desktopAvailableHeight	
	background: Rectangle {
		color: "#2596be"
	}
    Rectangle {
        id: button
		color: "#0b5394"
        width: parent.width / 10
        height: parent.height / 15
        x: parent.width / 6; y: parent.height - parent.height / 4 - parent.height / 30
    Button {
            width:parent.width
            height:parent.height
            Loader { id: pageLoader }
            Text {
                x: (parent.width / 4); y: (parent.height / 5) 
                text: "BACK"
                font.pointSize: parent.width / 6
                color: "white"
                font.family: "Acme" 
            }
            MouseArea {
			    anchors.fill: parent
			    hoverEnabled: true
			    onPressed: {
			    	pageLoader.source = "main.qml"
		    	}
            }
        }
        }
}