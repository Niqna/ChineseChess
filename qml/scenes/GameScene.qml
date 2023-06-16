import QtQuick 2.15
import Felgo 3.0
import "../common"
import "../entity"

// EMPTY SCENE

SceneBase {

    property int theme:  1

    id: gameScene

    anchors.fill: parent
    BackgroundImage {
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/image/gameImage/" + theme + "-01.png"
    }

    Image {
        id: back
        x: 100
        y:750
        source: "../../assets/image/back.png"
        TapHandler{
            onTapped: {
                backButtonPressed()
            }
        }
    }

    Image {
        id: help
        x: 135
        y: 700
        width: 65
        height:130
        source: "../../assets/image/gameImage/" + theme + "-04.png"

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
        boardtheme: theme

    }

    SpringAnimation {
        id: stone

    }

    //    Repeater {

    //        model: ["jiang", "shi", "xiang", "ma", "ju", "pao", "bin"]
    //        SpriteSequence {
    //            id: modelDate
    //            width: diameter
    //            height: diamter
    //            y: 130
    //            goalSprite: ""
    //            anchors.horizontalCenter: parent.horizontalCenter
    //            Sprite{
    //                name: "jiang"
    //                source: "../../assets/image/gameImage/1-02.png"
    //                frameCount: 1
    //                frameWidth: 54
    //                frameHeight: 54
    //            }
    //        }
    //    }






    //        Sprite{
    //            name: "pao"
    //            source: "../../assets/image/gameImage/1-02.png"
    //            frameCount: 1
    //            frameX: 264
    //            frameWidth: 52
    //            frameHeight: 52
    //        }
    //        Sprite{
    //            name: "bing"
    //            source: "../../assets/image/gameImage/1-02.png"
    //            frameCount: 1
    //            frameX: 316
    //            frameWidth: 52
    //            frameHeight: 52
    //        }
    //    }

    //    Stone {

    //    }

}
