import QtQuick
import QtQuick.Controls

//establishes stackview and where to start
Item {
    anchors.fill: parent
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "login.qml"
    }
}