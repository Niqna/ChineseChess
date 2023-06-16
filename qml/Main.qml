import Felgo 3.0
import QtQuick 2.0
import "./scenes"

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
    }

    // local scene
    LocalScene {
        id: localScene
        onBackButtonPressed: window.state = "menu"
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

    GameScene {
        id: gameScene
    }

    // menuScene is our first scene, so set the state to menu initially
    state: "game"
    activeScene: gameScene

    // state machine, takes care reversing the PropertyChanges when changing the state, like changing the opacity back to 0
    states: [
        State {
            name: "menu"
            PropertyChanges {target: menuScene; opacity: 1}
            PropertyChanges {target: window; activeScene: menuScene}
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
            name: "game"
            PropertyChanges {target: gameScene; opacity: 1}
            PropertyChanges {target: window; activeScene: gameScene}
        }
    ]
}
