#ifndef LOCALPLAY_H
#define LOCALPLAY_H

#include <QObject>
#include <QtNetwork>

class LocalPlay : public QObject
{
    Q_OBJECT
public:
    explicit LocalPlay(QObject *parent = nullptr);

    void ReadMessage();

public slots:
    void portSlot(QString s);
    void ipSlot(QString s);
    void SendMessage();

signals:


private:
    QUdpSocket *sender;
    QUdpSocket *receiver;
    quint16 port;
    QString ip{"0"};
    QString text1;
    QString text2;
   };

#endif // LOCALPLAY_H
