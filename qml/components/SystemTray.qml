import QtQuick
import milos.style

Rectangle {
    width: 48
    height: topBar.height

    color: "transparent"

    Text {
        anchors.centerIn: parent
        text: "⚙"
        font.pixelSize: 18
        color: Theme.textColor()
    }

    MouseArea {
        anchors.fill: parent
        onClicked: settingsWindow.visible = true
    }
}
