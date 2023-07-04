// anthor：
//       2021051615173nieanqin：界面设计、音量控制
//       2021051615172fujiale：界面设计、主题控制

//系统设置界面

import QtQuick 2.15
import Felgo 3.0
// Setting SCENE

SceneBase {
    property int theme: 1   //主题  数字1～4分别代表竹林幽亭、娟秀青花、烟波浩渺、花好月圆  默认是竹林幽亭

    id: settingScene
    anchors.fill: parent

    // func：更新主题
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

    // 背景图片
    BackgroundImage {
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/image/01.png"
    }

    //返回按钮
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

    // 游戏设置标题字样
    Image {
        x:110
        y:95
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../../assets/image/setting.png"
    }

    // 声音字样
    Image {
        id: musicImg
        x:10
        y:300
        width: 230
        source: "../../assets/image/music.png"
    }

    // 棋盘选择字样
    Image {
        id:chessboardImg
        x:10
        y:400
        source: "../../assets/image/chessboard.png"
    }

    //  左箭头，点击切换到上一主题
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

    // 主题
    SpriteSequence {
        id: chooseTheme
        x: left.x + left.width
        y: left.y
        width: 182
        height: 70

        // 1号主题：竹林幽亭
        Sprite{
            name: "theme1"
            source: "../../assets/image/theme.png"
            frameCount: 1
            frameX: 0
            frameY: 0
            frameWidth: 182
            frameHeight: 70
        }

        // 2号主题：娟秀青花
        Sprite{
            name: "theme2"
            source: "../../assets/image/theme.png"
            frameCount: 1
            frameX: 0
            frameY: 70
            frameWidth: 182
            frameHeight: 70
        }

        // 3号主题：烟波浩渺
        Sprite{
            name: "theme3"
            source: "../../assets/image/theme.png"
            frameCount: 1
            frameX: 0
            frameY: 140
            frameWidth: 182
            frameHeight: 70
        }

        // 4号主题：花好月圆
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

    //  右箭头，点击切换到下一主题
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

    // 音量控制滑动条
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
