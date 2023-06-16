import QtQuick 2.15
import Felgo 3.0
import QtMultimedia 5.15
import "../common"

// Setting SCENE

SceneBase {
    id: settingScene
    anchors.fill: parent
    BackgroundImage {
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/image/01.png"
    }
    Image {
        id: back
        x:30
        y:700
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
        x:20
        y:300
        width: 230
        source: "../../assets/image/music.png"
    }

    Image {
        x:20
        y:400
        source: "../../assets/image/chessboard.png"
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
        x: musicImg.x + musicImg.width
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
