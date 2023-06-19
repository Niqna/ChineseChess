#ifndef CONNECT_H
#define CONNECT_H

#include <QObject>
#include <QtNetwork>


class Connect : public QObject
{
    Q_OBJECT
public:
    explicit Connect(QObject *parent = nullptr);

public slots:
    void portSlot(QString p,QString i);
    void readMessage();
    void displayError(QAbstractSocket::SocketError);
    void sendMessage();

signals:
    void connectSuccess();

private:
    quint16 port;
    QString ip;
    quint16 blocksize;
    QTcpSocket *tcpsocket;
    bool hasConnectToServer;
    QString message;
};

#endif // CONNECT_H
