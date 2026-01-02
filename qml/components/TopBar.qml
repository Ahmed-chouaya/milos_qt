import QtQuick
import milos.style
import milos.components

Rectangle {
    id: topBar

    property int barHeight: 48
    width: Screen.width
    height: barHeight

    color: Theme.primaryColor()
    border.width: Theme.colors.outlineWidth
    border.color: Theme.colors.outline

    readonly property int shadowOffset: Theme.colors.shadowOffset

    layer.enabled: true

    layer.effect: DropShadow {
        horizontalOffset: 0
        verticalOffset: shadowOffset
        color: Theme.colors.outline
        samples: 0
    }

    Row {
        anchors.fill: parent
        spacing: 0

        TopBarButton {
            text: "M"
            toolTip: "Menu"
        }

        TopBarButton {
            text: "◻"
            toolTip: "Windows"
        }

        Item { width: 8; height: topBar.height }

        ClockWidget {}

        Item { width: 8; height: topBar.height }

        BatteryWidget {}

        NetworkWidget {}

        Item { width: 200; height: topBar.height }

        TopBarButton {
            text: "🔕"
            toolTip: "Do Not Disturb"
        }

        SoundIcon {}

        SystemTray {}
    }
}
