#include "ThemeManager.h"

ThemeManager::ThemeManager(QObject *parent)
    : QObject(parent)
{
}

void ThemeManager::setDarkMode(bool value)
{
    if (m_darkMode != value) {
        m_darkMode = value;
        emit darkModeChanged();
        emit themeChanged();
    }
}
