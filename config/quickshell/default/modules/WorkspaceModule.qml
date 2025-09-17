import QtQuick
import Quickshell
import Quickshell.Hyprland
Item {
    id: root
    height: 30
    // width will expand with contents

	Row {
		anchors.fill: parent
		spacing: 8
		Repeater {
			model: Hyprland.workspaces
			delegate: Text {
				text: modelData.name
				color: modelData.active ? "white" : "gray"
			}
		}    }
	}
