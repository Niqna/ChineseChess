//anthor：2021051615172fujiale

//计时器类
import QtQuick 2.0
import Felgo 3.0

//Clock

Rectangle {
    id: clock
    width: 125
    height: 28
    color: "transparent"
    property int theme: gameScene.theme   //数字图片的主题  数字1～4分别代表竹林幽亭，娟秀青花，烟波浩渺，花好月圆
    property int secondNum1: 0    //秒的个位数字 每过1秒加1 到10后归零
    property int secondNum2: 0    //秒的十位数字 每过10秒加1 到6后归零
    property int minuteNum1: 0    //分的个位数字 每过60秒加1 到10后归零
    property int minuteNum2: 0    //分的十位数字 每过1分钟加1 到6后归零

    //func：将计时器初始化为00：00
    function init() {
        secondNum1 = 0
        secondNum2 = 0
        minuteNum1 = 0
        minuteNum2 = 0
    }

    //func：开始计时
    function start() {
        time_run.start()
    }

    //停止计时
    function pause() {
        time_run.stop()
    }

    //秒的个位图片
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

    //秒的十位图片
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

    //点:的图片
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

    //分的个位图片
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

    //分的十位图片
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

    //计时器，启动后每过一秒使秒加1
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
