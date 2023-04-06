import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import QtMultimedia
Item {
	id: activity

	Rectangle {
		anchors.fill: parent
		color: "#2596be"
		RoundButton {
			id: redButton
			anchors.centerIn: parent
			radius: parent.width
			width: parent.width / 4
			height: parent.width / 4
			Rectangle {
				anchors.fill: parent
				radius: parent.radius
				color: "#2596be"
				border.color: "#2596be"
				Image {
					id: redButtonImage
					anchors.fill: parent
					source: "./images/redButton.png"
					fillMode: Image.PreserveAspectFit
				}
			}
				
			text: "nuke"
			MouseArea {
				anchors.fill: parent
				hoverEnabled: true
				onPressed: {
					redButton.text = "BOOOOOM"
					redButtonImage.source = "./images/explosion.png"
				}
				onEntered: {
					redButtonImage.source = "./images/shocky.png"
					redButton.text = "DONT DO ITTT"
				}
				onExited: {
					redButtonImage.source = "./images/redButton.png"
					redButton.text = "nuke"
				}
				onClicked: {
					//Qt.openUrlExternally("https://www.youtube.com/watch?v=dQw4w9WgXcQ");
					popup.open()
				}
				onReleased: {
					redButtonImage.source = "./images/redButton.png"
					redButton.text = "nuke"
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
					text: qsTr("NOTHING TO SEE <br>HERE GET OUT")
				color: "red"
				font.pixelSize: 200
			}
			Button {
				id: x_Button
				width: 20
				height: 30
				Image {
					anchors.fill: parent
					source: "./images/x.png"
				}
				onClicked: popup.close()
			}
    	}

		BackButton {}
	}
}	
