import Felgo 3.0
import QtQuick 2.0
import QtMultimedia 5.15

import "scenes"
import Server 1.0
import Connect 1.0

GameWindow {
    id: window
    screenWidth: 486
    screenHeight: 864

    signal gamePressed()

    // setting scene
    SettingScene {
        id: settingScene
        onBackButtonPressed: window.state = "menu"
    }
    // menu scene
    MenuScene {
        id: menuScene
        // listen to the button signals of the scene and change the state according to it
        onHelpPressed: window.state = "help"
        onLocalPressed: window.state = "local"
        onSettingPressed: {
            settingScene.updateTheme()
            window.state = "setting"
        }
        onSoloPressed: window.state="solo"
    }

    // solo scene
    SoloScene {
        id: soloScene

        onBackButtonPressed: window.state = "menu"
        onGamePressed: {
            window.state = "game"
            gameScene.init()
        }
    }

    // local scene
    LocalScene {
        id: localScene
        onBackButtonPressed: window.state = "menu"
        onCreateRoomPressed:window.state= "createRoom"
        onJoinRoomPressed: window.state= "joinRoom"
    }

    // help scene
    HelpScene {
        id: helpScene
        onBackButtonPressed: window.state = "menu"
    }



    // game scene
    GameScene {
        id: gameScene
        onBackButtonPressed: window.state = "menu"

    }

    // create scene
    CreateRoomScene {
        id:createRoomScene
        onBackButtonPressed: window.state = "local"
//        onGamePressed: {
//            window.state = "game"
//            gameScene.init()
//        }
    }

    // join scece
    JoinRoomScene {
        id:joinRoomScene
        onBackButtonPressed: window.state = "local"
//        onGamePressed: {
//            window.state = "game"
//            gameScene.init()
//        }
    }

    MediaPlayer{
        id:bgm
        source: "../assets/music/bg4.mp3"
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

    // menuScene is our first scene, so set the state to menu initially
    state: "menu"
    activeScene: menuScene

    // state machine, takes care reversing the PropertyChanges when changing the state, like changing the opacity back to 0
    states: [
        State {
            name: "menu"
            PropertyChanges {target: menuScene; opacity: 1}
            PropertyChanges {target: window; activeScene: menuScene}
        },
        State {
            name: "solo"
            PropertyChanges {target: soloScene; opacity: 1}
            PropertyChanges {target: window; activeScene: soloScene}
        },
        State {
            name: "local"
            PropertyChanges {target: localScene; opacity: 1}
            PropertyChanges {target: window; activeScene: localScene}
        },
        State {
            name: "help"
            PropertyChanges {target: helpScene; opacity: 1}
            PropertyChanges {target: window; activeScene: helpScene}
        },
        State {
            name: "setting"
            PropertyChanges {target: settingScene; opacity: 1}
            PropertyChanges {target: window; activeScene: settingScene}
        },
        State {
            name: "createRoom"
            PropertyChanges {target: createRoomScene; opacity: 1}
            PropertyChanges {target: window; activeScene: createRoomScene}
        },
        State {
            name: "joinRoom"
            PropertyChanges {target: joinRoomScene; opacity: 1}
            PropertyChanges {target: window; activeScene: joinRoomScene}
        },
        State {
            name: "game"
            PropertyChanges {target: gameScene; opacity: 1}
            PropertyChanges {target: window; activeScene: gameScene}
        }
    ]

//    Server{
//        id:server

//        onConnectSuccess: {
//            window.state = "game"
//            gamePressed()
//            gameScene.camp = 0
//            gameScene.init()
//        }
//    }

//    Connect{
//        id:connect
//        onConnectSuccess: {
//            window.state = "game"
//            gamePressed()
//            gameScene.camp = 1
//            gameScene.init()
//        }
//        onConnectxy: {

//        }
//    }
}
