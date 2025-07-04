#include "chatprotocol.h"
#include <QIODevice>


ChatProtocol::ChatProtocol(): _waitNumber(0)
{

}

QByteArray ChatProtocol::textMessage(QString message, QString receiver)
{
    QByteArray ba;
    QDataStream out(&ba, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_12);
    out << Text << receiver << message;
    return ba;
}

QByteArray ChatProtocol::isTypingMessage()
{
    return getData(IsTyping, "");
}

QByteArray ChatProtocol::setNameMessage(QString name)
{
    return getData(SetName, name);
}

QByteArray ChatProtocol::setStatusMessage(Status status)
{
    QByteArray ba;
    QDataStream out(&ba, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_12);
    out << SetStatus << status;
    return ba;
}

QByteArray ChatProtocol::getWaitNumberMessage(int number)
{
//    return getData(GetWaitNumber);
    QByteArray ba;
    QDataStream out(&ba, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_12);
    out << GetWaitNumber << number;
    return ba;
}

QByteArray ChatProtocol::setCurrentNumberMessage(QString Person)
{
    QByteArray ba;
    QDataStream out(&ba, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_12);
    out << CurrentPerson << Person;
    return ba;
}

void ChatProtocol::loadData(QByteArray data)
{
    QDataStream in(&data, QIODevice::ReadOnly);
    in.setVersion(QDataStream::Qt_5_12);
    qint32 type;
    in >> type;
    _type = static_cast<MessageType>(type); // Cast integer to MessageType
    switch (_type) {
    case Text:
        in >> _receiver >> _message;
        break;
    case SetName:
        in >> _name;
        break;
    case SetStatus:
        qint32 status;
        in >> status;
        _status = static_cast<Status>(status); // Cast integer to Status
        break;
    case ClientName:
        in >> _prevName >> _clientName;
        break;
    case ClientDisconnected:
        in >> _clientName;
        break;
    case ConnectionACK:
        in >> _myName >> _clientsName;
        break;
    case GetWaitNumber:
        qDebug() << "load data from wait number";
        in >> _waitNumber;
        break;
    case CurrentPerson:
        qDebug() << "load data from wait person";
        in >> _waitPerson;
        break;
    default:
        break;
    }
}

QByteArray ChatProtocol::getData(MessageType type, QString data, int number)
{
    QByteArray ba;
    QDataStream out(&ba, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_12);
    out << type << data << number;
    return ba;
}

const QString &ChatProtocol::myName() const
{
    return _myName;
}

const QStringList &ChatProtocol::clientsName() const
{
    return _clientsName;
}

const QString &ChatProtocol::prevName() const
{
    return _prevName;
}

const QString &ChatProtocol::clientName() const
{
    return _clientName;
}

QString ChatProtocol::receiver() const
{
    return _receiver;
}

ChatProtocol::MessageType ChatProtocol::type() const
{
    return _type;
}

ChatProtocol::Status ChatProtocol::status() const
{
    return _status;
}

const QString &ChatProtocol::name() const
{
    return _name;
}

const QString &ChatProtocol::message() const
{
    return _message;
}

int ChatProtocol::waitNumber() const
{
    return _waitNumber;
}

const QString &ChatProtocol::waitPerson() const
{
    return _waitPerson;
}
