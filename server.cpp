#include "server.h"

Server::Server(QObject *parent)
    : QObject{parent}
{
    //get self ip
    QString localHostName = QHostInfo::localHostName();
    QHostInfo info = QHostInfo::fromName(localHostName);

    foreach(QHostAddress address,info.addresses()){
        if(address.protocol() == QAbstractSocket::IPv4Protocol){
            this->ip=address.toString();
        }
    }
    qDebug()<<this->ip;
}

const QString &Server::getIp() const
{
    return ip;
}

void Server::setIp(const QString &newIp)
{
    if (ip == newIp)
        return;
    ip = newIp;
    emit ipChanged();
}

void Server::portSlot(QString s)
{
    port = s.toUShort();
    if(port == 0){
        qDebug()<<"port error!";
    }
    qDebug()<<__FUNCTION__<<"  "<<port;

    tcpserver = new QTcpServer(this);
    if(!tcpserver->listen(QHostAddress::Any,port)){
        qDebug()<<tcpserver->errorString();
        return;
    }


    connect(tcpserver,SIGNAL(newConnection()),this,SLOT(sendMessage()));
    qDebug()<<"server start";
}

void Server::sendMessage()
{
    QByteArray block;
    QDataStream out(&block,QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_DefaultCompiledVersion);
    out<<(quint16)0;
    out<<QString("Server success");
    out.device()->seek(0);
    out<<(quint16)(block.size()-sizeof (quint16));

    clientConnection=tcpserver->nextPendingConnection();
    connect(clientConnection,SIGNAL(readyRead()),this,SLOT(readMessage()));
    clientConnection->write(block);
}

void Server::readMessage()
{
    qDebug()<<"server start receive message";
    QDataStream in(clientConnection);
    in.setVersion(QDataStream::Qt_DefaultCompiledVersion);
    if(blocksize==0){
        if(clientConnection->bytesAvailable()<(int)sizeof (16))
            return;
        in>>blocksize;
    }

    if(clientConnection->bytesAvailable()<blocksize)
        return;
    in>>message;
    qDebug()<<"recv:"<<message;
    blocksize = 0;
}
