pragma Singleton

import QtQuick

QtObject {
    // Neobrutalism color constants
    readonly property color outline: "#000000"
    readonly property int outlineWidth: 3

    // Light theme
    readonly property color lightBg: "#F5F5F5"
    readonly property color lightPrimary: "#FFE500"   // Yellow
    readonly property color lightSecondary: "#00FFFF" // Cyan
    readonly property color lightAccent: "#FF6B35"    // Orange
    readonly property color lightText: "#000000"

    // Dark theme
    readonly property color darkBg: "#1A1A1A"
    readonly property color darkPrimary: "#39FF14"    // Neon Green
    readonly property color darkSecondary: "#FF6B9D"  // Hot Pink
    readonly property color darkAccent: "#BF40BF"     // Purple
    readonly property color darkText: "#FFFFFF"

    // Shadow (hard, no blur)
    readonly property int shadowOffset: 4
}
