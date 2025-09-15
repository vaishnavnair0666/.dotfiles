import QtQuick
import QtQuick.Controls

Item {
    width: 200
    height: 30

    Row {
        anchors.centerIn: parent
        spacing: 10

        // Example CPU usage
        Text {
            text: "CPU: 15%"   // placeholder, you can dynamically bind later
            color: "#ffffff"
        }

        // Example Memory usage
        Text {
            text: "RAM: 3.2GB"
            color: "#ffffff"
        }

        // Example button
        Button {
            text: "⚙"
            onClicked: console.log("Settings clicked")
        }
    }
}

