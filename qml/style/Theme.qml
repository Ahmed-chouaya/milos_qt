pragma Singleton

import QtQuick
import "." as Style

QtObject {
    property bool darkMode: false

    readonly property Style.Colors colors: Style.Colors {}

    function primaryColor() {
        return darkMode ? colors.darkPrimary : colors.lightPrimary
    }

    function secondaryColor() {
        return darkMode ? colors.darkSecondary : colors.lightSecondary
    }

    function backgroundColor() {
        return darkMode ? colors.darkBg : colors.lightBg
    }

    function textColor() {
        return darkMode ? colors.darkText : colors.lightText
    }
}
