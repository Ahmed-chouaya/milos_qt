import QtQuick
import milos.style

Rectangle {
    property string text: ""
    property int index: 0
    signal clicked()

    width: parent.width
    height: 40

    color: parent.parent.currentIndex === index ? Theme.primaryColor() : "transparent"
    border.width: Theme.colors.outlineWidth
    border.color: Theme.colors.outline

    Text {
        anchors.centerIn: parent
        text: parent.text
        font.family: "JetBrains Mono, monospace"
        font.weight: Font.Bold
        color: Theme.textColor()
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            settingsWindow.currentPage = index
            parent.clicked()
        }
    }
}
