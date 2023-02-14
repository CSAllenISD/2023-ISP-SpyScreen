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
    /*Image {
		width: screen.desktopAvailableWidth
		height: screen.desktopAvailableHeight
        source: "./images/blue.jpeg"
        fillMode: Image.Stretch
    }*/
	/*Text {
		text: "Devious activities in action 😈"
		font.pixelSize: 20
	}*/
	Rectangle {
		id: rect
		anchors.left: parent.horizontalCenter
 		anchors.top: parent.VerticalCenter
	}
    Button {
		id: reddy
		anchors.left: rect.left
		anchors.leftMargin: -200
 		anchors.top: rect.top
		anchors.topMargin: 200
		width: 400
		height: 400
		Image {
			id: red_Button
    		anchors.fill: parent
    		source: "./images/redButton.png"
    		fillMode: Image.PreserveAspectFit
		}	
       	text: "nuke"
		MouseArea {
			anchors.fill: parent
			hoverEnabled: true
			onPressed: {
				reddy.text = "BOOOOOM"
				red_Button.source = "./images/explosion.png"
			}
			onEntered: {
				red_Button.source = "./images/shocky.png"
			}
			onExited: {
				red_Button.source = "./images/redButton.png"
			}
			onClicked: {
				//Qt.openUrlExternally("https://www.youtube.com/watch?v=dQw4w9WgXcQ");
				popup.open()
			}
			onReleased: {
				red_Button.source = "./images/redButton.png"
				reddy.text = "nuke"
			}
		}
	}
	Popup {
     	id: popup
       	width: screen.desktopAvailableWidth
    	height: screen.desktopAvailableHeight
		background: Rectangle {
			color: "#2596be"
		}	
    	modal: true
       	focus: true
       	closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    	Label {
    			text: qsTr("NOTHING TO SEE 
HERE GET OUT")
			color: "red"
			font.pixelSize: 200
		}
		Button {
			id: x_Button
			Image {
				anchors.fill: parent
				source: "./images/x.png"
			}
		}
		MouseArea {
			anchors.fill: parent
			onPressed: {
				popup.close()
			}	
		}
    }
}	