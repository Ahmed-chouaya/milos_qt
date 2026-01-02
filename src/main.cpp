#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "style/ThemeManager.h"
#include "services/AudioService.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setApplicationName("milos-qt");
    app.setOrganizationName("milos");

    ThemeManager *themeManager = new ThemeManager();
    AudioService *audioService = new AudioService();

    qmlRegisterSingletonType<ThemeManager>("milos.style", 1, 0, "ThemeManager", [themeManager](QQmlEngine*, QJSEngine*) -> QObject* {
        return themeManager;
    });

    qmlRegisterSingletonType<AudioService>("milos.services", 1, 0, "AudioService", [audioService](QQmlEngine*, QJSEngine*) -> QObject* {
        return audioService;
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
