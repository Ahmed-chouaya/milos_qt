#ifndef SYSTEMMONITOR_H
#define SYSTEMMONITOR_H

#include <QObject>
#include <QTimer>

class SystemMonitor : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int cpuUsage READ cpuUsage NOTIFY cpuUsageChanged)
    Q_PROPERTY(int memoryUsage READ memoryUsage NOTIFY memoryUsageChanged)
    Q_PROPERTY(int batteryLevel READ batteryLevel NOTIFY batteryLevelChanged)
    Q_PROPERTY(bool charging READ charging NOTIFY chargingChanged)
    Q_PROPERTY(QString batteryIcon READ batteryIcon NOTIFY batteryIconChanged)

public:
    explicit SystemMonitor(QObject *parent = nullptr);

    int cpuUsage() const { return m_cpuUsage; }
    int memoryUsage() const { return m_memoryUsage; }
    int batteryLevel() const { return m_batteryLevel; }
    bool charging() const { return m_charging; }
    QString batteryIcon() const { return m_batteryIcon; }

signals:
    void cpuUsageChanged();
    void memoryUsageChanged();
    void batteryLevelChanged();
    void chargingChanged();
    void batteryIconChanged();

private slots:
    void updateStats();

private:
    int m_cpuUsage = 0;
    int m_memoryUsage = 0;
    int m_batteryLevel = 100;
    bool m_charging = false;
    QString m_batteryIcon = "🔋";

    QTimer m_timer;
};
#endif // SYSTEMMONITOR_H
