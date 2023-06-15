import QtQuick 2.15

//main page
Item{
    Image {
        id: bgImage
        source: "qrc:/image/bg2.png"
    }

    //单人对弈、联机对弈、帮助、设置按件
    Image {
        x:280
        y:40
        id: image
        source: "qrc:/image/7-1.png"
        Image {
            x:35
            y:30
            width: image.width-60
            height: image.height-60
            source: "qrc:/image/8-1.png"
        }
    }

    Image {
        x:250
        y:220
        id: image2
        source: "qrc:/image/7-2.png"
        Image {
            x:35
            y:40
            width: image2.width-60
            height: image2.height-60
            source: "qrc:/image/8-2.png"
        }
        TapHandler{
            onTapped: {
                myLoader.sourceComponent=online
            }
        }
    }

    Image {
        x:200
        y:400
        id: image3
        source: "qrc:/image/7-3.png"
        Image {
            x:15
            y:35
            width: image3.width-30
            height: image3.height-70
            source: "qrc:/image/8-3.png"
        }
        TapHandler{
            onTapped: {
                myLoader.sourceComponent=help
            }
        }
    }


    Image {
        x:250
        y:540
        id: image4
        source: "qrc:/image/7-4.png"
        Image {
            x:40
            y:40
            width: image4.width-60
            height: image4.height-90
            source: "qrc:/image/8-4.png"
        }
        TapHandler{
            onTapped: {
                myLoader.sourceComponent=setting
            }
        }
    }
}
