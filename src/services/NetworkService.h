#ifndef NETWORKSERVICE_H
#define NETWORKSERVICE_H

#include <QObject>

class NetworkService : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool connected READ connected NOTIFY connectedChanged)
    Q_PROPERTY(QString ssid READ ssid NOTIFY ssidChanged)
    Q_PROPERTY(int signalStrength READ signalStrength NOTIFY signalStrengthChanged)
    Q_PROPERTY(QString ipAddress READ ipAddress NOTIFY ipAddressChanged)

public:
    explicit NetworkService(QObject *parent = nullptr);

    bool connected() const { return m_connected; }
    QString ssid() const { return m_ssid; }
    int signalStrength() const { return m_signalStrength; }
    QString ipAddress() const { return m_ipAddress; }

signals:
    void connectedChanged();
    void ssidChanged();
    void signalStrengthChanged();
    void ipAddressChanged();

private slots:
    void updateStatus();

private:
    bool m_connected = true;
    QString m_ssid = "HomeNetwork";
    int m_signalStrength = 80;
    QString m_ipAddress = "192.168.1.100";
};
#endif // NETWORKSERVICE_H
