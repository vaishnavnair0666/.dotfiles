import Quickshell 1.0
import QtQuick 2.15
import QtQuick.Controls 2.15

Widget {
    id: root
    width: 100
    height: 40

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: timeLabel.text = Qt.formatTime(new Date(), "hh:mm:ss")
    }

    Text {
        id: timeLabel
        anchors.centerIn: parent
        font.pixelSize: 20
    }
}

