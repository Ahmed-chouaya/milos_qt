#include "AudioService.h"
#include <QDebug>

AudioService::AudioService(QObject *parent)
    : QObject(parent)
{
}

void AudioService::setVolume(int value)
{
    m_volume = qBound(0, value, 100);
    emit volumeChanged();
    qDebug() << "Volume set to:" << m_volume;
}

void AudioService::setMuted(bool value)
{
    m_muted = value;
    emit mutedChanged();
    qDebug() << "Muted:" << m_muted;
}

void AudioService::nextTrack()
{
    qDebug() << "Next track";
}

void AudioService::previousTrack()
{
    qDebug() << "Previous track";
}

void AudioService::playPause()
{
    qDebug() << "Play/pause";
}
