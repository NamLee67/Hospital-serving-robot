#ifndef CHATPROTOCOL_H
#define CHATPROTOCOL_H

#include <QByteArray>
#include <QString>
#include <QDataStream>



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
        GetWaitNumber
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

    QByteArray setClientNameMessage(QString prevName, QString name);
    QByteArray setConnectionACKMessage(QString clientName, QStringList otherClients);
    QByteArray setNewClientMessage(QString clientName);
    QByteArray setClinetDisconnectedMessage(QString clientName);
    QByteArray getWaitNumberMessage(int number = 0); // Modified to accept number parameter

    void loadData(QByteArray data);

    const QString &message() const;

    const QString &name() const;

    Status status() const;

    MessageType type() const;

    const QString &receiver() const;

    int waitNumber() const; // New method to get the wait number

private:
    QByteArray getData(MessageType type, QString data);
    QByteArray getDataNew(MessageType type, QString data = "", int number = 0); // Updated to handle number

    MessageType _type;
    QString _message;
    QString _name;
    Status _status;
    QString _receiver;
    int _waitNumber; // New field for wait number

};

#endif // CHATPROTOCOL_H
