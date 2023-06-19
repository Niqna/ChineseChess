#include "connect.h"

Connect::Connect(QObject *parent)
    : QObject{parent}
{
    tcpsocket = new QTcpSocket(this);

    connect(tcpsocket, &QTcpSocket::connected, this, [=](){
        connectSuccess();
    });
    connect(tcpsocket,SIGNAL(readyRead()),this,SLOT(readMessage()));
    connect(tcpsocket,SIGNAL(error(QAbstractSocket::SocketError)),
            this,SLOT(displayError(QAbstractSocket::SocketError)));

}

void Connect::portSlot(QString p,QString i)
{
    port = p.toUShort();
    ip=i;
    if(port == 0){
        qDebug()<<"port error!";
    }
    qDebug()<<__FUNCTION__<<"  "<<port<<"  "<<ip;

    QStringList list = ip.split(".");

    if(list.size()!=4){
        qDebug()<<"ip error";
        return;
    }

    for(int i=0;i<4;i++){
        if(list[i].size()==0){
            qDebug()<<"ip error";
            return;
        }
        if(list[i].size()>3){
            qDebug()<<"ip error";
            return;
        }
        for(int j=0;j<list[i].size();j++){
            if(list[i].at(j)<'0'&&list[i].at(j)>'9'){
                qDebug()<<"ip error";
                return;
            }
        }
    }

    blocksize = 0;
    if(tcpsocket)
        tcpsocket->abort();
    tcpsocket->connectToHost(ip,port);
    hasConnectToServer = true;

    sendMessage();
//    connect(tcpsocket,SIGNAL(newConnection()),this,SLOT(sendMessage()));
    //    qDebug()<<"server start";
}

void Connect::readMessage()
{
    QDataStream in(tcpsocket);
    in.setVersion(QDataStream::Qt_DefaultCompiledVersion);
    if(blocksize == 0){
        if(tcpsocket->bytesAvailable()<(int)sizeof (quint16))
            return;
        in>>blocksize;
    }
    if(tcpsocket->bytesAvailable()<blocksize)
        return;
    in>>message;
    qDebug()<<"recv:"<<message;
    blocksize = 0;
}

void Connect::displayError(QAbstractSocket::SocketError)
{
    qDebug()<<tcpsocket->errorString();
}

void Connect::sendMessage()
{
    QByteArray block;
    QDataStream out(&block,QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_DefaultCompiledVersion);
    out<<(quint16)0;
    out<<QString("Connect success");
    out.device()->seek(0);
    out<<(quint16)(block.size()-sizeof (quint16));

    tcpsocket->write(block);
}
