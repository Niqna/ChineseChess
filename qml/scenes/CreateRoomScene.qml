import QtQuick 2.15
import Felgo 3.0
import "../common"
//import Localplay 1.0
import Server 1.0

// CREATEROOM SCENE

SceneBase {

    signal portSig(var s)
    signal cancelSig()
    signal openGameScene()

    id: createRoomScene
    anchors.fill: parent
    BackgroundImage {
        source: "../../assets/image/01.png"
        anchors.fill: parent.gameWindowAnchorItem
    }
    Text {
        id: title
        width: localScene.width/4
        height: 48
        x: localScene.width/2 - title.width/2
        y: localScene.height/9
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
            x:60; y:80
            font.pixelSize: 30
            text: qsTr("Port:")
        }

        AppTextField{
            id:text
            x:80; y:120
            width: 210
            height: 40
            color: "black"
        }

        Text {
            x:60; y:180
            font.pixelSize: 25
            text: qsTr("本地IP: "+server.ip)
        }

        Image {
            source: "../../assets/image/04.png"
            anchors.horizontalCenter: parent.horizontalCenter
            width: 250; height: 80
            y:230
            Text {
                x:90; y:20
                color: "white"
                text: '创建'
                font.pixelSize: 30
                anchors.centerIn: parent.Center
                TapHandler{
                    onTapped: {
                        portSig(text.getText(0,10))
                    }
                }
            }
        }

        Component.onCompleted: {
            portSig.connect(server.portSlot)
        }

        Image {
            source: "../../assets/image/04.png"
            anchors.horizontalCenter: parent.horizontalCenter
            width: 250; height: 80
            y:330
            Text {
                x:90; y:20
                color: "white"
                text: '返回'
                font.pixelSize: 30
                anchors.centerIn: parent.Center
                TapHandler{
                    onTapped: {
                        backButtonPressed()
                    }
                }
            }
        }
    }
    Server{
        id:server
    }
    
    function connectSuccessSlot(){
        openGameScene()
    }
}

