import QtQuick
import milos.style
import milos.components

NeobrutalistCard {
    title: "System Monitor"

    content: [
        Row {
            spacing: 16

            Column {
                Text {
                    text: "CPU"
                    font.family: "JetBrains Mono, monospace"
                    font.pixelSize: 12
                    font.weight: Font.Bold
                    color: Theme.textColor()
                }

                Text {
                    text: systemMonitor.cpuUsage + "%"
                    font.family: "JetBrains Mono, monospace"
                    font.pixelSize: 24
                    font.weight: Font.Bold
                    color: Theme.primaryColor()
                }
            }

            Column {
                Text {
                    text: "Memory"
                    font.family: "JetBrains Mono, monospace"
                    font.pixelSize: 12
                    font.weight: Font.Bold
                    color: Theme.textColor()
                }

                Text {
                    text: systemMonitor.memoryUsage + "%"
                    font.family: "JetBrains Mono, monospace"
                    font.pixelSize: 24
                    font.weight: Font.Bold
                    color: Theme.secondaryColor()
                }
            }
        }
    ]
}
