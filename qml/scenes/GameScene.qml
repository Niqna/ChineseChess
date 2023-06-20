import QtQuick 2.15
import Felgo 3.0
import "../common"
import "../entity"
import "../dialogs"
//import Server 1.0
//import Connect 1.0

// GAME SCENE


SceneBase {
    signal moveStoneMes

    signal move_connect

    signal move_server

    property int theme: 1

    property int camp

    property int isServer: camp


    function init() {
        theme = settingScene.theme
        board.init()
    }

//    function networkMove(row1, col1, row2, col2) {

//    }

    id: gameScene

    anchors.fill: parent
    BackgroundImage {
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/image/gameImage/" + theme + "-01.png"
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



    Board {
        id: board
        onCueRoundMes: cueRoundDialog.show()
        onGameOverMes: {
            gameOverDialog.winCamp = isRed
            gameOverDialog.show()
        }
        onXyChanged_server: {
            createRoomScene.row1 = first_row
            createRoomScene.col1 = first_col
            createRoomScene.row2 = _row
            createRoomScene.col2 = _col
            console.log("1");
            console.log(createRoomScene.row1,createRoomScene.col1,createRoomScene.row2,createRoomScene.col2)
            createRoomScene.sendMes()
        }

        onXyChanged_connect: {
            joinRoomScene.row1 = first_row
            joinRoomScene.col1 = first_col
            joinRoomScene.row2 = _row
            joinRoomScene.col2 = _col
            console.log("11")
            console.log(joinRoomScene.row1,joinRoomScene.col1,joinRoomScene.row2,joinRoomScene.col2)
            joinRoomScene.sendMes()
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

    SpringAnimation {
        id: stone

    }

    SystemDialog {
      id: systemDialog
    }

    CueRoundDialog {
        id: cueRoundDialog
        box.color: "#f0f0f0"
        question.text: "This is not your round!"
        modal: true
        onSelectedOk: {
          cueRoundDialog.quit()
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
    onMoveStoneMes: function(first_row, first_col, _row, _col){
        board.moveStone(first_row, first_col, _row, _col)
    }
}
