import QtQuick 2.0
import Felgo 3.0

SpriteSequence {
    property int diameter: 54
    property int type: 1
    property int theme
    property int camp: 1

    property int row
    property int col

    property bool isExist: true

    visible: isExist
    x: (row - 1) * diameter
    y: (col - 1) * diameter
    width: diameter
    height: diameter
    Sprite{
        name: "exist"
        source: "../../assets/image/gameImage/" + theme + "-02.png"
        frameCount: 1
        frameX: diameter * (type - 1)
        frameY: diameter * camp
        frameWidth: diameter
        frameHeight: diameter
    }
}
