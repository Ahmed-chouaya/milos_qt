import QtQuick
import QtQuick.Window
import milos.style

Window {
    id: window

    color: Theme.backgroundColor()
    border.width: Theme.colors.outlineWidth
    border.color: Theme.colors.outline

    readonly property int shadowOffset: Theme.colors.shadowOffset

    layer.enabled: true

    layer.effect: DropShadow {
        horizontalOffset: 0
        verticalOffset: window.shadowOffset
        color: Theme.colors.outline
        samples: 0
    }

    flags: Qt.Window | Qt.FramelessWindowHint

    Column {
        anchors.fill: parent

        Row {
            id: titleBar
            width: parent.width
            height: 32

            MouseArea {
                anchors.fill: parent
                onPressed: window.startSystemMove()
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                x: 8
                text: window.title
                font.family: "JetBrains Mono, monospace"
                font.weight: Font.Bold
                color: Theme.textColor()
            }

            NeobrutalistButton {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                width: 32
                height: 24
                text: "X"
                color: "#FF6B6B"
                fontSize: 12
                onClicked: window.close()
            }
        }

        Rectangle {
            width: parent.width
            height: parent.height - titleBar.height
            color: "transparent"
        }
    }
}
