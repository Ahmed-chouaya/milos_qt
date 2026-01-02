#ifndef AUDIOSERVICE_H
#define AUDIOSERVICE_H

#include <QObject>
#include <QMap>

class AudioService : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int volume READ volume NOTIFY volumeChanged)
    Q_PROPERTY(bool muted READ muted NOTIFY mutedChanged)
    Q_PROPERTY(QString currentPlayer READ currentPlayer NOTIFY currentPlayerChanged)
    Q_PROPERTY(QString currentTrack READ currentTrack NOTIFY currentTrackChanged)

public:
    explicit AudioService(QObject *parent = nullptr);

    int volume() const { return m_volume; }
    bool muted() const { return m_muted; }
    QString currentPlayer() const { return m_currentPlayer; }
    QString currentTrack() const { return m_currentTrack; }

public slots:
    void setVolume(int value);
    void setMuted(bool value);
    void nextTrack();
    void previousTrack();
    void playPause();

signals:
    void volumeChanged();
    void mutedChanged();
    void currentPlayerChanged();
    void currentTrackChanged();

private:
    int m_volume = 50;
    bool m_muted = false;
    QString m_currentPlayer;
    QString m_currentTrack;
};

#endif // AUDIOSERVICE_H
