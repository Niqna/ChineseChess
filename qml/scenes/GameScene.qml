import QtQuick 2.15
import Felgo 3.0
import "../common"
import "../entity"
import "../dialogs"

// GAME SCENE


SceneBase {

    signal disConnect

    signal move_connect

    signal move_server

    property int theme: 1

    property int camp

    property int isServer: camp
    property bool isConnected

    property int step1: 0
    property int step2: 0
    property int step3: 0

    function init() {
        theme = settingScene.theme
        step1 = 0
        step2 = 0
        step3 = 0
        board.init()
        clock.init()
        clock.start()
    }

    id: gameScene

    anchors.fill: parent
    BackgroundImage {
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/image/gameImage/" + theme + "-01.png"
    }

    Board {
        id: board
        onCueRoundMes: cueRoundDialog.show()
        onGameOverMes: {
            gameOverDialog.winCamp = isRed
            gameOverDialog.show()
        }

        onXyChanged: {
            if(isServer == 0){
                createRoomScene.row1 = first_row
                createRoomScene.col1 = first_col
                createRoomScene.row2 = _row
                createRoomScene.col2 = _col
                console.log("1");
                console.log(createRoomScene.row1,createRoomScene.col1,createRoomScene.row2,createRoomScene.col2)
                createRoomScene.sendMes()
            } else {
                joinRoomScene.row1 = first_row
                joinRoomScene.col1 = first_col
                joinRoomScene.row2 = _row
                joinRoomScene.col2 = _col
                console.log("11")
                console.log(joinRoomScene.row1,joinRoomScene.col1,joinRoomScene.row2,joinRoomScene.col2)
                joinRoomScene.sendMes()
            }
        }
        onAddStepMes: {
            step1++
            if(step1 > 9) {
                step1 = 0
                step2++
                if(step2 > 9) {
                    step2 = 0
                    step3++
                    if(step3 > 9) {
                        step3 = 0
                    }
                }
            }
        }
    }

    Clock {
        id: clock
        x: 85
        y: 10
    }

    Rectangle {
        id: step
        x: 360
        y: 10
        width: 75
        height: 28
        color: "transparent"
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

    Image {
        id: help
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
    Image {
        id: undo
        x: 300
        y: 700
        width: 65
        height:130
        source: "../../assets/image/gameImage/" + theme + "-04.png"
    }
    SpriteSequence {
        x: help.x + 3
        y: help.y + 20
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

    onMove_connect: {
        console.log("5")
        console.log(joinRoomScene.row1,joinRoomScene.col1,joinRoomScene.row2,joinRoomScene.col2)
        board.moveStone(joinRoomScene.row1,joinRoomScene.col1,joinRoomScene.row2,joinRoomScene.col2)
        console.log("move")
    }

    onMove_server: {
        console.log("55")
        console.log(createRoomScene.row1,createRoomScene.col1,createRoomScene.row2,createRoomScene.col2)
        board.moveStone(createRoomScene.row1,createRoomScene.col1,createRoomScene.row2,createRoomScene.col2)
        console.log("move")
    }

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

    DialogBase {
        id: cueRoundDialog
        box.color: "#f0f0f0"
        question.text: "This is not your round!"
        modal: true
        onSelectedOk: {
            cueRoundDialog.quit()
        }
    }

    DialogBase {
        id: disconnectDialog
        box.color: "#f0f0f0"
        question.text: "Connection down!"
        modal: true
        onSelectedOk: {
            window.state = "menu"
        }
    }

    GameOverDialog {
        id: gameOverDialog
        onGameAgainMes: gameAgainDialog.show()
    }

    GameAgainDialog {
        id: gameAgainDialog
        onSelectedOk:{
            gameScene.init()

        }
        onSelectedCancel: {
            backButtonPressed()
        }
    }
    onDisConnect: {
        disconnectDialog.show()
    }
}
