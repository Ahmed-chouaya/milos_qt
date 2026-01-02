#include <QTest>
#include "style/ThemeManager.h"

class TestThemeManager : public QObject
{
    Q_OBJECT

private slots:
    void testDarkModeToggle()
    {
        ThemeManager tm;
        QVERIFY(tm.darkMode() == false);
        tm.setDarkMode(true);
        QVERIFY(tm.darkMode() == true);
    }

    void testColors()
    {
        ThemeManager tm;
        // Light mode
        tm.setDarkMode(false);
        QVERIFY(tm.primary().name() == "#ffe500");
        QVERIFY(tm.background().name() == "#f5f5f5");

        // Dark mode
        tm.setDarkMode(true);
        QVERIFY(tm.primary().name() == "#39ff14");
        QVERIFY(tm.background().name() == "#1a1a1a");
    }
};

QTEST_MAIN(TestThemeManager)
#include "test_theme.moc"
