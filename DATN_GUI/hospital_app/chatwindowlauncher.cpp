#include "chatwindowlauncher.h"
#include <QApplication>

chatwindowlauncher::chatwindowlauncher(QObject *parent)
    : QObject{parent}
{

}
void chatwindowlauncher::launchChatWindow(const QString &doctorName)
{
    qDebug() << "chat window is show: " << doctorName;
    if (QApplication::instance())
    {
        MainWindow *maiWindow = new MainWindow();
        maiWindow->setWindowTitle("chat with " + doctorName);
        maiWindow->setWindowFlags(Qt::Window | Qt::WindowStaysOnTopHint);
        maiWindow->show();
        maiWindow->raise();
        maiWindow->activateWindow();
    } else {
        qDebug() <<"Error : QApplication is null";
    }

}
