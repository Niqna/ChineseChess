#ifndef CONNECT_H
#define CONNECT_H

#include <QObject>
#include <QtNetwork>


class Connect : public QObject
{
    Q_OBJECT
public:

    explicit Connect(QObject *parent = nullptr);
    Q_INVOKABLE void xyChangedSlot(int x,int y,int x1,int y1);

    int getFirstrow() const;
    void setFirstrow(int newFirstrow);

    int getFirstcol() const;
    void setFirstcol(int newFirstcol);

    int getRow() const;
    void setRow(int newRow);

    int getCol() const;
    void setCol(int newCol);

public slots:
    void portSlot(QString p,QString i);
//    void readMessage();
    void displayError(QAbstractSocket::SocketError);
//    void sendMessage();

signals:
    void connectSuccess();
    void connectxy();
    void firstrowChanged();

    void firstcolChanged();

    void rowChanged();

    void colChanged();

private:
    quint16 port;
    QString ip;
    QTcpSocket *tcpsocket;
    int firstrow;
    int firstcol;
    int row;
    int col;
    Q_PROPERTY(int firstrow READ getFirstrow WRITE setFirstrow NOTIFY firstrowChanged)
    Q_PROPERTY(int firstcol READ getFirstcol WRITE setFirstcol NOTIFY firstcolChanged)
    Q_PROPERTY(int row READ getRow WRITE setRow NOTIFY rowChanged)
    Q_PROPERTY(int col READ getCol WRITE setCol NOTIFY colChanged)
};

#endif // CONNECT_H
