import QtQuick 2.15
import Felgo 3.0
import "../common"
import Connect 1.0

// CREATEROOM SCENE

SceneBase {
    signal connectSig(var p,var i)

    id: joinRoomScene
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
        text: '加入房间'
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
            id:portText
            x:80; y:120
            width: 210
            height: 40
            color: "black"
        }

        Text {
            x:60; y:180
            font.pixelSize: 30
            text: qsTr("IP:")
        }

        AppTextField{
            id:ipText
            x:80; y:220
            width: 210
            height: 40
            color: "black"
        }

        Image {
            source: "../../assets/image/04.png"
            anchors.horizontalCenter: parent.horizontalCenter
            width: 250; height: 80
            y:280
            Text {
                id:text
                x:90; y:20
                color: "white"
                text: '连接'
                font.pixelSize: 30
                anchors.centerIn: parent.Center
                TapHandler{
                    onTapped: {
                        connectSig(portText.getText(0,6),ipText.getText(0,15))
                    }
                }
            }
        }

        Component.onCompleted: {
            connectSig.connect(connect.portSlot)
        }

        Image {
            source: "../../assets/image/04.png"
            anchors.horizontalCenter: parent.horizontalCenter
            width: 250; height: 80
            y:360
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

    Connect{
        id:connect
    }

}

