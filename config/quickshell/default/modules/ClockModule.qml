import QtQuick

Item {
    width: 80
    height: 30

    Text {
        id: clockText
        anchors.centerIn: parent
        color: "#ffffff"
        text: Qt.formatTime(new Date(), "hh:mm:ss")
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clockText.text = Qt.formatTime(new Date(), "hh:mm:ss")
    }
}
