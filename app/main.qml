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
    Image {
        id: logo
		width: parent.width / 4
		height: parent.width / 4
        x: parent.width / 20 - (parent.width / 50); y: parent.height / 6 - parent.height / 10
        source: "./images/logo.png"
        fillMode: Image.PreserveAspectFit
    }
   Text {
        text: "WELCOME TO <br>SPY SCREEN"
        color: "white"
        font.pointSize: (parent.width / 11)
        horizontalAlignment: Text.AlignHCenter
        font.family: "Acme"
        x: parent.width / 2 - parent.width / 5; y: parent.height / 6 - parent.height / 10
    }
    Rectangle {
        id: settings
		color: "#0b5394"
        width: parent.width / 10
        height: parent.height / 15
        x: parent.width / 3; y: parent.height - parent.height / 4 - parent.height / 30
        Button {
            width:parent.width
            height:parent.height
            Text {
                x: (parent.width / 6); y: (parent.height / 5) 
                text: "SETTINGS"
                font.pointSize: parent.width / 6
                color: "white"
                font.family: "Acme" 
            }
            MouseArea {
			    anchors.fill: parent
			    hoverEnabled: true
			    onPressed: {
			    	pageLoader.source = "settings.qml"
		    	}
            }
        }
    }
    Rectangle {
        id: button
		color: "#0b5394"
        width: parent.width / 10
        height: parent.height / 15
        x: settings.x + parent.width / 6; y: parent.height - parent.height / 4 - parent.height / 30
        Button {
            width:parent.width
            height:parent.height
            Loader { id: pageLoader }
            Text {
                x: (parent.width / 6); y: (parent.height / 5) 
                text: "ACTIVITY"
                font.pointSize: parent.width / 6
                color: "white"
                font.family: "Acme" 
            }
            MouseArea {
			    anchors.fill: parent
			    hoverEnabled: true
			    onPressed: {
			    	pageLoader.source = "activity.qml"
		    	}
            }
        }
    }
    Rectangle {
        id: about_us
		color: "#0b5394"
        width: parent.width / 10
        height: parent.height / 15
        x: settings.x + parent.width / 3; y: parent.height - parent.height / 4 - parent.height / 30
        Button {
            width:parent.width
            height:parent.height
            Text {
                x: (parent.width / 6); y: (parent.height / 5) 
                text: "ABOUT US"
                font.pointSize: parent.width / 6
                color: "white"
                font.family: "Acme" 
            }
            MouseArea {
			    anchors.fill: parent
			    hoverEnabled: true
			    onPressed: {
			    	pageLoader.source = "aboutUs.qml"
		    	}
            }
        }
    }
}