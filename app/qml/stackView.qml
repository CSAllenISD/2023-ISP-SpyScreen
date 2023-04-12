import QtQuick
import QtQuick.Controls

Item {
    anchors.fill: parent
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "home.qml"
    }
}