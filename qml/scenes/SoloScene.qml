import QtQuick 2.15
import Felgo 3.0
import QtMultimedia 5.15
import "../common"

// SOLO SCENE

SceneBase {

    // signal indicating that the gameScene should be displayed
    signal gamePressed

    property bool isBlack: false

    id: soloScene
    anchors.fill: parent

    BackgroundImage {
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/image/01.png"
    }

    Image {
        id: title
        x:110
        y:95
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../../assets/image/create.png"
    }

    Image {
        id: choose1
        x: 0
        y: 250
        source: "../../assets/image/choose.png"
    }

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

    Image {
        id: start
        anchors.right: soloScene.right
        y:750
        source: "../../assets/image/start.png"
        TapHandler{
            onTapped: {
                gamePressed()
                gameScene.init()
            }
        }
    }
}
