#include "ClientManager.h"
#include <QDateTime>
#include <QDir>

ClientManager::ClientManager(QHostAddress ip, ushort port, QObject *parent)
    : QObject(parent), _ip(QHostAddress(ip)), _port(port)
{
    _socket = new QTcpSocket(this);
    setupClient();
}

ClientManager::ClientManager(QTcpSocket *client, QObject *parent)
    : QObject{parent},
    _socket(client)
{
    setupClient();
}

void ClientManager::connectToServer()
{
    _socket->connectToHost(_ip, _port);
}

void ClientManager::disconnectFromHost()
{
    _socket->disconnectFromHost();
}

void ClientManager::sendMessage(QString message)
{
    _socket->write(_protocol.textMessage(message, name()));
}

void ClientManager::sendName(QString name)
{
    _socket->write(_protocol.setNameMessage(name));
}

void ClientManager::sendStatus(ChatProtocol::Status status)
{
    _socket->write(_protocol.setStatusMessage(status));
}

QString ClientManager::name() const
{
    auto id = _socket->property("id").toInt();
    auto name = _protocol.name().length() > 0 ? _protocol.name() : QString("Client %1").arg(id);

    return name;
}

void ClientManager::sendIsTyping()
{
    _socket->write(_protocol.isTypingMessage());
}

void ClientManager::readyRead()
{
    auto data = _socket->readAll();
    _protocol.loadData(data);
    switch (_protocol.type()) {
    case ChatProtocol::Text:
        emit textMessageReceived(_protocol.message(), _protocol.receiver());
        break;
    case ChatProtocol::SetName:{
        auto prevName = _socket->property("clientName").toString();
        _socket->setProperty("clientName", name());
        emit nameChanged(prevName, name());
        break;
    }
    case ChatProtocol::SetStatus:
        emit statusChanged(_protocol.status());
        break;
    case ChatProtocol::IsTyping:
        emit isTyping();
        break;
//    case ChatProtocol::GetWaitNumber:
//        qDebug() << "Received wait number: " , _protocol.waitNumber();
//        emit onWaitNumberReceived(_protocol.waitNumber());
//        break;
    default:
        break;
    }
}

void ClientManager::setupClient()
{
    connect(_socket, &QTcpSocket::connected, this, &ClientManager::connected);
    connect(_socket, &QTcpSocket::disconnected, this, &ClientManager::disconnected);
    connect(_socket, &QTcpSocket::readyRead, this, &ClientManager::readyRead);
}

void ClientManager::requestWaitNumber()
{
    qDebug() << "Sending GetWaitNumber request";
    _socket->write(_protocol.getWaitNumberMessage());
}

