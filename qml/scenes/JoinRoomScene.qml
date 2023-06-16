import QtQuick 2.15
import Felgo 3.0
import "../common"

// CREATEROOM SCENE

SceneBase {
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
            x:60; y:110
            font.pixelSize: 30
            text: qsTr("Port:")
        }

        AppTextField{
            x:80; y:150
            width: 210
            height: 40
            color: "black"
        }

        Text {
            x:60; y:210
            font.pixelSize: 30
            text: qsTr("IP:")
        }

        AppTextField{
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

