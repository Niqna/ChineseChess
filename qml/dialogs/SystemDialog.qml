import QtQuick 2.15
import Felgo 3.0
import "../scenes"

Item {

    signal disConnectSig

    id: dialog
    // if the parent is a Scene, we can fill the whole screen with gameWindowAnchorItem
    anchors.fill: parent.gameWindowAnchorItem ? parent.gameWindowAnchorItem : parent
    // we need to disable this item if it is invisible, then all the contained MouseAreas are also disabled
    enabled: visible
    // by default, the dialog is invisible
    visible: false

    // show function
    function show() {
        // set the dialog visible to enable it and start show animation
        initSprite()
        dialog.visible = true
        showAnimation.start()
    }

    // hide function
    function hide() {
        // start hide animation, the dialog will be set invisible once the animation has finished
        hideAnimation.start()
    }

    function initSprite() {
        // start hide animation, the dialog will be set invisible once the animation has finished
        cancel.jumpTo("false")
        cancel.goalSprite = "false"
        restart.jumpTo("false")
        restart.goalSprite = "false"
        setting.jumpTo("false")
        setting.goalSprite = "false"
        help.jumpTo("false")
        help.goalSprite = "false"
        backmemu.jumpTo("false")
        backmemu.goalSprite = "false"
    }

    // visible overlay, only visible if it's a modal dialog
    Rectangle {
        id: overlay
        //        visible: dialog.modal
        anchors.fill: parent
        color: "#000"
    }

    Image {
        id: juanzhou
        anchors.horizontalCenter: parent.horizontalCenter
        y: 180
        source: "../../assets/image/1-4.png"

        SpriteSequence {
            id: cancel
            x: 70
            y: 100
            width: 217
            height: 55
            goalSprite: "false"
            Sprite{
                name: "false"
                source: "../../assets/image/gameImage/dialog1.png"
                frameCount: 1
                frameX: 0
                frameY: 0
                frameWidth: 217
                frameHeight: 55
            }
            Sprite{
                name: "true"
                source: "../../assets/image/gameImage/dialog2.png"
                frameCount: 1
                frameX: 0
                frameY: 0
                frameWidth: 217
                frameHeight: 55
            }
            TapHandler {
                onTapped: {
                    if(cancel.goalSprite === "false"){
                        initSprite()
                        cancel.jumpTo("true")
                        cancel.goalSprite = "true"

                    } else {
                        hide()
                    }
                }
            }
        }

        SpriteSequence {
            id: restart
            x: 70
            y: 175
            width: 217
            height: 55
            goalSprite: "false"
            Sprite{
                name: "false"
                source: "../../assets/image/gameImage/dialog1.png"
                frameCount: 1
                frameX: 0
                frameY: 55
                frameWidth: 217
                frameHeight: 55
            }
            Sprite{
                name: "true"
                source: "../../assets/image/gameImage/dialog2.png"
                frameCount: 1
                frameX: 0
                frameY: 55
                frameWidth: 217
                frameHeight: 55
            }
            TapHandler {
                onTapped: {
                    if(restart.goalSprite === "false"){
                        initSprite()
                        restart.jumpTo("true")
                        restart.goalSprite = "true"

                    } else {
                        gameScene.init()
                        hide()
                    }
                }
            }
        }

        SpriteSequence {
            id: help
            x: 70
            y: 250
            width: 217
            height: 55
            goalSprite: "false"
            Sprite{
                name: "false"
                source: "../../assets/image/gameImage/dialog1.png"
                frameCount: 1
                frameX: 0
                frameY: 110
                frameWidth: 217
                frameHeight: 55
            }
            Sprite{
                name: "true"
                source: "../../assets/image/gameImage/dialog2.png"
                frameCount: 1
                frameX: 0
                frameY: 110
                frameWidth: 217
                frameHeight: 55
            }
            TapHandler {
                onTapped: {
                    if(help.goalSprite === "false"){
                        initSprite()
                        help.jumpTo("true")
                        help.goalSprite = "true"

                    } else {
                        gameHelpScene.opacity = 1
                    }
                }
            }
        }

        SpriteSequence {
            id: setting
            x: 70
            y: 325
            width: 217
            height: 55
            goalSprite: "false"
            Sprite{
                name: "false"
                source: "../../assets/image/gameImage/dialog1.png"
                frameCount: 1
                frameX: 0
                frameY: 165
                frameWidth: 217
                frameHeight: 55
            }
            Sprite{
                name: "true"
                source: "../../assets/image/gameImage/dialog2.png"
                frameCount: 1
                frameX: 0
                frameY: 165
                frameWidth: 217
                frameHeight: 55
            }
            TapHandler {
                onTapped: {
                    if(setting.goalSprite === "false"){
                        initSprite()
                        setting.jumpTo("true")
                        setting.goalSprite = "true"

                    } else {
                        gameSettingScene.opacity = 1
                    }
                }
            }
        }

        SpriteSequence {
            id: backmemu
            x: 70
            y: 400
            width: 217
            height: 55
            goalSprite: "false"
            Sprite{
                name: "false"
                source: "../../assets/image/gameImage/dialog1.png"
                frameCount: 1
                frameX: 0
                frameY: 220
                frameWidth: 217
                frameHeight: 55
            }
            Sprite{
                name: "true"
                source: "../../assets/image/gameImage/dialog2.png"
                frameCount: 1
                frameX: 0
                frameY: 220
                frameWidth: 217
                frameHeight: 55
            }
            TapHandler {
                onTapped: {
                    if(backmemu.goalSprite === "false"){
                        initSprite()
                        backmemu.jumpTo("true")
                        backmemu.goalSprite = "true"

                    } else {
                        dialog.hide()
                        backButtonPressed()

                    }
                }
            }
        }
    }

    HelpScene {
        id: gameHelpScene
        opacity: 0
        onBackButtonPressed: {
            opacity = 0
        }

    }

    SettingScene {
        id: gameSettingScene
        opacity: 0
        theme: settingScene.theme
        onBackButtonPressed: {
            updateTheme()
            changeTheme()
            opacity = 0
        }
    }

    function changeTheme() {
        settingScene.theme = gameSettingScene.theme
        gameScene.theme = gameSettingScene.theme
        board.boardtheme = gameSettingScene.theme
    }

    // animation to show the dialog
    ParallelAnimation {
        id: showAnimation
        NumberAnimation {
            target: juanzhou
            property: "scale"
            from: 0
            to: 1
            easing.type: Easing.OutBack
            duration: 250
        }
        NumberAnimation {
            target: overlay
            property: "opacity"
            from: 0
            to: 0.2
            duration: 250
        }
    }

    // animation to hide the dialog
    ParallelAnimation {
        id: hideAnimation
        NumberAnimation {
            target: juanzhou
            property: "scale"
            from: 1
            to: 0
            easing.type: Easing.InBack
            duration: 250
        }
        NumberAnimation {
            target: overlay
            property: "opacity"
            from: 0.2
            to: 0
            duration: 250
        }
        onStopped: {
            // set it invisible when the animation has finished to disable MouseAreas again
            dialog.visible = false
        }
    }
}
