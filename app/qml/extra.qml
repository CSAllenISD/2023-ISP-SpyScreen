import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import QtMultimedia

ApplicationWindow {
	visible: true
   	title: "Spy Screen"
    width: screen.desktopAvailableWidth 
    height: screen.desktopAvailableHeight
    MediaPlayer {
        id: mediaplayer
        source: "file://../images/ethanfrickingdies.mp4"
        videoOutput: ethan
        audioOutput: AudioOutput {}
    }

    VideoOutput {
        id: ethan
        anchors.fill: parent
    }
    MouseArea {
        anchors.fill: parent
        onPressed: mediaplayer.play();
    }
}
    // Item {
    //     width: 640
    //     height: 360
    //     MediaDevices {
    //         id: mediaDevices
    //     }
    //     CaptureSession {
    //         camera: Camera {
    //             id: camera
    //             cameraDevice: mediaDevices.defaultVideoInput
    //         }
    //         videoOutput: videoOutput
    //     }
    //     VideoOutput {
    //         id: videoOutput
    //         anchors.fill: parent
    //     }
    //     MouseArea {
    //         anchors.fill: parent
    //         onPressed: camera.start();
    //     }
    // }
