import QtQuick
import milos.style

Rectangle {
    id: slider

    property real value: 0
    property real from: 0
    property real to: 100
    property int orientation: Qt.Horizontal
    property color trackColor: Theme.primaryColor()

    implicitWidth: orientation === Qt.Horizontal ? 200 : 24
    implicitHeight: orientation === Qt.Horizontal ? 24 : 200

    color: Theme.backgroundColor()
    border.width: Theme.colors.outlineWidth
    border.color: Theme.colors.outline

    readonly property int shadowOffset: Theme.colors.shadowOffset
    readonly property int thumbSize: 24

    Rectangle {
        id: track
        anchors.fill: parent
        anchors.margins: (parent.height - thumbSize) / 2
        color: slider.trackColor
        border.width: Theme.colors.outlineWidth
        border.color: Theme.colors.outline

        Rectangle {
            id: thumb
            width: track.thumbSize
            height: track.thumbSize
            color: Theme.secondaryColor()
            border.width: Theme.colors.outlineWidth
            border.color: Theme.colors.outline

            anchors.verticalCenter: parent.verticalCenter
            x: (slider.value - slider.from) / (slider.to - slider.from) * (parent.width - width)

            layer.enabled: true

            layer.effect: DropShadow {
                horizontalOffset: 0
                verticalOffset: slider.shadowOffset
                color: Theme.colors.outline
                samples: 0
            }
        }

        layer.enabled: true

        layer.effect: DropShadow {
            horizontalOffset: 0
            verticalOffset: slider.shadowOffset
            color: Theme.colors.outline
            samples: 0
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            var pos = orientation === Qt.Horizontal ? mouseX : mouseY
            var maxPos = orientation === Qt.Horizontal ? width : height
            slider.value = from + (pos / maxPos) * (to - from)
        }
    }
}
