import QtQuick
import milos.style
import milos.components

Column {
    spacing: 16

    Text {
        text: "Audio Settings"
        font.family: "JetBrains Mono, monospace"
        font.pixelSize: 20
        font.weight: Font.Bold
        color: Theme.textColor()
    }

    Text {
        text: "Volume: " + audioService.volume + "%"
        font.family: "JetBrains Mono, monospace"
        color: Theme.textColor()
    }

    NeobrutalistSlider {
        value: audioService.volume
        from: 0
        to: 100
        width: 200
        onValueChanged: audioService.volume = value
    }
}
