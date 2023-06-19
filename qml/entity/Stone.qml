import QtQuick 2.0
import Felgo 3.0

SpriteSequence {

    signal stoneClicked

    property int type
    property int theme
    property int camp

    property int row
    property int col
    property int rowcol

    property bool isExist: true
    property bool isClicked: false

    id: stone
    visible: isExist
    x: (col - 1) * parent.width/9
    y: (row - 1) * 54
    z: 2
    width: 54
    height: 54
    Keys.priority: Keys.AfterItem
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
