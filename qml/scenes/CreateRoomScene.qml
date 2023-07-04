// anthor：2021051615173nieanqin

//创建房间的界面

import QtQuick 2.15
import Felgo 3.0
import Server 1.0
// CREATEROOM SCENE

SceneBase {

    // signal indicating that the gameScene should be displayed
    signal gamePressed

    signal disConnect_server
    signal sendMes
    signal portSig(var s)

    property int row1
    property int col1
    property int row2
    property int col2

    id: createRoomScene
    anchors.fill: parent
    BackgroundImage {
        source: "../../assets/image/01.png"
        anchors.fill: parent.gameWindowAnchorItem
    }
    Text {
        id: title
        anchors.horizontalCenter: parent.horizontalCenter
        y: createRoomScene.height/9
        color: "white"
        text: '创建房间'
        font.pixelSize: 40
    }
    Image {
        id: juanzhou
        anchors.horizontalCenter: parent.horizontalCenter
        y:180
        source: "../../assets/image/1-4.png"

        Text {
            x:60; y:120
            font.pixelSize: 30
            text: qsTr("Port:")
        }

        AppTextField{
            id: port
            x:80; y:160
            width: 210
            height: 40
            color: "black"
        }

        Text {
            x:60; y:220
            font.pixelSize: 25
            text: qsTr("本地IP: "+server.ip)
        }

        Image {
            source: "../../assets/image/04.png"
            anchors.horizontalCenter: parent.horizontalCenter
            width: 250; height: 80
            y:280
            Text {
                x:90; y:20
                color: "white"
                text: '创建'
                font.pixelSize: 30
                anchors.centerIn: parent.Center
            }
            TapHandler{
                onTapped: {
                    portSig(port.getText(0,10))
                    waitMessage.visible = true
                }
            }
        }

        Component.onCompleted: {
            portSig.connect(server.portSlot)
        }

        Rectangle{
            id:waitMessage
            visible: false
            width: 180
            height: 40
            color: "transparent"
            x:(juanzhou.width-waitMessage.width)/2
            y:(juanzhou.height-waitMessage.height)/2
            anchors.centerIn: parent.Center
            Text {
                text: qsTr("waiting...")
                font.pixelSize: 25
            }
        }
    }

    Image {
        id: back
        x: 0
        y:750
        source: "../../assets/image/back.png"
        TapHandler{
            onTapped: {
                backButtonPressed()
            }
        }
    }

    //c++注册的服务端对象
    Server{
        id:server

        onConnectSuccess: {
            gamePressed()
            gameScene.camp = 0
            gameScene.init()
            waitMessage.visible = false
        }

        //接受成功则移动棋子
        onReceiveOk: {
            row1=server.firstrow
            col1=server.firstcol
            row2=server.row
            col2=server.col
            console.log(row1,col1,row2,col2)
            gameScene.move_server()
        }

        //发送成功
        onWriteOk: {
            console.log("C write ok")
        }

        //断开连接显示提示断开对话框
        onDisConnectSignal: {
            gameScene.disConnect()
        }
    }

    //收到发送信息信号就调用c++对象的棋子位置移动函数
    onSendMes:{
        console.log(row1,col1,row2,col2)
        server.xyChangedSlot(row1, col1, row2, col2)
    }

    onDisConnect_server: {
        server.disConnect()
    }
}

