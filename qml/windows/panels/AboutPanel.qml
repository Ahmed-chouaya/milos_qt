import QtQuick
import milos.style
import milos.components

Column {
    spacing: 16

    Text {
        text: "Milos-QT"
        font.family: "JetBrains Mono, monospace"
        font.pixelSize: 24
        font.weight: Font.Bold
        color: Theme.textColor()
    }

    Text {
        text: "Version 0.1.0"
        font.family: "JetBrains Mono, monospace"
        font.pixelSize: 14
        color: Theme.textColor()
    }

    Text {
        text: "Neobrutalist Qt6 Desktop for NixOS"
        font.family: "JetBrains Mono, monospace"
        color: Theme.textColor()
    }

    Text {
        text: "Built with Qt " + Qt.version.major + "." + Qt.version.minor
        font.family: "JetBrains Mono, monospace"
        font.pixelSize: 10
        color: Theme.textColor()
    }
}
