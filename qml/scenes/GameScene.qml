//anthor： 2021051615172fujiale

// 游戏界面

import QtQuick 2.15
import Felgo 3.0
import "../common"
import "../entity"
import "../dialogs"

SceneBase {
    id: gameScene
    anchors.fill: parent

    signal disConnect
    signal move_connect
    signal move_server

    property int theme: 1  //主题
    property int camp  //本方的阵营

    property int isServer: camp  //是否是创建方
    property bool isConnected   //是否连接成功

    property int step1: 0   //计步器的个位
    property int step2: 0   //计步器的十位
    property int step3: 0   //计步器的百位

    // func：初始化游戏界面
    function init() {
        // 主题与系统设置中的保持一致
        theme = settingScene.theme

        // 计步器归零
        step1 = 0
        step2 = 0
        step3 = 0

        //初始化棋盘
        board.init()

        //初始化计时器并开始计时
        clock.init()
        clock.start()
    }

    // 背景图片
    BackgroundImage {
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/image/gameImage/" + theme + "-01.png"
    }

    // 实例化棋盘类
    Board {
        id: board

        // 不是己方回合，弹出cueRoundDialog
        onCueRoundMes: cueRoundDialog.show()

        // 游戏结束，弹出gameOverDialog，胜利方是当前回合行动方
        onGameOverMes: {
            gameOverDialog.winCamp = isRed
            gameOverDialog.show()
        }

        // 如果棋子有移动
        onXyChanged: {
            if(isServer == 0){  // 如果是创建游戏方
                createRoomScene.row1 = first_row
                createRoomScene.col1 = first_col
                createRoomScene.row2 = _row
                createRoomScene.col2 = _col
                console.log(createRoomScene.row1,createRoomScene.col1,createRoomScene.row2,createRoomScene.col2)
                createRoomScene.sendMes()
            } else {   // 如果是加入游戏方
                joinRoomScene.row1 = first_row
                joinRoomScene.col1 = first_col
                joinRoomScene.row2 = _row
                joinRoomScene.col2 = _col
                console.log(joinRoomScene.row1,joinRoomScene.col1,joinRoomScene.row2,joinRoomScene.col2)
                joinRoomScene.sendMes()
            }
        }

        // 每完成一步，计步器加一
        onAddStepMes: {
            step1++
            if(step1 > 9) {
                step1 = 0
                step2++
                if(step2 > 9) {
                    step2 = 0
                    step3++
                    if(step3 > 9)
                        step3 = 0
                }
            }
        }
    }

    // 实例化计时器
    Clock {
        id: clock
        x: 85
        y: 10
    }

    // 计步器组件
    Rectangle {
        id: step
        x: 360
        y: 10
        width: 75
        height: 28
        color: "transparent"

        // 计步器个位
        AnimatedSprite {
            id: step_1
            width: 25
            height: 28
            anchors.right: step.right
            source: "../../assets/image/gameImage/" + theme + "-03.png"
            frameX: step1 * 25
            frameY: 0
            frameWidth: 25
            frameHeight: 28
        }

        // 计步器十位
        AnimatedSprite {
            id: step_2
            width: 25
            height: 28
            anchors.right: step_1.left
            source: "../../assets/image/gameImage/" + theme + "-03.png"
            frameWidth: 25
            frameHeight: 28
            frameX: step2 * 25
            frameY: 0
        }

        // 计步器百位
        AnimatedSprite {
            id: step_3
            width: 25
            height: 28
            anchors.right: step_2.left
            source: "../../assets/image/gameImage/" + theme + "-03.png"
            frameWidth: 25
            frameHeight: 28
            frameX: step3 * 25
            frameY: 0
        }
    }

    // 系统选项
    Image {
        id: system
        x: 135
        y: 700
        width: 65
        height:130
        source: "../../assets/image/gameImage/" + theme + "-04.png"
        TapHandler{
            onTapped: {
                systemDialog.show()
            }
        }
    }

    // 悔棋选项
    Image {
        id: undo
        x: 300
        y: 700
        width: 65
        height:130
        source: "../../assets/image/gameImage/" + theme + "-04.png"
    }

    // 系统字样
    SpriteSequence {
        x: system.x + 3
        y: system.y + 20
        width:50
        height:76
        Sprite {
            source: "../../assets/image/gameImage/" + theme + "-05.png"
            frameCount: 1
            frameX: 0
            frameWidth: 50
            frameHeight: 76
        }
    }

    // 悔棋字样
    SpriteSequence {
        x: undo.x + 3
        y: undo.y + 20
        width:50
        height:76
        Sprite {
            source: "../../assets/image/gameImage/" + theme + "-05.png"
            frameCount: 1
            frameX: 150
            frameWidth: 50
            frameHeight: 76
        }
    }

    // 实例化系统对话框
    SystemDialog {
        id: systemDialog
        onDisConnectSig:{
            if(isServer === 0){
                createRoomScene.disConnect_server()
            }
            else{
                joinRoomScene.disConnect_Connect()
            }
        }
    }

    // 实例化提示回合对话框
    DialogBase {
        id: cueRoundDialog
        box.color: "#f0f0f0"
        question.text: "This is not your round!"
        modal: true
        onSelectedOk: { // 点击确认按钮后退出对话框
            cueRoundDialog.quit()
        }
    }

    // 实例化连接断开对话框
    DialogBase {
        id: disconnectDialog
        box.color: "#f0f0f0"
        question.text: "Connection down!"
        modal: true
        onSelectedOk: {
            window.state = "menu"
        }
    }

    // 实例化游戏结束对话框
    GameOverDialog {
        id: gameOverDialog
        onGameAgainMes: gameAgainDialog.show()
    }

    // 实例化询问是否继续游戏对话框
    GameAgainDialog {
        id: gameAgainDialog
        onSelectedOk:{  // 选择“是”则初始化游戏界面，重新开局
            gameScene.init()

        }
        onSelectedCancel: { // 选择“否”则返回主菜单
            backButtonPressed()
        }
    }

    onMove_connect: {
        console.log(joinRoomScene.row1,joinRoomScene.col1,joinRoomScene.row2,joinRoomScene.col2)
        board.moveStone(joinRoomScene.row1,joinRoomScene.col1,joinRoomScene.row2,joinRoomScene.col2)
        console.log("move")
    }

    onMove_server: {
        console.log(createRoomScene.row1,createRoomScene.col1,createRoomScene.row2,createRoomScene.col2)
        board.moveStone(createRoomScene.row1,createRoomScene.col1,createRoomScene.row2,createRoomScene.col2)
        console.log("move")
    }

    onDisConnect: {
        disconnectDialog.show()
    }
}
