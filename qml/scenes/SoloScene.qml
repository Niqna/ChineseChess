// anthor：
//       2021051615173nieanqin：界面设计
//       2021051615172fujiale：界面设计、选择玩家执子

//单人游戏界面

import QtQuick 2.15
import Felgo 3.0
import QtMultimedia 5.15
import "../common"

SceneBase {

    // signal indicating that the gameScene should be displayed
    signal gamePressed

    property bool isBlack: false //是否选择黑方

    id: soloScene
    anchors.fill: parent

    // 背景图片
    BackgroundImage {
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/image/01.png"
    }

    // 标题
    Image {
        id: title
        x:110
        y:95
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../../assets/image/create.png"
    }

    // 玩家执子字样
    Image {
        id: choose1
        x: 0
        y: 250
        source: "../../assets/image/choose.png"
    }

    // 左箭头，点击后切换到上一选项
    Image {
        id: left
        x:choose1.width - 70
        y:choose1.y-10
        source: "../../assets/image/3-1.png"
        TapHandler{
            onTapped: {
                if(isBlack){
                    isBlack = false
                    chooseCamp.jumpTo("hong")
                    gameScene.camp = 0
                } else {
                    isBlack = true
                    chooseCamp.jumpTo("hei")
                    gameScene.camp = 1
                }
            }
        }
    }

    // 红先、黑后两个选项
    SpriteSequence {
        id: chooseCamp
        x: left.x + left.width
        y: left.y - 10
        width: 152
        height: 80
        Sprite{
            name: "hong"
            source: "../../assets/image/soloChoose.png"
            frameCount: 1
            frameX: 0
            frameY: 0
            frameWidth: 152
            frameHeight: 80
        }
        Sprite{
            name: "hei"
            source: "../../assets/image/soloChoose.png"
            frameCount: 1
            frameX: 0
            frameY: 80
            frameWidth: 152
            frameHeight: 80
        }
    }

    // 右箭头，点击后切换到下一选项
    Image {
        id: right
        anchors.left: chooseCamp.right
        y: left.y
        source: "../../assets/image/3-2.png"
        TapHandler{
            onTapped: {
                if(isBlack){
                    isBlack = false
                    chooseCamp.jumpTo("hong")
                    gameScene.camp = 0
                } else {
                    isBlack = true
                    chooseCamp.jumpTo("hei")
                    gameScene.camp = 1
                }
            }
        }
    }

    // 返回按钮，点击返回主菜单
    Image {
        id: back
        y:750
        source: "../../assets/image/back.png"
        TapHandler{
            onTapped: {
                backButtonPressed()
            }
        }
    }

    // 开始游戏
    Image {
        id: start
        anchors.right: soloScene.right
        y:750
        source: "../../assets/image/start.png"
        TapHandler{
            // 点击后切换到游戏界面，根据选择的执子初始化游戏界面
            onTapped: {
                gamePressed()
                gameScene.init()
            }
        }
    }
}
