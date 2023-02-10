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
				Image {
					id: red_Button
        			anchors.fill: parent
        			source: "./images/redButton.png"
        			fillMode: Image.PreserveAspectFit
					MouseArea {
						anchors.fill: parent
       					acceptedButtons: Qt.red_Button
						onClicked: {
							red_Button.source = "./images/shock.png"
						}	
				}
    		}	
        text: "nuke"
		Layout.minimumWidth: 300
        Layout.minimumHeight: 300
    	}
	}
}	