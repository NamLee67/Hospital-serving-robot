#include "ServerManager.h"

ServerManager::ServerManager(ushort port, QObject *parent)
    : QObject{parent}, _waitNumber(0)
{
    setupServer(port);
}

void ServerManager::notifyOtherClients(QString prevName, QString name)
{
    auto message = _protocol.setClientNameMessage(prevName, name);
    foreach (auto cl, _clients) {
        auto clientName = cl->property("clientName").toString();
        if (clientName != name) {
            cl->write(message);
        }
    }
}

void ServerManager::onTextForOtherClients(QString message, QString receiver, QString sender)
{
    auto msg = _protocol.textMessage(message, receiver);
    if (receiver == "All") {
        foreach (auto cl, _clients) {
            auto clientName = cl->property("clientName").toString();
            if (clientName != sender) {
                cl->write(msg);
            }
        }
    } else {
        foreach (auto cl, _clients) {
            auto clientName = cl->property("clientName").toString();
            if (clientName == receiver) {
                cl->write(msg);
                return;
            }
        }
    }
    emit textMessageReceived(message, receiver); // Notify server UI
}

void ServerManager::onGetWaitNumberRequest()
{
    _waitNumber++;
    qDebug() << "Server updating wait number to:" << _waitNumber;
    auto message = _protocol.getWaitNumberMessage(_waitNumber); // Use updated method
    foreach (auto cl, _clients) {
        cl->write(message);
    }
    emit waitNumberUpdated(_waitNumber); // Notify all clients
}

void ServerManager::onClientDataReceived()
{
    auto client = qobject_cast<QTcpSocket *>(sender());
    if (!client) return;

    auto data = client->readAll();
    ChatProtocol protocol;
    protocol.loadData(data);
    if (protocol.type() == ChatProtocol::GetWaitNumber) {
        onGetWaitNumberRequest(); // Trigger wait number update
    } else if (protocol.type() == ChatProtocol::Text) {
        auto message = protocol.message();
        auto receiver = protocol.receiver();
        auto sender = client->property("clientName").toString();
        onTextForOtherClients(message, receiver, sender);
    }
    // Thêm xử lý cho các type khác nếu cần (SetName, SetStatus, v.v.)
}

void ServerManager::newClientConnectionReceived()
{
    auto client = _server->nextPendingConnection();

    auto id = _clients.count() + 1;
    auto clientName = QString("Client %1").arg(id);
    client->setProperty("id", id);
    client->setProperty("clientName", clientName);

    connect(client, &QTcpSocket::disconnected, this, &ServerManager::onClientDisconnected);

    emit newClientConnected(client);

    if (id > 1) {
        auto message = _protocol.setConnectionACKMessage(clientName, _clients.keys());
        client->write(message);

        auto newClientMessage = _protocol.setNewClientMessage(clientName);
        foreach (auto cl, _clients) {
            cl->write(newClientMessage);
        }
    }
    _clients[clientName] = client;
}

void ServerManager::onClientDisconnected()
{
    auto client = qobject_cast<QTcpSocket *>(sender());
    auto clientName = client->property("clientName").toString();
    _clients.remove(clientName);
    auto message = _protocol.setClinetDisconnectedMessage(clientName);
    foreach (auto cl, _clients) {
        cl->write(message);
    }

    emit clientDisconnected(client);
}

void ServerManager::setupServer(ushort port)
{
    _server = new QTcpServer(this);
    connect(_server, &QTcpServer::newConnection, this, &ServerManager::newClientConnectionReceived);

    auto client = _server->nextPendingConnection();
    connect(client, &QTcpSocket::readyRead, this, &ServerManager::onClientDataReceived); // Connect to new slot

    _server->listen(QHostAddress::Any, port);
}
