import Felgo 3.0
import QtQuick 2.0

import "scenes"

GameWindow {
    id: window
    screenWidth: 486
    screenHeight: 864

    // menu scene
    MenuScene {
        id: menuScene
        // listen to the button signals of the scene and change the state according to it
        onHelpPressed: window.state = "help"
        onLocalPressed: window.state = "local"
        onSettingPressed: window.state = "setting"
        onSoloPressed: window.state="solo"
    }

    // solo scene
    SoloScene {
        id: soloScene
        onBackButtonPressed: window.state = "menu"
        onGamePressed: window.state = "game"
//        onCreateRoomPressed:window.state= "createRoom"
//        onJoinRoomPressed: window.state= "joinRoom"
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

    // setting scene
    SettingScene {
        id: settingScene
        onBackButtonPressed: window.state = "menu"
    }

    // game scene
    GameScene {
        id: gameScene
        onBackButtonPressed: window.state = "menu"
        theme: settingScene.theme

    }

    // create scene
    CreateRoomScene {
        id:createRoomScene
        onBackButtonPressed: window.state = "local"
    }

    // join scece
    JoinRoomScene {
        id:joinRoomScene
        onBackButtonPressed: window.state = "local"
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
}
