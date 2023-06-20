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

private:
    QString ip;
    quint16 port;
    QTcpServer *tcpserver;
    QTcpSocket *clientConnection;
    int firstrow;
    int firstcol;
    int row;
    int col;

};

#endif // SERVER_H
