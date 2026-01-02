import QtQuick
import milos.style

Rectangle {
    id: systemTray

    width: 48
    height: 48

    color: "transparent"

    signal settingsClicked()

    Text {
        anchors.centerIn: parent
        text: "⚙"
        font.pixelSize: 18
        color: Theme.textColor()
    }

    MouseArea {
        anchors.fill: parent
        onClicked: systemTray.settingsClicked()
    }
}
