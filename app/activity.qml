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
    Button {
		id: reddy
		anchors.left: parent.horizontalCenter
 		anchors.top: parent.VerticalCenter
		anchors.leftMargin: -200
		anchors.topMargin: 200
		width: 400
		height: 400
		text: "nuke"
		Image {
				id: red_Button
    			anchors.fill: parent
    			source: "./images/redButton.png"
    			fillMode: Image.PreserveAspectFit
		}	
		
		MouseArea {
			anchors.fill: parent
			hoverEnabled: true
			onPressed: {
				reddy.text = "BOOOOOM"
				red_Button.source = "./images/explosion.png"
			}
			onEntered: {
				red_Button.source = "./images/shocky.png"
				reddy.text = "DONT DO ITTT"
			}
			onExited: {
				red_Button.source = "./images/redButton.png"
				reddy.text = "nuke"
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
	RoundButton {
        // Parent is screen
        id: settings
        width: parent.width / 8
        height: parent.height / 15
        anchors.left : parent.left
        anchors.leftMargin : parent.width / 10
		anchors.bottom : parent.bottom
        anchors.bottomMargin : parent.height / 10
        y: parent.height - parent.height / 4
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
                text: "Back"
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
			    	pageLoader.source = "main.qml"
		    	}
        }
    }
}	