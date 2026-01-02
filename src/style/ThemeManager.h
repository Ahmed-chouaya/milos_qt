#ifndef THEMEMANAGER_H
#define THEMEMANAGER_H

#include <QObject>
#include <QColor>
#include <QString>

class ThemeManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool darkMode READ darkMode WRITE setDarkMode NOTIFY darkModeChanged)
    Q_PROPERTY(QColor primary READ primary NOTIFY themeChanged)
    Q_PROPERTY(QColor secondary READ secondary NOTIFY themeChanged)
    Q_PROPERTY(QColor background READ background NOTIFY themeChanged)
    Q_PROPERTY(QColor outline READ outline NOTIFY themeChanged)
    Q_PROPERTY(int outlineWidth READ outlineWidth NOTIFY themeChanged)

public:
    explicit ThemeManager(QObject *parent = nullptr);

    bool darkMode() const { return m_darkMode; }
    void setDarkMode(bool value);

    QColor primary() const { return m_darkMode ? m_primaryDark : m_primaryLight; }
    QColor secondary() const { return m_darkMode ? m_secondaryDark : m_secondaryLight; }
    QColor background() const { return m_darkMode ? m_backgroundDark : m_backgroundLight; }
    QColor outline() const { return QColor("#000000"); }
    int outlineWidth() const { return 3; }

signals:
    void darkModeChanged();
    void themeChanged();

private:
    bool m_darkMode = false;

    // Light theme colors
    const QColor m_primaryLight = QColor("#FFE500");   // Bright Yellow
    const QColor m_secondaryLight = QColor("#00FFFF"); // Cyan

    // Dark theme colors
    const QColor m_primaryDark = QColor("#39FF14");    // Neon Green
    const QColor m_secondaryDark = QColor("#FF6B9D");  // Hot Pink

    const QColor m_backgroundDark = QColor("#1A1A1A");
};

#endif // THEMEMANAGER_H
