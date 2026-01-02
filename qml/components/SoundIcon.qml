import QtQuick
import milos.style

Rectangle {
    id: soundIcon

    width: 48
    height: 48

    color: "transparent"

    Text {
        id: volumeIcon
        anchors.centerIn: parent
        text: audioService.muted ? "🔇" : (audioService.volume > 66 ? "🔊" : (audioService.volume > 33 ? "🔉" : "🔈"))
        font.pixelSize: 18
        color: Theme.textColor()
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: soundPopup.show(soundIcon)
        onExited: soundPopup.hide()
    }

    SoundPopup {
        id: soundPopup
    }
}
