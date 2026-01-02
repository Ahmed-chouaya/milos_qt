#ifndef MPRISSERVICE_H
#define MPRISSERVICE_H

#include <QObject>
#include <QDBusInterface>

class MprisService : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString playerName READ playerName NOTIFY playerNameChanged)
    Q_PROPERTY(QString trackTitle READ trackTitle NOTIFY trackTitleChanged)
    Q_PROPERTY(QString trackArtist READ trackArtist NOTIFY trackArtistChanged)
    Q_PROPERTY(bool playing READ playing NOTIFY playingChanged)

public:
    explicit MprisService(QObject *parent = nullptr);

    QString playerName() const { return m_playerName; }
    QString trackTitle() const { return m_trackTitle; }
    QString trackArtist() const { return m_trackArtist; }
    bool playing() const { return m_playing; }

public slots:
    void play();
    void pause();
    void playPause();
    void next();
    void previous();

signals:
    void playerNameChanged();
    void trackTitleChanged();
    void trackArtistChanged();
    void playingChanged();

private:
    QString m_playerName;
    QString m_trackTitle;
    QString m_trackArtist;
    bool m_playing = false;
};
#endif // MPRISSERVICE_H
