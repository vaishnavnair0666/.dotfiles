import Quickshell
import QtQuick
// Import your modules from the modules/ folder
import "modules"
PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }
    implicitHeight: 40
    color: "#282c34"

    Row {
        anchors.fill: parent
        spacing: 10
        padding: 10

        // Left: Workspace names
        WorkspaceModule { }

        // Center: Clock
        Item { 
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            ClockModule { }
        }

        // Center: System info + buttons
		Item {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
			SysInfoModule { }
	}
    }
}
