#include "NetworkService.h"
#include <QTimer>
#include <QDebug>

NetworkService::NetworkService(QObject *parent)
    : QObject(parent)
{
    QTimer::singleShot(1000, this, &NetworkService::updateStatus);
}

void NetworkService::updateStatus()
{
    m_connected = true;
    m_signalStrength = 75;
    emit connectedChanged();
    emit signalStrengthChanged();
    emit ssidChanged();
    emit ipAddressChanged();
}
