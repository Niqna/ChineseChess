import QtQuick 2.15
import QtQuick.Controls 2.0

Item {
    id:onlinepage
    width: 480
    height: 854
    Image {
        id: bg
        source: "qrc:/image/01.png"
        anchors.fill: parent
        Text {
            width: 180; height: 48
            anchors.horizontalCenter: parent.horizontalCenter
            y:95
            color: "white"
            text: '联机对弈'
            font.pixelSize: 40
        }
    }

    Image {
        id: juanzhou
        anchors.horizontalCenter: parent.horizontalCenter
        y:180
        source: "qrc:/image/1-4.png"

        Image {
            id: bluetooth
            source: "qrc:/image/04.png"
            anchors.horizontalCenter: parent.horizontalCenter
            width: 250; height: 80
            y:110
            Text {
                x:90; y:20
                color: "white"
                text: '蓝牙'
                font.pixelSize: 30
                anchors.centerIn: parent.Center
            }
        }
        Image {
            id: localbg
            source: "qrc:/image/04.png"
            anchors.horizontalCenter: parent.horizontalCenter
            width: 250; height: 80
            y:220
            Text {
                x:75; y:20
                color: "white"
                text: '局域网'
                font.pixelSize: 30
                anchors.centerIn: parent.Center
                TapHandler{
                    onTapped: {
                        myLoader.sourceComponent=local
                    }
                }
            }
        }

        Image {
            id: back
            source: "qrc:/image/04.png"
            anchors.horizontalCenter: parent.horizontalCenter
            width: 250; height: 80
            y:340
            Text {
                x:90; y:20
                color: "white"
                text: '返回'
                font.pixelSize: 30
                anchors.centerIn: parent.Center
                TapHandler{
                    onTapped: {
                        myLoader.sourceComponent=main
                    }
                }
            }
        }
    }
}
