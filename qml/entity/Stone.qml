import QtQuick 2.0
import Felgo 3.0

SpriteSequence {
    property int type: 1
    property int theme
    property int camp: 0

    property int row
    property int col

    property bool isExist: true
    property bool isClicked: false

    visible: isExist
    x: (col - 1) * parent.width/9
    y: (row - 1) * 54
    width: 54
    height: 54
    Sprite{
        name: "exist"
        source: "../../assets/image/gameImage/" + theme + "-02.png"
        frameCount: 1
        frameX: 54 * (type - 1)
        frameY: 54 * camp
        frameWidth: 54
        frameHeight: 54
    }
}
