import QtQuick 2.0
import Felgo 3.0

Item {

    signal gameAgainMes

    id: dialog
    // if the parent is a Scene, we can fill the whole screen with gameWindowAnchorItem
    anchors.fill: parent.gameWindowAnchorItem ? parent.gameWindowAnchorItem : parent
    // we need to disable this item if it is invisible, then all the contained MouseAreas are also disabled
    enabled: visible
    // by default, the dialog is invisible
    visible: false
    property int winCamp: 0

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
    MouseArea {
        anchors.fill: parent
        onClicked: {
            dialog.visible = false
            dialog.gameAgainMes()
        }
    }

    // visible overlay, only visible if it's a modal dialog
    Rectangle {
        id: overlay
        anchors.fill: parent
        color: "#000"
    }

    Image {
        //        visible: false
        id: fan
        y: 200
        width: 480
        height: 306
        source: "../../assets/image/gameImage/fan5.png"
        Image {
            id: win
            x: 50
            y: 60
            width: 367
            height: 146
            source: "../../assets/image/gameImage/win" + winCamp + ".png"
        }
    }

    // animation to show the dialog
    ParallelAnimation {
        id: showAnimation
        NumberAnimation {
            target: fan
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
            target: fan
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
