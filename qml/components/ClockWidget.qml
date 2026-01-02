import QtQuick
import QtQuick.Controls
import milos.style

Rectangle {
    width: 120
    height: topBar.height

    color: "transparent"
    border.width: 0

    Column {
        anchors.centerIn: parent
        spacing: 2

        Text {
            id: timeText
            text: new Date().toLocaleTimeString(Qt.locale(), "HH:mm")
            font.family: "JetBrains Mono, monospace"
            font.pixelSize: 16
            font.weight: Font.Bold
            color: Theme.textColor()
        }

        Text {
            id: dateText
            text: new Date().toLocaleDateString(Qt.locale(), "MMM d")
            font.family: "JetBrains Mono, monospace"
            font.pixelSize: 10
            color: Theme.textColor()
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            timeText.text = new Date().toLocaleTimeString(Qt.locale(), "HH:mm")
            dateText.text = new Date().toLocaleDateString(Qt.locale(), "MMM d")
        }
    }
}
