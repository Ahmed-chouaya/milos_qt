import QtQuick
import milos.style

Rectangle {
    width: 48
    height: topBar.height

    color: "transparent"

    Text {
        id: batteryText
        anchors.centerIn: parent
        text: systemMonitor.batteryIcon + " " + systemMonitor.batteryLevel + "%"
        font.family: "JetBrains Mono, monospace"
        font.pixelSize: 12
        font.weight: Font.Bold
        color: Theme.textColor()
    }
}
