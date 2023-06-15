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
        Helppage{}
    }

    Component{
        id:online
        Onlinepage{}
    }

    Component{
        id:setting
        Settingpage{}
    }

    Component{
        id:local
        Localpage{}
    }

    MediaPlayer{
        id:bgm
        //autoPlay:false
        source: "qrc:/music/bg4.mp3"
        audioOutput: AudioOutput{}
    }

    Timer{
        id:musictimer
        interval: 100
        running: true
        repeat: true
        onTriggered: {
            bgm.play()
            running=false
        }
    }
}

