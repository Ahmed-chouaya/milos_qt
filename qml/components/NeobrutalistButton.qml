import QtQuick
import milos.style

Rectangle {
    id: button

    property string text: ""
    property color color: Theme.primaryColor()
    property alias fontSize: label.font.pixelSize

    implicitWidth: label.contentWidth + 24
    implicitHeight: label.contentHeight + 16

    color: button.color
    border.width: Theme.colors.outlineWidth
    border.color: Theme.colors.outline

    readonly property int shadowOffset: Theme.colors.shadowOffset

    layer.enabled: true

    Text {
        id: label
        anchors.centerIn: parent
        text: button.text
        font.family: "JetBrains Mono, monospace"
        font.weight: Font.Bold
        font.pixelSize: 14
        color: Theme.textColor()
    }

    MouseArea {
        anchors.fill: parent
        onClicked: button.clicked()

        onPressed: {
            button.color = Qt.darker(button.color, 1.1)
        }
        onReleased: {
            button.color = Theme.primaryColor()
        }
    }

    layer.effect: DropShadow {
        horizontalOffset: 0
        verticalOffset: button.shadowOffset
        color: Theme.colors.outline
        samples: 0
    }

    signal clicked()
}
