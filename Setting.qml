import QtQuick 2.15

Item {
    width: 480
    height: 854
    Image {
        source: "qrc:/image/01.png"
    }

    Image {
        id: back
        x:30
        y:700
        source: "qrc:/image/back.png"
        TapHandler{
            onTapped: {
                myLoader.sourceComponent=main
            }
        }
    }

    Image {
        x:110
        y:95
        source: "qrc:/image/setting.png"
    }

    Image {
        x:20
        y:300
        source: "qrc:/image/music.png"
    }

    Image {
        x:20
        y:400
        source: "qrc:/image/chessboard.png"
    }
}
