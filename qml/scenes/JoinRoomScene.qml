import QtQuick 2.15
import Felgo 3.0
import "../common"
import Connect 1.0

// CREATEROOM SCENE

SceneBase {

    // signal indicating that the gameScene should be displayed
    signal gamePressed
    signal connectSig(var p,var i)

    id: joinRoomScene
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
        text: '加入房间'
        font.pixelSize: 40
    }
    Image {
        id: juanzhou
        anchors.horizontalCenter: parent.horizontalCenter
        y:180
        source: "../../assets/image/1-4.png"

        Text {
            x:60; y:110
            font.pixelSize: 30
            text: qsTr("IP:")
        }

        AppTextField{
            id: ipText
            x:80; y:150
            width: 210
            height: 40
            color: "black"
        }

        Text {
            x:60; y:210
            font.pixelSize: 30
            text: qsTr("Port:")
        }

        AppTextField{
            id: portText
            x:80; y:250
            width: 210
            height: 40
            color: "black"
        }

        Image {
            source: "../../assets/image/04.png"
            anchors.horizontalCenter: parent.horizontalCenter
            width: 250; height: 80
            y:330
            Text {
                x:90; y:20
                color: "white"
                text: '加入'
                font.pixelSize: 30
                anchors.centerIn: parent.Center
            }
            TapHandler{
                onTapped: {
//                    gamePressed()
//                    gameScene.camp = 1
//                    gameScene.init()
                    connectSig(portText.getText(0,6),ipText.getText(0,15))
                }
            }
        }
    }

    Component.onCompleted: {
        connectSig.connect(connect.portSlot)
    }

    Connect{
        id:connect
        onConnectSuccess: {
            gamePressed()
            gameScene.camp = 1
            gameScene.init()
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
}

