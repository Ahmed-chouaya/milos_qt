import milos
import QtQuick
import QtQuick.Window

Window {
    width: Screen.width
    height: Screen.height
    visible: true
    title: "milos-qt"
    color: Theme.backgroundColor()

    TopBar {
        onSettingsRequested: {
            settingsWindow.visible = true
            settingsWindow.requestActivate()
        }
    }

    SettingsWindow {
        id: settingsWindow
        visible: false
    }
}
