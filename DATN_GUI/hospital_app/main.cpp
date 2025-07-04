#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "lightcontroller.h"
#include "chatwindowlauncher.h"
#include <QApplication>
#include "clientmanager.h"
//#include "NavigationSender.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

//    NavigationSender* navigationSender = new NavigationSender(&app);
//    engine.rootContext()->setContextProperty("navigationSender", navigationSender);


    chatwindowlauncher *launcher = new chatwindowlauncher(&app);
    engine.rootContext()->setContextProperty("mainWindowLauncher", launcher);
    qDebug() << "Set Chat Window context property";

    // Setup ClientManager for TCP communication
//    ClientManager *clientManager = new ClientManager("192.168.100.68",4500, &app); // Replace IP/port as needed "192.168.100.67"
    ClientManager *clientManager = new ClientManager(QHostAddress::LocalHost,4500, &app);
    engine.rootContext()->setContextProperty("clientManager", clientManager);
    qDebug() << "Set clientManager context property";
    clientManager->connectToServer();

    lightcontroller lightCtr;
    engine.rootContext()->setContextProperty("lightController", &lightCtr);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [&, url, launcher](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl){

            QCoreApplication::exit(-1);
        } else if(obj && url == objUrl){
            qDebug() << "Reset chatWindowLauncher on root object";
            obj->setProperty("mainWindowLauncher", QVariant::fromValue(launcher));
        }
    }, Qt::QueuedConnection);
    engine.load(url);

    QObject::connect(&app, &QApplication::aboutToQuit, [launcher, clientManager](){
        delete launcher;
        delete clientManager;
    });

    return app.exec();
}
