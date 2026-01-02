#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "style/ThemeManager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setApplicationName("milos-qt");
    app.setOrganizationName("milos");

    qmlRegisterSingletonType<ThemeManager>("milos.style", 1, 0, "ThemeManager", [](QQmlEngine*, QJSEngine*) -> QObject* {
        return new ThemeManager();
    });

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(1); },
        Qt::QueuedConnection
    );

    engine.loadFromModule("milos", "main");

    return app.exec();
}
