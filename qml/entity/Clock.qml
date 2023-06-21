import QtQuick 2.15
import Felgo 3.0

//Clock

Rectangle {
    id: clock
    width: 125
    height: 28
    color: "transparent"
    property int theme: 1
    property int secondNum1: 0
    property int secondNum2: 0
    property int minuteNum1: 0
    property int minuteNum2: 0

    function init() {
        secondNum1 = 0
        secondNum2 = 0
        minuteNum1 = 0
        minuteNum2 = 0
    }

    function start() {
        time_run.start()
    }

    function stop() {
        time_run.stop()
    }

    AnimatedSprite {
        id: second1
        width: 25
        height: 28
        anchors.right: clock.right
        source: "../../assets/image/gameImage/" + theme + "-03.png"
        frameX: secondNum1 * 25
        frameY: 0
        frameWidth: 25
        frameHeight: 28
    }

    AnimatedSprite {
        id: second2
        width: 25
        height: 28
        anchors.right: second1.left
        source: "../../assets/image/gameImage/" + theme + "-03.png"
        frameWidth: 25
        frameHeight: 28
        frameX: secondNum2 * 25
        frameY: 0
    }

    AnimatedSprite {
        id: dot
        width: 25
        height: 28
        anchors.right: second2.left
        source: "../../assets/image/gameImage/" + theme + "-03.png"
        frameWidth: 25
        frameHeight: 28
        frameX: 250
        frameY: 0
    }

    AnimatedSprite {
        id: minute1
        width: 25
        height: 28
        anchors.right: dot.left
        source: "../../assets/image/gameImage/" + theme + "-03.png"
        frameWidth: 25
        frameHeight: 28
        frameX: minuteNum1 * 25
        frameY: 0
    }
    AnimatedSprite {
        id: minute2
        width: 25
        height: 28
        anchors.right: minute1.left
        source: "../../assets/image/gameImage/" + theme + "-03.png"
        frameWidth: 25
        frameHeight: 28
        frameX: minuteNum2 * 25
        frameY: 0
    }

    Timer {
        id: time_run
        interval: 1000
        repeat: true
        running: false
        triggeredOnStart: true
        onTriggered: {
            secondNum1++
            if(secondNum1 > 9) {
                secondNum1 = 0
                secondNum2++
                if(secondNum2 > 5) {
                    secondNum2 = 0
                    minuteNum1++
                    if(minuteNum1 > 9) {
                        minuteNum1 =0
                        minuteNum2 ++
                        if(minuteNum2 > 5)
                           stop()
                    }
                }

            }

        }
    }
}
