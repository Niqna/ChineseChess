#include "connect.h"

Connect::Connect(QObject *parent)
    : QObject{parent}
{
    tcpsocket = new QTcpSocket(this);

    connect(tcpsocket, &QTcpSocket::connected, this, [=](){
        connectSuccess();
    });
    connect(tcpsocket,&QTcpSocket::readyRead,this,[=](){
        QByteArray data = tcpsocket->readAll();

        QStringList list = QString(data).split(",");
        firstrow = 10-list[0].toInt();
        firstcol = 9-list[1].toInt();
        row = 10-list[2].toInt();
        col = 9-list[3].toInt();
        connectxy();
        qDebug()<<list;
    });
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
    tcpsocket->connectToHost(ip,port);

//    sendMessage();
//    connect(tcpsocket,SIGNAL(newConnection()),this,SLOT(sendMessage()));
    //    qDebug()<<"server start";
}

//void Connect::readMessage()
//{
//    QDataStream in(tcpsocket);
//    in.setVersion(QDataStream::Qt_DefaultCompiledVersion);
//    if(blocksize == 0){
//        if(tcpsocket->bytesAvailable()<(int)sizeof (quint16))
//            return;
//        in>>blocksize;
//    }
//    if(tcpsocket->bytesAvailable()<blocksize)
//        return;
//    in>>message;
//    qDebug()<<"recv:"<<message;
//    blocksize = 0;
//}

void Connect::displayError(QAbstractSocket::SocketError)
{
    qDebug()<<tcpsocket->errorString();
}

int Connect::getCol() const
{
    return col;
}

void Connect::setCol(int newCol)
{
    if (col == newCol)
        return;
    col = newCol;
    emit colChanged();
}

int Connect::getRow() const
{
    return row;
}

void Connect::setRow(int newRow)
{
    if (row == newRow)
        return;
    row = newRow;
    emit rowChanged();
}

int Connect::getFirstcol() const
{
    return firstcol;
}

void Connect::setFirstcol(int newFirstcol)
{
    if (firstcol == newFirstcol)
        return;
    firstcol = newFirstcol;
    emit firstcolChanged();
}

int Connect::getFirstrow() const
{
    return firstrow;
}

void Connect::setFirstrow(int newFirstrow)
{
    if (firstrow == newFirstrow)
        return;
    firstrow = newFirstrow;
    emit firstrowChanged();
}

void Connect::xyChangedSlot(int x, int y, int x1, int y1)
{
    QString mes;
    mes=QString::number(x)+QString::number(y)
            +QString::number(x1)+QString::number(y1);
    qDebug()<<mes;
    qDebug()<<"11111";
    tcpsocket->write(mes.toUtf8());
}


//void Connect::sendMessage()
//{
//    QByteArray block;
//    QDataStream out(&block,QIODevice::WriteOnly);
//    out.setVersion(QDataStream::Qt_DefaultCompiledVersion);
//    out<<(quint16)0;
//    out<<QString("Connect success");
//    out.device()->seek(0);
//    out<<(quint16)(block.size()-sizeof (quint16));

//    tcpsocket->write(block);
//}

