import QtQuick 2.15
import Felgo 3.0
import QtMultimedia 5.15
import "../common"

// SOLO SCENE

SceneBase {

    // signal indicating that the gameScene should be displayed
    signal gamePressed

    id: soloScene
    anchors.fill: parent
    BackgroundImage {
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/image/01.png"
    }
    Image {
        id: back
        y:750
        source: "../../assets/image/back.png"
        TapHandler{
            onTapped: {
                backButtonPressed()
            }
        }
    }

    Image {
        id: start
        x:320
        y:750
        source: "../../assets/image/start.png"
        TapHandler{
            onTapped: {
                gamePressed()
            }
        }
    }


    Image {
        x:110
        y:95
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../../assets/image/create.png"
    }

    Image {
        id: musicImg
        x:20
        y:300

        source: "../../assets/image/choose.png"
    }

}
