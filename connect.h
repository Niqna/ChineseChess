//anthor: 2021051615173nieanqin
//connect.h
//客户端
#ifndef CONNECT_H
#define CONNECT_H

#include <QObject>
#include <QtNetwork>


class Connect : public QObject
{
    Q_OBJECT
public:

    explicit Connect(QObject *parent = nullptr);
    
    //qml端可调用的向服务端发送棋子将要移动到的位置的方法
    Q_INVOKABLE void xyChangedSlot(int x,int y,int x1,int y1);
    
    //客户端断开连接
    Q_INVOKABLE void disConnect();

    Q_PROPERTY(int firstrow READ getFirstrow WRITE setFirstrow NOTIFY firstrowChanged)
    Q_PROPERTY(int firstcol READ getFirstcol WRITE setFirstcol NOTIFY firstcolChanged)
    Q_PROPERTY(int row READ getRow WRITE setRow NOTIFY rowChanged)
    Q_PROPERTY(int col READ getCol WRITE setCol NOTIFY colChanged)

    int getFirstrow() const;
    void setFirstrow(int newFirstrow);

    int getFirstcol() const;
    void setFirstcol(int newFirstcol);

    int getRow() const;
    void setRow(int newRow);

    int getCol() const;
    void setCol(int newCol);

public slots:
    //客户端连接到服务端
    void portSlot(QString p,QString i);
    
    //连接失败信息提示
    void displayError(QAbstractSocket::SocketError);

signals:
    void connectSuccess();
    void receiveOk();
    void firstrowChanged();
    void firstcolChanged();
    void rowChanged();
    void colChanged();
    void writeOk();
    void disConnectSignal();

private:
    quint16 port;
    QString ip;
    QTcpSocket *tcpsocket;
    //注册的qml的初始行property
    int firstrow;
    //注册的qml的初始列property
    int firstcol;
    //注册的qml的要移动到的行property
    int row;
    //注册的qml的要移动到的列property
    int col;

};

#endif // CONNECT_H
