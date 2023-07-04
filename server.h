//anthor: 2021051615173nieanqin
//server.h
//服务端
#ifndef SERVER_H
#define SERVER_H

#include <QObject>
#include <QtNetwork>

class Server : public QObject
{
    Q_OBJECT
public:
    explicit Server(QObject *parent = nullptr);
    Q_PROPERTY(QString ip READ getIp WRITE setIp NOTIFY ipChanged)
    Q_PROPERTY(int firstrow READ getFirstrow WRITE setFirstrow NOTIFY firstrowChanged)
    Q_PROPERTY(int firstcol READ getFirstcol WRITE setFirstcol NOTIFY firstcolChanged)
    Q_PROPERTY(int row READ getRow WRITE setRow NOTIFY rowChanged)
    Q_PROPERTY(int col READ getCol WRITE setCol NOTIFY colChanged)

    const QString &getIp() const;
    void setIp(const QString &newIp);
    
    //qml端可调用的向客户端发送棋子将要移动到的位置的方法
    Q_INVOKABLE void xyChangedSlot(int x,int y,int x1,int y1);  
    
    //服务端断开连接
    Q_INVOKABLE void disConnect();  

    int getFirstrow() const;
    void setFirstrow(int newFirstrow);

    int getFirstcol() const;
    void setFirstcol(int newFirstcol);

    int getRow() const;
    void setRow(int newRow);

    int getCol() const;
    void setCol(int newCol);

public slots:
    //服务端连接到客户端
    void portSlot(QString s);   

signals:
    void ipChanged();
    void connectSuccess();
    void firstrowChanged();
    void firstcolChanged();
    void writeOk();
    void receiveOk();
    void rowChanged();
    void colChanged();
    void disConnectSignal();

private:
    QString ip;
    quint16 port;
    QTcpServer *tcpserver;  
    QTcpSocket *clientConnection;
    //注册的qml的初始行property
    int firstrow; 
    //注册的qml的初始列property
    int firstcol;  
    //注册的qml的要移动到的行property
    int row; 
    //注册的qml的要移动到的列property
    int col;    
};

#endif // SERVER_H
