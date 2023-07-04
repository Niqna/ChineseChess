//anthor: 2021051615172fujiale

//询问是否继续游戏的对话框
//若选择是则继续游戏
//反之，返回主菜单界面

import QtQuick 2.15
import Felgo 3.0

Item {

    id: dialog
    // if the parent is a Scene, we can fill the whole screen with gameWindowAnchorItem
    anchors.fill: parent.gameWindowAnchorItem ? parent.gameWindowAnchorItem : parent
    // we need to disable this item if it is invisible, then all the contained MouseAreas are also disabled
    enabled: visible
    // by default, the dialog is invisible
    visible: false
    property int winCamp: 0

    // signals emitted if a button has been pressed
    signal selectedOk
    signal selectedCancel

    // show function
    function show() {
        // set the dialog visible to enable it and start show animation
        dialog.visible = true
        showAnimation.start()
    }

    //    // hide function
    function hide() {
        // start hide animation, the dialog will be set invisible once the animation has finished
        hideAnimation.start()
    }

    // this component prevents selecting anything behind the dialog, only enabled if it's a modal dialog
    TapHandler {
        onTapped: {
            dialog.visible = false
        }
    }

    // visible overlay, only visible if it's a modal dialog
    Rectangle {
        id: overlay
        anchors.fill: parent
        color: "#000"
    }

    Image {
        id: box
        x: 150
        y: 225
        width: 186
        height: 349
        source: "../../assets/image/gameImage/again_box.png"
        Image {
            anchors.left: box.left
            anchors.leftMargin: 10
            anchors.bottom: box.bottom
            anchors.bottomMargin: 10
            width: 50
            height: 54
            source: "../../assets/image/gameImage/again1.png"
            Image {
                width: 50
                height: 54
                source: "../../assets/image/gameImage/again_yes.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        // emit signal and hide dialog if button is selected
                        dialog.selectedOk()
                        dialog.hide()
                    }
                }
            }
        }
        Image {
            anchors.right: box.right
            anchors.rightMargin: 10
            anchors.bottom: box.bottom
            anchors.bottomMargin: 10
            width: 50
            height: 54
            source: "../../assets/image/gameImage/again1.png"
            Image {
                width: 50
                height: 54
                source: "../../assets/image/gameImage/again_no.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        // emit signal and hide dialog if button is selected
                        dialog.selectedCancel()
                        dialog.hide()
                    }
                }
            }
        }

    }

    // animation to show the dialog
    ParallelAnimation {
        id: showAnimation
        NumberAnimation {
            target: box
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
            target: box
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
