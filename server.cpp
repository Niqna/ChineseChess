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

    connect(tcpserver,&QTcpServer::newConnection,this,[=](){
        connectSuccess();

        clientConnection=tcpserver->nextPendingConnection();

        connect(clientConnection,&QTcpSocket::readyRead,this,[=](){
            QByteArray data = clientConnection->readAll();
            QStringList list = QString(data).split(",");
            firstrow = 10-list[0].toInt() + 1;
            firstcol = 9-list[1].toInt() + 1;
            row = 10-list[2].toInt() + 1;
            col = 9-list[3].toInt() + 1;
            qDebug()<<list<<"  "<<firstrow<<"  "<<firstcol<<"  "<<row<<"  "<<col;
            receiveOk();
        });

        connect(clientConnection,&QTcpSocket::disconnected,this,[=](){
            clientConnection->close();
            clientConnection->deleteLater();
        });
        qDebug()<<"server start";
    });
}

int Server::getCol() const
{
    return col;
}

void Server::setCol(int newCol)
{
    if (col == newCol)
        return;
    col = newCol;
    emit colChanged();
}

int Server::getRow() const
{
    return row;
}

void Server::setRow(int newRow)
{
    if (row == newRow)
        return;
    row = newRow;
    emit rowChanged();
}

int Server::getFirstcol() const
{
    return firstcol;
}

void Server::setFirstcol(int newFirstcol)
{
    if (firstcol == newFirstcol)
        return;
    firstcol = newFirstcol;
    emit firstcolChanged();
}

int Server::getFirstrow() const
{
    return firstrow;
}

void Server::setFirstrow(int newFirstrow)
{
    if (firstrow == newFirstrow)
        return;
    firstrow = newFirstrow;
    emit firstrowChanged();
}

void Server::xyChangedSlot(int x,int y,int x1,int y1)
{
    QString mes;
    mes=QString::number(x)+","+QString::number(y)+","
            +QString::number(x1)+","+QString::number(y1);
    qDebug()<<"11111  "<<mes;
    clientConnection->write(mes.toUtf8());
    writeOk();
}

