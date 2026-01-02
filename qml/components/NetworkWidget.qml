import QtQuick
import milos.style

Rectangle {
    width: 48
    height: 48

    color: "transparent"

    Text {
        id: networkText
        anchors.centerIn: parent
        text: networkService.connected ? "📶" : "❌"
        font.pixelSize: 16
        color: Theme.textColor()
    }
}
