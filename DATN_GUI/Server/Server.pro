QT       += core gui network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
    ChatProtocol.cpp \
    ClientChatWidget.cpp \
    ClientManager.cpp \
    ServerManager.cpp \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    ChatProtocol.h \
    ClientChatWidget.h \
    ClientManager.h \
    ServerManager.h \
    mainwindow.h

FORMS += \
    ClientChatWidget.ui \
    mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
