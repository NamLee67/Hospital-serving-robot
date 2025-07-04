#include "ClientChatWidget.h"
#include "ui_ClientChatWidget.h"
#include "ServerManager.h"
#include <QMessageBox>
#include <QDesktopServices>

ClientChatWidget::ClientChatWidget(QTcpSocket *client, QWidget *parent) :
    QWidget(parent),
    ui(new Ui::ClientChatWidget)
{
    ui->setupUi(this);
    _client = new ClientManager(client, this);
//    connect(_client, &QTcpSocket::readyRead, this, &ClientChatWidget::dataReceived);
    connect(_client, &ClientManager::disconnected, this, &ClientChatWidget::clientDisconnected);
    connect(_client, &ClientManager::textMessageReceived, this, &ClientChatWidget::textMessageReceived);
    connect(_client, &ClientManager::isTyping, this, &ClientChatWidget::onTyping);
    connect(_client, &ClientManager::nameChanged, this, &ClientChatWidget::onClientNameChanged);
    connect(_client, &ClientManager::statusChanged, this, &ClientChatWidget::statusChanged);
    connect(ui->lnMessage, &QLineEdit::textChanged, _client, &ClientManager::sendIsTyping);

//    ServerManager *serverManager = qobject_cast<ServerManager *>(parent);
//    if (serverManager) {
//        connect(serverManager, &ServerManager::textMessageReceived, this, &ClientChatWidget::textMessageReceived);
//        qDebug() << "Connected textMessageReceived signal in ClientChatWidget";
//    } else {
//        qDebug() << "Failed to connect: Parent is not ServerManager";
//    }
}

//void ClientChatWidget::textMessageReceived(QString message, QString receiver, QString sender)
//{
//    if (!message.isEmpty() && (receiver == "Server" || receiver == "All")) {
//        ui->lstMessages->addItem(QString("%1: %2").arg(sender, message));
//        qDebug() << "Added to lstMessages:" << sender << ": " << message;
//    }
//}

void ClientChatWidget::disconnect()
{
    _client->disconnectFromHost();
}

ClientChatWidget::~ClientChatWidget()
{
    delete ui;
}

void ClientChatWidget::clientDisconnected()
{
    ui->wdgSendMessage->setEnabled(false);
}

void ClientChatWidget::on_btnSend_clicked()
{
    auto message = ui->lnMessage->text().trimmed();
    if (message.isEmpty()) {
            qDebug() << "Warning: Empty message not sent";
            return;
        }
    _client->sendMessage(message);
    ui->lnMessage->setText("");
    ui->lstMessages->addItem(message);
}

void ClientChatWidget::textMessageReceived(QString message, QString receiver)
{
    if (receiver == "Server" || receiver == "All") {
        ui->lstMessages->addItem(message);
    }
    if(receiver != "Server"){
        emit textForOtherClients(message, receiver, _client->name());
    }
}

void ClientChatWidget::onTyping()
{
    emit isTyping(QString("%1 is typing...").arg(_client->name()));
}

void ClientChatWidget::onClientNameChanged(QString prevName, QString name)
{
    emit clientNameChanged(prevName, name);
}

