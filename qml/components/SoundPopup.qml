import QtQuick
import milos.style
import milos.components

NeobrutalistCard {
    id: popup

    width: 220
    height: 140
    title: "Volume"

    visible: false

    function show(parentItem) {
        if (parentItem) {
            x = parentItem.x + parentItem.width - width + 48
            y = 48
        }
        visible = true
    }

    function hide() {
        visible = false
    }

    content: [
        Row {
            spacing: 8

            NeobrutalistButton {
                width: 32
                height: 24
                text: audioService.muted ? "🔇" : "🔊"
                fontSize: 12
                onClicked: audioService.muted = !audioService.muted
            }

            NeobrutalistSlider {
                value: audioService.volume
                from: 0
                to: 100
                width: 120
                onValueChanged: audioService.volume = value
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: audioService.volume + "%"
                font.family: "JetBrains Mono, monospace"
                font.pixelSize: 12
                color: Theme.textColor()
            }
        },

        Row {
            spacing: 8

            NeobrutalistButton {
                text: "⏮"
                onClicked: audioService.previousTrack()
            }

            NeobrutalistButton {
                text: "⏯"
                onClicked: audioService.playPause()
            }

            NeobrutalistButton {
                text: "⏭"
                onClicked: audioService.nextTrack()
            }
        },

        Text {
            text: audioService.currentTrack || "No media playing"
            font.family: "JetBrains Mono, monospace"
            font.pixelSize: 10
            color: Theme.textColor()
            elide: Text.ElideRight
            width: 200
        }
    ]
}
