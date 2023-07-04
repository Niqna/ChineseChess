// anthor：2021051615173nieanqin

//联机游戏的界面

import QtQuick 2.15
import Felgo 3.0
import "../common"

// LOCAL SCENE

SceneBase {

    // signal indicating that the createRoomScene should be displayed
    signal createRoomPressed
    // signal indicating that the joinRoomScene should be displayed
    signal joinRoomPressed

    id: localScene
    anchors.fill: parent

    // 背景图片
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
        text: '局域网'
        font.pixelSize: 40
    }

    Image {
        id: juanzhou
        anchors.horizontalCenter: parent.horizontalCenter
        y:180
        source: "../../assets/image/1-4.png"

        // 选择作为创建房间的一方
        Image {
            source: "../../assets/image/04.png"
            anchors.horizontalCenter: parent.horizontalCenter
            width: 250; height: 80
            y:110
            Text {
                x:60; y:20
                color: "white"
                text: '创建房间'
                font.pixelSize: 30
                anchors.centerIn: parent.Center
                TapHandler{
                    onTapped: {
                        onclicked: createRoomPressed()
                    }
                }
            }
        }

        // 选择作为加入房间的一方
        Image {
            source: "../../assets/image/04.png"
            anchors.horizontalCenter: parent.horizontalCenter
            width: 250; height: 80
            y:220
            Text {
                x:60; y:20
                color: "white"
                text: '加入房间'
                font.pixelSize: 30
                anchors.centerIn: parent.Center
                TapHandler{
                    onTapped: {
                        onclicked: joinRoomPressed()
                    }
                }
            }
        }

        // 返回按钮，点击返回主菜单
        Image {
            id: local
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

}
