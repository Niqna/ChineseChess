import QtQuick 2.15
import Felgo 3.0

import "../common"

// Setting SCENE

SceneBase {
    property int theme: 1

    id: settingScene
    anchors.fill: parent

    function updateTheme() {
        if(theme === 1)
            chooseTheme.jumpTo("theme1")
        if(theme === 2)
            chooseTheme.jumpTo("theme2")
        if(theme === 3)
            chooseTheme.jumpTo("theme3")
        if(theme === 4)
            chooseTheme.jumpTo("theme4")
    }

    BackgroundImage {
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/image/01.png"
    }

    Image {
        id: back
        y:750
        source: "../../assets/image/back.png"
        TapHandler{
            onTapped: {
                updateTheme()
                backButtonPressed()
            }
        }
    }

    Image {
        x:110
        y:95
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../../assets/image/setting.png"
    }

    Image {
        id: musicImg
        x:10
        y:300
        width: 230
        source: "../../assets/image/music.png"
    }

    Image {
        id:chessboardImg
        x:10
        y:400
        source: "../../assets/image/chessboard.png"
    }

    Image {
        id: left
        x:chessboardImg.width - 20
        y:chessboardImg.y-10
        source: "../../assets/image/3-1.png"
        TapHandler{
            onTapped: {
                theme = (theme + 2) % 4 + 1
                updateTheme()
            }
        }
    }

    SpriteSequence {
        id: chooseTheme
        x: left.x + left.width
        y: left.y
        width: 182
        height: 70
        Sprite{
            name: "theme1"
            source: "../../assets/image/theme.png"
            frameCount: 1
            frameX: 0
            frameY: 0
            frameWidth: 182
            frameHeight: 70
        }
        Sprite{
            name: "theme2"
            source: "../../assets/image/theme.png"
            frameCount: 1
            frameX: 0
            frameY: 70
            frameWidth: 182
            frameHeight: 70
        }
        Sprite{
            name: "theme3"
            source: "../../assets/image/theme.png"
            frameCount: 1
            frameX: 0
            frameY: 140
            frameWidth: 182
            frameHeight: 70
        }
        Sprite{
            name: "theme4"
            source: "../../assets/image/theme.png"
            frameCount: 1
            frameX: 0
            frameY: 210
            frameWidth: 182
            frameHeight: 70
        }
    }

    Image {
        id: right
        x: chooseTheme.x + chooseTheme.width
        y:chessboardImg.y-10
        source: "../../assets/image/3-2.png"
        TapHandler{
            onTapped: {
                theme = theme % 4 + 1
                updateTheme()
            }
        }
    }

    GameSlider{
        id:slider
        x: musicImg.x + musicImg.width - 20
        y: musicImg.y + musicImg.height/4
        width: settingScene.width - 260
        value: bgm.volume
        orientation: Qt.Horizontal
        onValueChanged: {
            bgm.volume=value
        }
    }
}
