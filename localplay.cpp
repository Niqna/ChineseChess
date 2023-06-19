#include "localplay.h"

LocalPlay::LocalPlay(QObject *parent)
    : QObject{parent}
{
    sender = new QUdpSocket(this);
    receiver = new QUdpSocket(this);

    if(receiver->bind(port,QUdpSocket::ShareAddress)){
        qDebug()<<"secsseed";
    }
    connect(receiver,SIGNAL(readyRead()),this,SLOT(ReadMessage()));
    SendMessage();
}

void LocalPlay::SendMessage()
{
    text1="hello";
    QByteArray datagram = text1.toUtf8();
    if(ip=="0")
        sender->writeDatagram(datagram.data(),datagram.size(),QHostAddress(ip),port);
    else
        sender->writeDatagram(datagram.data(),datagram.size(),QHostAddress("10.252.149.30"),port);
}



void LocalPlay::portSlot(QString s)
{
    port = s.toUShort();

    qDebug()<<__FUNCTION__<<"  "<<port;
}

void LocalPlay::ipSlot(QString s)
{
    ip = s;
    qDebug()<<__FUNCTION__<<"  "<<ip;
}


void LocalPlay::ReadMessage()
{
    while (receiver->hasPendingDatagrams()) {
        QByteArray datagram;
        datagram.resize(receiver->pendingDatagramSize());

        receiver->readDatagram(datagram.data(),datagram.size());
        text2.clear();
        text2.prepend(datagram);

        qDebug()<<text2;
    }
}

