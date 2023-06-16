import QtQuick 2.15
import Felgo 3.0
import QtMultimedia 5.15
import "../common"

// Setting SCENE

SceneBase {

    property int theme
    id: settingScene
    anchors.fill: parent
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
                switch(theme){
                case 1:
                    theme = 4
                    chooseTheme.jumpTo("theme4")
                    break
                case 2:
                    theme = 1
                    chooseTheme.jumpTo("theme1")
                    break
                case 3:
                    theme = 2
                    chooseTheme.jumpTo("theme2")
                    break
                case 4:
                    theme = 3
                    chooseTheme.jumpTo("theme3")
                    break
                }
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
                switch(theme){
                case 3:
                    theme = 4
                    chooseTheme.jumpTo("theme4")
                    break
                case 4:
                    theme = 1
                    chooseTheme.jumpTo("theme1")
                    break
                case 1:
                    theme = 2
                    chooseTheme.jumpTo("theme2")
                    break
                case 2:
                    theme = 3
                    chooseTheme.jumpTo("theme3")
                    break
                }
            }
        }
    }

    MediaPlayer{
        id:bgm
//        autoPlay:false
        source: "../../assets/music/bg4.mp3"
    }

    Timer{
        id:musictimer
        interval: 100
        running: true
        repeat: true
        onTriggered: {
            bgm.play()
            running=false
        }
    }

    GameSlider{
        x: musicImg.x + musicImg.width - 20
        y: musicImg.y + musicImg.height/4
        width: settingScene.width - 260
        id:slider
        value: 1
        orientation: Qt.Horizontal
        onValueChanged: {
            bgm.volume=value
            console.log(value)
        }
    }

}
