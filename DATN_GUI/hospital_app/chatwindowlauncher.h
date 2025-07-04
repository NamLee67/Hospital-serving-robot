#ifndef CHATWINDOWLAUNCHER_H
#define CHATWINDOWLAUNCHER_H

#include <QObject>
#include "mainwindow.h"

class chatwindowlauncher : public QObject
{
    Q_OBJECT
public:
    explicit chatwindowlauncher(QObject *parent = nullptr);
    Q_INVOKABLE void launchChatWindow(const QString &doctorName);
signals:

};

#endif // CHATWINDOWLAUNCHER_H
