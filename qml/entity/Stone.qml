//2021051615172fujiale

//棋子类

import QtQuick 2.0
import Felgo 3.0

SpriteSequence {

    signal stoneClicked

    property int type   //棋子的类型 数字1～7分别代表将，士，相，马，车，炮，兵
    property int theme   //棋子的主题  数字1～4分别代表竹林幽亭，娟秀青花，烟波浩渺，花好月圆
    property int camp   //棋子的阵营 0表示红方，1表示黑方

    property int row   //行  共有10行
    property int col   //列  共有9列

    property bool isExist: true   //棋子是否存在

    id: stone
    visible: isExist
    x: (col - 1) * parent.width/9
    y: (row - 1) * 54
    z: 2
    width: 54
    height: 54
    enabled: false

    Sprite{
        name: "normal"
        source: "../../assets/image/gameImage/" + theme + "-02.png"
        frameCount: 1
        frameX: 54 * (type - 1)
        frameY: 54 * camp
        frameWidth: 54
        frameHeight: 54

    }
}
