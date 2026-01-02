import QtQuick
import milos.style
import milos.components

NeobrutalistCard {
    id: popup

    width: 200
    height: 120
    title: "Volume"

    x: parent.x + 48
    y: topBar.height

    property bool open: false

    function open() {
        open = true
        visible = true
    }

    function close() {
        open = false
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
            width: 180
        }
    ]
}
