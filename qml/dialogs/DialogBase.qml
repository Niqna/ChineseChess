//anthor：2021051615172fujiale

// 对话框基类

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

    // alias to access the box
    property alias box: box
    // alias to access the question text
    property alias question: question

    // property to make this dialog modal and prevents selecting anything behind it
    property bool modal: false

    // signals emitted if a button has been pressed
    signal selectedOk
    signal selectedCancel

    // show function
    function show() {
        // set the dialog visible to enable it and start show animation
        dialog.visible = true
        showAnimation.start()
    }

    // hide function
    function hide() {
        // start hide animation, the dialog will be set invisible once the animation has finished
        hideAnimation.start()
    }

    // this component prevents selecting anything behind the dialog, only enabled if it's a modal dialog
    TapHandler {
        onTapped: {
            enabled: dialog.modal
        }
    }

    // visible overlay, only visible if it's a modal dialog
    Rectangle {
        id: overlay
        visible: dialog.modal
        anchors.fill: parent
        color: "#000"
    }

    // the box containing dialog text and buttons
    Rectangle {
        id: box
        width: 200
        height: 100
        color: "#fff"
        border.width: 1
        border.color: "#000"
        radius: 10
        anchors.centerIn: parent

        Text {
            id: question
            text: "Question?"
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -20
            color: "#000"
        }

        SimpleButton {
            text: "OK"
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            onClicked: {
                // emit signal and hide dialog if button is selected
                dialog.selectedOk()
                dialog.hide()
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
