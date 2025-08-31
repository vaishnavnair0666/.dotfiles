import Quickshell 1.0
import Quickshell.Widgets 1.0

Shell {
    Panel {
        anchors.top: true
        width: Screen.width
        height: 32

        Rectangle {
            anchors.fill: parent
            color: "#1e1e2e"

            Row {
                anchors.centerIn: parent
                spacing: 12

                Text {
                    text: "Quickshell ✅"
                    color: "white"
                    font.pixelSize: 14
                }

                Text {
                    text: Qt.formatDateTime(new Date(), "hh:mm:ss")
                    color: "white"
                    font.pixelSize: 14
                }
            }
        }
    }
}
