#include "SystemMonitor.h"
#include <QFile>
#include <QTextStream>
#include <QDebug>

SystemMonitor::SystemMonitor(QObject *parent)
    : QObject(parent)
{
    connect(&m_timer, &QTimer::timeout, this, &SystemMonitor::updateStats);
    m_timer.start(2000);
}

void SystemMonitor::updateStats()
{
    QFile cpuFile("/proc/stat");
    if (cpuFile.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QTextStream in(&cpuFile);
        QString line = in.readLine();
        m_cpuUsage = qrand() % 100;
        cpuFile.close();
        emit cpuUsageChanged();
    }

    QFile memFile("/proc/meminfo");
    if (memFile.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QTextStream in(&memFile);
        m_memoryUsage = qrand() % 100;
        memFile.close();
        emit memoryUsageChanged();
    }

    m_batteryLevel = 85;
    m_charging = false;
    m_batteryIcon = "🔋";
    emit batteryLevelChanged();
    emit chargingChanged();
    emit batteryIconChanged();
}
