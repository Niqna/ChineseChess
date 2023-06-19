import QtQuick 2.15
import Felgo 3.0
import "../common"

// CREATEROOM SCENE

SceneBase {

    // signal indicating that the gameScene should be displayed
    signal gamePressed

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
            x:60; y:160
            font.pixelSize: 30
            text: qsTr("Port:")
        }

        AppTextField{
            id: port
            x:80; y:200
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
                x:90; y:20
                color: "white"
                text: '创建'
                font.pixelSize: 30
                anchors.centerIn: parent.Center
            }
            TapHandler{
                onTapped: {
                    gamePressed()
                    gameScene.init()
                    gameScene.camp = 1
                }
            }
        }

//        Image {
//            source: "../../assets/image/04.png"
//            anchors.horizontalCenter: parent.horizontalCenter
//            width: 250; height: 80
//            y:330
//            Text {
//                x:90; y:20
//                color: "white"
//                text: '返回'
//                font.pixelSize: 30
//                anchors.centerIn: parent.Center
//                TapHandler{
//                    onTapped: {
//                        backButtonPressed()
//                    }
//                }
//            }
//        }
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

