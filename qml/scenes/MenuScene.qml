import Felgo 3.0
import QtQuick 2.15
import QtMultimedia 5.15
import "../common"

SceneBase {
    id: menuScene

    // signal indicating that the localScene should be displayed
    signal soloPressed
    // signal indicating that the localScene should be displayed
    signal localPressed
    // signal indicating that the helpScene should be displayed
    signal helpPressed
    // signal indicating that the settingScene should be displayed
    signal settingPressed

    anchors.fill: parent

    BackgroundImage {
        anchors.fill: parent.gameWindowAnchorItem
        source: "../../assets/image/bg2.png"
    }

    Image {
        id: soloScene
        x: menuScene.width * 3 / 5
        y: menuScene.y
        width: menuScene.width/3
        height: menuScene.height/5
        source: "../../assets/image/7-1.png"
        Image {
            x:30
            y:30
            width: parent.width-50
            height: parent.height-50
            source: "../../assets/image/8-1.png"
            TapHandler{
                onTapped: {
                    onclicked: soloPressed()
                }
            }
        }
    }

    Image {
        id: localScene
        x: soloScene.x - soloScene.width/2
        y: soloScene.y + soloScene.height * 5 / 6
        width: soloScene.width
        height: soloScene.height
        source: "../../assets/image/7-2.png"
        Image {
            x:30
            y:30
            width: parent.width-50
            height: parent.height-50
            source: "../../assets/image/8-2.png"
        }
        TapHandler{
            onTapped: {
                onclicked: localPressed()
            }
        }
    }

    Image {
        id: helpScene
        x: soloScene.x
        y: localScene.y + localScene.height * 5 / 6
        width: soloScene.width
        height: soloScene.height
        source: "../../assets/image/7-3.png"
        Image {
            x:30
            y:50
            width: parent.width-50
            height: parent.height-110
            source: "../../assets/image/8-3.png"
        }
        TapHandler{
            onTapped: {
                onclicked: helpPressed()
            }
        }
    }

    Image {
        id: settingScene
        x: localScene.x
        y: helpScene.y + helpScene.height * 5 / 6
        width: helpScene.width
        height: helpScene.height
        source: "../../assets/image/7-4.png"
        Image {
            x:40
            y:50
            width: parent.width-50
            height: parent.height-110
            source: "../../assets/image/8-4.png"
        }
        TapHandler{
            onTapped: {
                onclicked: settingPressed()
            }
        }
    }
}
