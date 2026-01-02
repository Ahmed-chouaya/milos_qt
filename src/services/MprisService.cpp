#include "MprisService.h"
#include <QDebug>

MprisService::MprisService(QObject *parent)
    : QObject(parent)
{
}

void MprisService::play()
{
    qDebug() << "MPRIS play";
}

void MprisService::pause()
{
    qDebug() << "MPRIS pause";
}

void MprisService::playPause()
{
    qDebug() << "MPRIS play/pause";
}

void MprisService::next()
{
    qDebug() << "MPRIS next";
}

void MprisService::previous()
{
    qDebug() << "MPRIS previous";
}
