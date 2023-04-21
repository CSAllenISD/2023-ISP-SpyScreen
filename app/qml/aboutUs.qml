import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
Item {
    id: about
    
    Rectangle {
        anchors.fill: parent
        color: "#2596be"

        Buttons.BackButton{
            label: qsTr("Back")
        }
    }
}