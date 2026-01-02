import QtQuick
import milos.style
import milos.components

Column {
    spacing: 16

    Text {
        text: "Display Settings"
        font.family: "JetBrains Mono, monospace"
        font.pixelSize: 20
        font.weight: Font.Bold
        color: Theme.textColor()
    }

    Text {
        text: "Brightness"
        font.family: "JetBrains Mono, monospace"
        color: Theme.textColor()
    }

    NeobrutalistSlider {
        width: 200
    }
}
