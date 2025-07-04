#ifndef CHATPROTOCOL_H
#define CHATPROTOCOL_H

#include <QByteArray>
#include <QString>
#include <QStringList>
#include <QDataStream>
#include <QDebug>


class ChatProtocol
{
public:
    enum MessageType{
        Text,
        IsTyping,
        SetName,
        SetStatus,
        ClientName,
        ConnectionACK,
        NewClient,
        ClientDisconnected,
        GetWaitNumber,
        CurrentNumber,
        CurrentPerson

    };

    enum Status{
        None,
        Available,
        Away,
        Busy
    };

    ChatProtocol();

    QByteArray textMessage(QString message, QString receiver);
    QByteArray isTypingMessage();
    QByteArray setNameMessage(QString name);
    QByteArray setStatusMessage(Status status);
    QByteArray getWaitNumberMessage(int number = 0);
    QByteArray setCurrentNumberMessage(QString currentPerson);

    void loadData(QByteArray data);

    const QString &message() const;

    const QString &name() const;

    Status status() const;

    MessageType type() const;

    QString receiver() const;

    const QString &clientName() const;

    const QString &prevName() const;

    const QStringList &clientsName() const;

    const QString &myName() const;

    int waitNumber() const;

    const QString &waitPerson() const;

private:
    QByteArray getData(MessageType type, QString data = "", int number = 0);

    MessageType _type;
    QString _message;
    QString _name;
    Status _status;
    QString _receiver;
    QString _clientName;
    QString _prevName;
    QStringList _clientsName;
    QString _myName;
    int _waitNumber;
    QString _waitPerson;
};

#endif // CHATPROTOCOL_H
