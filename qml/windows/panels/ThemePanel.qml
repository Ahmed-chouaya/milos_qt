import QtQuick
import milos.style
import milos.components

Column {
    spacing: 16

    Text {
        text: "Theme Settings"
        font.family: "JetBrains Mono, monospace"
        font.pixelSize: 20
        font.weight: Font.Bold
        color: Theme.textColor()
    }

    Row {
        spacing: 8

        NeobrutalistButton {
            text: "Light Mode"
            color: Theme.colors.lightPrimary
            onClicked: Theme.darkMode = false
        }

        NeobrutalistButton {
            text: "Dark Mode"
            color: Theme.colors.darkPrimary
            onClicked: Theme.darkMode = true
        }
    }

    Text {
        text: "Current: " + (Theme.darkMode ? "Dark" : "Light")
        font.family: "JetBrains Mono, monospace"
        color: Theme.textColor()
    }
}
