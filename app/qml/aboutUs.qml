import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
Item {
    id: about
    
    Rectangle {
        anchors.fill: parent
        color: "#2596be"

        //about us box
        Rectangle {
            width: parent.width * 5 / 6 + 20
            height: aboutText.contentHeight + 15
            anchors.centerIn: parent
            color: "#0b5394"
            radius: 25
            Text {
                id: aboutText
                anchors.fill: parent
                padding: 10
                wrapMode: Text.WordWrap
                textFormat: Text.RichText
                text:"<p>As technology has progressed, the ability to remain anonymous has diminished along with it. While digital security is often the side of privacy that is most scrutinized and focused on, physical security is overlooked. This is where my product comes in. We have all experienced a little brother, a pesky classmate, an annoying stranger, a random onlooker, or just anyone who may want to peer on our screen when we don't want them too. This is the problem I am trying to solve. My product is the SpyScreen which will fight the issue of privacy on technology by detecting when other users besides you look upon your screen when you are doing nefarious activities. When other people look at your screen my product will shut off your screen or switch your computer to a family friendly option. This product will target mysterious fellows who may have something to hide or people who just enjoy their privacy and would like to ensure that it stays that way.</p>"
                font.pixelSize: (30)
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                font.family: "Acme"
            }
        }

        Buttons.BackButton{
            label: qsTr("Back")
        }
    }
}