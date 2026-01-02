import QtQuick
import QtQuick.Layouts
import milos.style
import milos.components
import "panels"

NeobrutalistWindow {
    id: settingsWindow

    width: 600
    height: 400
    title: "Milos Settings"

    visible: false

    property int currentPage: 0

    Row {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            width: 150
            height: parent.height
            color: Theme.secondaryColor()
            border.width: Theme.colors.outlineWidth
            border.color: Theme.colors.outline

            Column {
                anchors.fill: parent
                spacing: 0

                SettingsNavButton {
                    text: "Theme"
                    index: 0
                    currentPage: settingsWindow.currentPage
                }

                SettingsNavButton {
                    text: "Wallpaper"
                    index: 1
                    currentPage: settingsWindow.currentPage
                }

                SettingsNavButton {
                    text: "Display"
                    index: 2
                    currentPage: settingsWindow.currentPage
                }

                SettingsNavButton {
                    text: "Audio"
                    index: 3
                    currentPage: settingsWindow.currentPage
                }

                SettingsNavButton {
                    text: "Shortcuts"
                    index: 4
                    currentPage: settingsWindow.currentPage
                }

                SettingsNavButton {
                    text: "About"
                    index: 5
                    currentPage: settingsWindow.currentPage
                }
            }
        }

        Rectangle {
            width: parent.width - 150
            height: parent.height
            color: Theme.backgroundColor()

            StackLayout {
                anchors.fill: parent
                currentIndex: settingsWindow.currentPage

                ThemePanel {}
                WallpaperPanel {}
                DisplayPanel {}
                AudioPanel {}
                ShortcutsPanel {}
                AboutPanel {}
            }
        }
    }
}
