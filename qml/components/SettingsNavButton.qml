import QtQuick
import milos.style

Rectangle {
    property string text: ""
    property int index: 0
    property int currentPage: 0
    signal clicked()

    width: parent.width
    height: 40

    color: currentPage === index ? Theme.primaryColor() : "transparent"
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
            currentPage = index
            parent.clicked()
        }
    }
}
