import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow {
	visible: true
   	title: "Spy Screen"
    width: screen.desktopAvailableWidth 
    height: screen.desktopAvailableHeight	
    Image {
		width: screen.desktopAvailableWidth
		height: screen.desktopAvailableHeight
        source: "./images/frog.jpeg"
        fillMode: Image.Stretch
    }
	Text {
		anchors.centerIn: parent	
		text: "Devious activities in action 😈"
		font.pixelSize: 20
	}
	RowLayout {
    	Button {
			id: reddy
			Image {
				id: red_Button
    			anchors.fill: parent
       			source: "./images/redButton.png"
    			fillMode: Image.PreserveAspectFit
			}	
        text: "nuke"
		Layout.minimumWidth: 1000
        Layout.minimumHeight: 1000
    	}
	}
	MouseArea {
		anchors.fill: parent
		onPressed: {
			red_Button.source = "./images/shocky.png"
			reddy.text = "BOOOOOM"
		}
		onReleased: {
			red_Button.source = "./images/redButton.png"
			reddy.text = "nuke"
		}
	}
}	