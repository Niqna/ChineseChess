import QtQuick 2.15
import Felgo 3.0
import QtQuick.Controls 2.0
import "../common"

// HELP SCENE
SceneBase {
    id: helpScene
    property int i: 1
    anchors.fill: parent

    BackgroundImage {
        anchors.fill: parent.gameWindowAnchorItem
        id: bg2
        source: "../../assets/image/01.png"
    }

    Image {
        id: left
        x: 40
        y: 90
        source: "../../assets/image/3-1.png"
        TapHandler{
            onTapped: {
                switch(i){
                case 2:
                    i = 1
                    text1.visible=true
                    text2.visible=false
                    text3.visible=false
                    break
                case 1:
                    i = 3
                    text3.visible=true
                    text1.visible=false
                    text2.visible=false
                    break
                case 3:
                    i = 2
                    text2.visible=true
                    text1.visible=false
                    text3.visible=false
                    break
                }

                title.source="../../assets/image/help"+i+".png"
            }
        }
    }

    Image {
        id: right
        x:390
        y:90
        source: "../../assets/image/3-2.png"
        TapHandler{
            onTapped: {
                switch(i){
                case 3:
                    i = 1
                    text1.visible=true
                    text2.visible=false
                    text3.visible=false
                    break
                case 2:
                    i = 3
                    text3.visible=true
                    text1.visible=false
                    text2.visible=false
                    break
                case 1:
                    i = 2
                    text2.visible=true
                    text1.visible=false
                    text3.visible=false
                    break
                }
                title.source="../../assets/image/help"+i+".png"
            }
        }
    }
    Image {
        id: title
        x:110
        y:90
        source: "../../assets/image/help1.png"
    }
    GameScrollView{
        id:text1
        x:55
        y:200
        width: 420
        height: 500
        visible: true
        Text {
            font.pixelSize: 25
            text: qsTr("<p>中国象棋是起源于中国的一种棋，<br />
                           属于二人对抗性游戏的一种，在中<br />
                           国有着悠久的历史。由于用具简单<br />
                           ，趣味性强，成为流行极为广泛的<br />
                           棋艺活动。中国象棋使用方形格状<br />
                           棋盘，圆形棋子共有32个，红黑二<br />
                           色各有16个棋子，摆放和活动在交<br />
                           叉点上。比赛开始后，双方交替行<br />
                           棋，消灭掉对方的皇帝棋子(将/帅)<br />
                           即可获得胜利。</p>")
        }
    }

    GameScrollView{
        id:text2
        x:55
        y:200
        width: 450
        height: 500
        visible: false
        Text {
            font.pixelSize: 25
            text: qsTr("<b>棋子</b>
                        <p>棋子共有三十二个，分为红、黑两<br />
                           组，每组共十六个，各分七种，其<br />
                           名称和数目如下：<br />
                           红棋子：帅一个，车、马、炮、<br />
                           相、仕各两个，兵五个。<br />
                           黑棋子：将一个，车、马、炮、<br />
                           象、士各两个，卒五个。</p><br />
                        <b>帅/将</b>
                        <p>红方为“帅”，黑方为“将”。<br />
                           帅和将是棋中的首脑，是双方竭力<br />
                           争夺的目标。<br />
                           它只能在“九宫”之内活动，可上可<br />
                           下，可左可右，每次走动只能按竖<br />
                           线或横线走动一格。帅与将不能在<br />
                           同一直上线直接对面，否则走方判<br />
                           负。</p><br />
                        <b>仕/士</b>
                        <p>红方为“仕”，黑方为“士”。<br />
                           它也只能在九宫内走动。它的行棋<br />
                           路径只能是九宫内的斜线。士一次<br />
                           只能走一个斜格。</p><br />
                        <b>象/相</b>
                        <p>红方为“相”，黑方为“象”。<br />
                           它的走法是每次循对角线走两格，<br />
                           俗称“象飞田”。相(象)的活动范围<br />
                           限于“河界”以内的本方阵地，不能<br />
                           过河，且如果它走的“田”字中央有<br />
                           一个棋子，就不能走，俗称 “塞象<br />
                           眼”。</p><br />
                        <b>车（jū ）</b>
                        <p>车在象棋中威力最大，无论横线、<br />
                           竖线均可行走，只要无子阻拦，步<br />
                           数不受限制。俗称“车行直路”。因<br />
                           此，一车最多可以控制十七个点，<br />
                           故有“一车十子寒”之称。</p><br />
                        <b>炮</b>
                        <p>炮在不吃子的时候，走动与车完全<br />
                           相同，但炮在吃子时，必须跳过一<br />
                           个棋子，自方的和敌方的都可以，<br />
                           俗称 “炮打隔子”、“翻山”。</p><br />
                        <b>马</b>
                        <p>马走动的方法是一直一斜，即先横<br />
                           着或直着走一格，然后再斜着走一<br />
                           个对角线，俗称“马走日”。如果在<br />
                           要去的方向有别的棋子挡住，马就<br />
                           无法走过去，俗称“蹩马腿”。</p><br />
                        <b>兵/卒</b>
                        <p>红方为“兵”，黑方为“卒”。<br />
                           兵（卒）只能向前走，不能后退，<br />
                           在未过河前，不能横走。过河以后<br />
                           还可左、右移动，但也只能一次一<br />
                           步，即使这样，兵（卒）的威力也<br />
                           大大增强，故有“小卒过河顶大车”<br />
                           之说。</p><br />")
        }
    }

    GameScrollView{
        id:text3
        x:55
        y:200
        width: 400
        height: 500
        visible: false
        Text {
            font.pixelSize: 25
            text:qsTr("<p>Version:  V 1.0</p>
                       <p>Author:   </p>")
//            wrapMode:Text.WrapAnywhere
        }
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


}
