#ifndef SERVER_H
#define SERVER_H

#include <QObject>
#include <QtNetwork>

class Server : public QObject
{
    Q_OBJECT
public:
    explicit Server(QObject *parent = nullptr);

    const QString &getIp() const;
    void setIp(const QString &newIp);

public slots:
    void portSlot(QString s);
    void sendMessage();
    void readMessage();

signals:

    void ipChanged();
    void connectSuccess();

private:
    QString ip;
    Q_PROPERTY(QString ip READ getIp WRITE setIp NOTIFY ipChanged)
    quint16 port;
    QTcpServer *tcpserver;
    QTcpSocket *clientConnection;
    quint16 blocksize;
    QString message;
};

#endif // SERVER_H
