#ifndef FSOUNDALIB_H
#define FSOUNDALIB_H

#include <QObject>
#include "../Puyolib/frontend.h"

class GameAudio;

class FSoundAlib : public ppvs::fsound, public QObject
{
public:
    FSoundAlib(const QString &fn, GameAudio *audio, QObject *parent);
    ~FSoundAlib();

    void play();
    void stop();

private:
    QString fn;
    GameAudio *audio;
    bool error;
};


#endif // FSOUNDALIB_H
