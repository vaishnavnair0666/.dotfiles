import Quickshell 1.0
import QtQuick 2.15

Shell {
    Panel {
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
        width: 200

        Clock { } // <-- your widget
    }
}

