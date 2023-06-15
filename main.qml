import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtMultimedia

Window {
    id:root
    width: 480
    height: 854
    visible: true
    title: qsTr("ChineseChese")

    Loader{
        id:myLoader
    }
    Component.onCompleted: myLoader.sourceComponent = main

    Component{
        id:main
        Mainpage{}
    }

    Component{
        id:help
        Help{}
    }

    Component{
        id:online
        Online{}
    }

    Component{
        id:setting
        Setting{}
    }

//    MediaPlayer{
//        id:bgm
//        source: "qrc:/music/bg4.mp3"
//        audioOutput: AudioOutput{}
//    }

}

