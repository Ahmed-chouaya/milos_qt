import QtQuick
import milos.style

Rectangle {
    property string text: ""
    property string toolTip: ""
    signal clicked()

    width: 48
    height: 48

    color: Theme.secondaryColor()
    border.width: Theme.colors.outlineWidth
    border.color: Theme.colors.outline

    Text {
        anchors.centerIn: parent
        text: parent.text
        font.pixelSize: 18
        font.weight: Font.Bold
        color: Theme.textColor()
    }

    MouseArea {
        anchors.fill: parent
        onClicked: parent.clicked()

        onEntered: parent.color = Theme.primaryColor()
        onExited: parent.color = Theme.secondaryColor()
    }
}
