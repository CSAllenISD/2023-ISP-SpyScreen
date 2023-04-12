import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
ApplicationWindow {
	visible: true
   	title: "Spy Screen"
    width: screen.desktopAvailableWidth 
    height: screen.desktopAvailableHeight	

    Rectangle {
        color: "black"
        width: parent.width
        height: parent.height
    }

    Loader {
        id: mainLoader
        anchors.fill: parent
        source: "stackView.qml"
    }
}