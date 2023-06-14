import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0

Window {
    id:root
    width: 480
    height: 854
    visible: true
    title: qsTr("ChineseChese")

    //main page
    Item{
        id:start
        visible: true
        Image {
            id: bgImage
            source: "qrc:/image/bg2.png"
        }

        //单人对弈、联机对弈、帮助、设置按件
        Image {
            x:280
            y:40
            id: imagesingel
            source: "qrc:/image/7-1.png"
            Image {
                x:35
                y:30
                width: imagesingel.width-60
                height: imagesingel.height-60
                source: "qrc:/image/8-1.png"
            }
        }

        Image {
            x:250
            y:220
            id: imagesingel2
            source: "qrc:/image/7-2.png"
            Image {
                x:35
                y:40
                width: imagesingel2.width-60
                height: imagesingel2.height-60
                source: "qrc:/image/8-2.png"
            }
        }

        Image {
            x:200
            y:400
            id: imagesingel3
            source: "qrc:/image/7-3.png"
            Image {
                x:15
                y:35
                width: imagesingel3.width-30
                height: imagesingel3.height-70
                source: "qrc:/image/8-3.png"
            }
            TapHandler{
                onTapped: {
                    help.visible = true
                }
            }
        }


        Image {
            x:250
            y:540
            id: imagesingel4
            source: "qrc:/image/7-4.png"
            Image {
                x:40
                y:40
                width: imagesingel4.width-60
                height: imagesingel4.height-90
                source: "qrc:/image/8-4.png"
            }
        }
    }


    //help page
    //Game introdution
    Help{
        id:help
    }

//    property int i: 1
//    Item {
//        id:gameIntro
//        width: 480
//        height: 854
//        visible: false
//        Image {
//            id: bg2
//            source: "qrc:/image/01.png"
//            anchors.fill: parent
//        }
//        Image {
//            id: left
//            x:40
//            y:90
//            source: "qrc:/image/3-1.png"
//            TapHandler{
//                onTapped: {
//                    if(i>1&&i<4){
//                        i--
//                    }
//                    else{
//                        i=3
//                    }
//                    if(i===1){
//                        rect1.visible=true
//                        rect2.visible=false
//                        rect3.visible=false
//                    }
//                    if(i===2){
//                        rect2.visible=true
//                        rect1.visible=false
//                        rect3.visible=false
//                    }
//                    if(i===3){
//                        rect3.visible=true
//                        rect2.visible=false
//                        rect1.visible=false
//                    }

//                    title.source="qrc:/image/help"+i+".png"
//                }
//            }
//        }

//        Image {
//            id: right
//            x:390
//            y:90
//            source: "qrc:/image/3-2.png"
//            TapHandler{
//                onTapped: {
//                    if(i<3){
//                        i++
//                    }
//                    else{
//                        i=1
//                    }
//                    if(i===1){
//                        rect1.visible=true
//                        rect2.visible=false
//                        rect3.visible=false
//                    }
//                    if(i===2){
//                        rect3.visible=true
//                        rect1.visible=false
//                        rect2.visible=false
//                    }
//                    if(i===3){
//                        rect2.visible=true
//                        rect1.visible=false
//                        rect3.visible=false
//                    }

//                    title.source="qrc:/image/help"+i+".png"
//                }
//            }
//        }
//        Image {
//            id: title
//            x:110
//            y:95
//            source: "qrc:/image/help1.png"
//        }
//        Rectangle{
//            id:rect1
//            x:45
//            y:220
//            width: 400
//            height: 520
//            color: Qt.rgba(0,0,0,0)
//            clip: true
//            Text {
//                id: introduction_text
//                visible: true
//                width: 380
//                color: "black"
//                font.pixelSize: 30
//                x:15
//                //y:-vbar.position*height
//                text:'中国象棋是起源于中国的一种棋，属于二人对抗性游戏的一种，'
//                     +'在中国有着悠久的历史。由于用具简单，趣味性强，成为流行极'
//                     +'为广泛的棋艺活动。
//    中国象棋使用方形格状棋盘，圆形棋子共有32个，红黑二色各有16个棋子，摆放和活动在'
//                +'交叉点上。比赛开始后，双方交替行棋，消灭'+'掉对方的皇帝棋子'
//                +'("将"或"帅")即可获得胜利。'
//                wrapMode:Text.WrapAnywhere
//            }
//        }

//        Rectangle{
//            id:rect2
//            x:45
//            y:220
//            width: 400
//            height: 520
//            color: Qt.rgba(0,0,0,0)
//            clip: true
//            visible: false
//            Text {
//                id: rules_text
//                visible: true
//                width: 380
//                color: "black"
//                font.pixelSize: 30
//                x:15
//                y:-vbar1.position*height
//                text:'棋子
//棋子共有三十二个，分为红、黑两组，每组共十六个，各分七种，其名称和数目如下：
//红棋子：帅一个，车、马、炮、相、仕各两个，兵五个。
//黑棋子：将一个，车、马、炮、象、士各两个，卒五个。
//帅/将
//红方为“帅”，黑方为“将”。帅和将是棋中的首脑，是双方竭力争夺的目标。
//它只能在“九宫”之内活动，可上可下，可左可右，每次走动只能按竖线或横线走动一格。帅与将不能在同一直线上直接对面，否则走方判负。
//仕/士
//红方为“仕”，黑方为“士”。它也只能在九宫内走动。它的行棋路径只能是九宫内的斜线。士一次只能走一个斜格。
//象/相
//红方为“相”，黑方为“象”。它的走法是每次循对角线走两格，俗称“象飞田”。相（象）的活动范围限于“河界”以内的本方阵地，不能过河，且如果它走的“田”字中央有一个棋子，就不能走，俗称“塞象眼”。
//车（jū ）
//车在象棋中威力最大，无论横线、竖线均可行走，只要无子阻拦，步数不受限制。俗称“车行直路”。因此，一车最多可以控制十七个点，故有“一车十子寒”之称。
//炮
//炮在不吃子的时候，走动与车完全相同，但炮在吃子时，必须跳过一个棋子，自方的和敌方的都可以，俗称“炮打隔子”、“翻山”。
//马
//马走动的方法是一直一斜，即先横着或直着走一格，然后再斜着走一个对角线，俗称“马走日”。如果在要去的方向有别的棋子挡住，马就无法走过去，俗称“蹩马腿”。
//兵/卒
//红方为“兵”，黑方为“卒”。
//兵（卒）只能向前走，不能后退，在未过河前，不能横走。过河以后还可左、右移动，但也只能一次一步，即使这样，兵（卒）的威力也大大增强，故有“小卒过河顶大车”之说。'
//                wrapMode:Text.WrapAnywhere
//            }
//            ScrollBar{
//                id:vbar1
//                hoverEnabled: true
//                active: hovered||pressed
//                orientation: Qt.Vertical
//                size:0.2
//                anchors.top: parent.top
//                anchors.right: parent.right
//                anchors.bottom: parent.bottom
//            }
//        }

//        Rectangle{
//            id:rect3
//            x:40
//            y:220
//            width: 400
//            height: 520
//            color: Qt.rgba(0,0,0,0)
//            clip: true
//            visible: false
//            Text {
//                id: about_text
//                visible: true
//                width: 380
//                color: "black"
//                font.pixelSize: 30
//                x:30
//                text:'Version:  V 1.0'
//                wrapMode:Text.WrapAnywhere
//            }
//        }

//        Image {
//            id: back
//            x:30
//            y:700
//            source: "qrc:/image/back.png"
//        }
//    }
}

