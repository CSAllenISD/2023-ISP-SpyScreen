import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
ApplicationWindow {
	visible: true
   	title: "Spy Screen"
    width: screen.desktopAvailableWidth 
    height: screen.desktopAvailableHeight	
    Loader { id: pageLoader }
	background: Rectangle {
		color: "#2596be"
	}
    Image {
        id: logo
		width: parent.width / 4
		height: parent.width / 4
        x: parent.width / 50; y: parent.height / 50
        source: "./images/logo.png"
        fillMode: Image.PreserveAspectFit
    }
   Text {
        text: "WELCOME TO <br>SPY SCREEN"
        color: "white"
        font.pointSize: (parent.width / 14)
        horizontalAlignment: Text.AlignHCenter
        font.family: "Acme"
        // Text.x = Image.x + Image.width + parent.width / 50
        x: parent.width / 25 + parent.width / 4; y: parent.height / 20
    }
    RoundButton {
        // Parent is screen
        id: settings
        width: parent.width / 8
        height: parent.height / 15
        x: parent.width / 5; y: parent.height - parent.height / 4 - parent.height / 30
        radius: parent.height / 60
        Rectangle {
            // Parent is button
            width: parent.width
            height: parent.height
            border.color: "black"
            color: "#0b5394"
            radius: parent.height / 4
            Text {
                // Parent is Rectangle, Text will be centered on button
                text: "Settings"
                font.pointSize: parent.width / 8
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "white"
                font.family: "Acme" 
            }
        } 
        MouseArea {
			    anchors.fill: parent
			    hoverEnabled: true
			    onPressed: {
			    	pageLoader.source = "settings.qml"
		    	}
        }
    }
    RoundButton {
        id: activity
	    width: parent.width / 8
        height: parent.height / 15
        // x is half the screen width - half of the button width
        x: 3 * parent.width / 8; y: parent.height - parent.height / 4 - parent.height / 30
        radius: parent.height / 60
        Rectangle {
            // Parent is button
            width: parent.width
            height: parent.height
            border.color: "black"
            color: "#0b5394"
            radius: parent.height / 4
            Text {
                // Parent is Rectangle, Text will be centered on button
                text: "Activity"
                font.pointSize: parent.width / 8
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "white"
                font.family: "Acme" 
            }
        } 
        MouseArea {
			anchors.fill: parent
			hoverEnabled: true
			onPressed: {
			    pageLoader.source = "activity.qml"
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