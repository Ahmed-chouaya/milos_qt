import QtQuick
import milos.style

Rectangle {
    id: card

    property string title: ""
    property alias content: contentArea.children

    implicitWidth: 200
    implicitHeight: Math.max(100, contentArea.height + 48)

    color: Theme.backgroundColor()
    border.width: Theme.colors.outlineWidth
    border.color: Theme.colors.outline

    readonly property int shadowOffset: Theme.colors.shadowOffset

    layer.enabled: true

    layer.effect: DropShadow {
        horizontalOffset: 0
        verticalOffset: card.shadowOffset
        color: Theme.colors.outline
        samples: 0
    }

    Column {
        anchors.fill: parent
        spacing: 8

        Rectangle {
            width: parent.width
            height: 24
            color: Theme.primaryColor()
            border.width: Theme.colors.outlineWidth
            border.color: Theme.colors.outline

            Text {
                anchors.verticalCenter: parent.verticalCenter
                x: 8
                text: card.title
                font.family: "JetBrains Mono, monospace"
                font.weight: Font.Bold
                font.pixelSize: 12
                color: Theme.textColor()
            }
        }

        Rectangle {
            id: contentArea
            width: parent.width - 16
            x: 8
            height: card.height - 48
            color: "transparent"
        }
    }
}
