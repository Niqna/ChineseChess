import QtQuick 2.0
import Felgo 3.0

Rectangle {

    property int boardtheme

    property int camp

    id: board
    x: parent.x
    y: parent.y + 125
    width: parent.width
    height: 540
    color: "transparent"

    function move(row1, col1, row2, col2) {

    }


    SequentialAnimation {
        id: move

    }

    Stone { id: opposite_jiang; theme: boardtheme; type: 1}
    Stone { id: opposite_shi1; theme: boardtheme; type: 2}
    Stone { id: opposite_xiang1; theme: boardtheme; type: 3}
    Stone { id: opposite_ma1; theme: boardtheme; type: 4}
    Stone { id: opposite_ju1; theme: boardtheme; type: 5}
    Stone { id: opposite_shi2; theme: boardtheme; type: 2}
    Stone { id: opposite_xiang2; theme: boardtheme; type: 3}
    Stone { id: opposite_ma2; theme: boardtheme; type: 4}
    Stone { id: opposite_ju2; theme: boardtheme; type: 5}
    Stone { id: opposite_pao1; theme: boardtheme; type: 6}
    Stone { id: opposite_pao2; theme: boardtheme; type: 6}
    Stone { id: opposite_bing1; theme: boardtheme; type: 7}
    Stone { id: opposite_bing2; theme: boardtheme; type: 7}
    Stone { id: opposite_bing3; theme: boardtheme; type: 7}
    Stone { id: opposite_bing4; theme: boardtheme; type: 7}
    Stone { id: opposite_bing5; theme: boardtheme; type: 7}

    Stone { id: own_jiang; theme: boardtheme; type: 1}
    Stone { id: own_shi1; theme: boardtheme; type: 2}
    Stone { id: own_xiang1; theme: boardtheme; type: 3}
    Stone { id: own_ma1; theme: boardtheme; type: 4}
    Stone { id: own_ju1; theme: boardtheme; type: 5}
    Stone { id: own_shi2; theme: boardtheme; type: 2}
    Stone { id: own_xiang2; theme: boardtheme; type: 3}
    Stone { id: own_ma2; theme: boardtheme; type: 4}
    Stone { id: own_ju2; theme: boardtheme; type: 5}
    Stone { id: own_pao1; theme: boardtheme; type: 6}
    Stone { id: own_pao2; theme: boardtheme; type: 6}
    Stone { id: own_bing1; theme: boardtheme; type: 7}
    Stone { id: own_bing2; theme: boardtheme; type: 7}
    Stone { id: own_bing3; theme: boardtheme; type: 7}
    Stone { id: own_bing4; theme: boardtheme; type: 7}
    Stone { id: own_bing5; theme: boardtheme; type: 7}

    function init() {
        camp = gameScene.camp
        boardtheme = gameScene.theme
        opposite_jiang.row = 1; opposite_jiang.col = 5; opposite_jiang.camp = (camp + 1)  % 2
        opposite_shi1.row = 1; opposite_shi1.col = 4; opposite_shi1.camp = (camp + 1)  % 2
        opposite_shi2.row = 1; opposite_shi2.col = 6; opposite_shi2.camp = (camp + 1)  % 2
        opposite_xiang1.row = 1; opposite_xiang1.col = 3; opposite_xiang1.camp = (camp + 1)  % 2
        opposite_xiang2.row = 1; opposite_xiang2.col = 7; opposite_xiang2.camp = (camp + 1)  % 2
        opposite_ma1.row = 1; opposite_ma1.col = 2; opposite_ma1.camp = (camp + 1)  % 2
        opposite_ma2.row = 1; opposite_ma2.col = 8; opposite_ma2.camp = (camp + 1)  % 2
        opposite_ju1.row = 1; opposite_ju1.col = 1; opposite_ju1.camp = (camp + 1)  % 2
        opposite_ju2.row = 1; opposite_ju2.col = 9; opposite_ju2.camp = (camp + 1)  % 2
        opposite_pao1.row = 3; opposite_pao1.col = 2; opposite_pao1.camp = (camp + 1)  % 2
        opposite_pao2.row = 3; opposite_pao2.col = 8; opposite_pao2.camp = (camp + 1)  % 2
        opposite_bing1.row = 4; opposite_bing1.col = 1; opposite_bing1.camp = (camp + 1)  % 2
        opposite_bing2.row = 4; opposite_bing2.col = 3; opposite_bing2.camp = (camp + 1)  % 2
        opposite_bing3.row = 4; opposite_bing3.col = 5; opposite_bing3.camp = (camp + 1)  % 2
        opposite_bing4.row = 4; opposite_bing4.col = 7; opposite_bing4.camp = (camp + 1)  % 2
        opposite_bing5.row = 4; opposite_bing5.col = 9; opposite_bing5.camp = (camp + 1)  % 2

        own_jiang.row = 10; own_jiang.col = 5; own_jiang.camp = camp
        own_shi1.row = 10; own_shi1.col = 4; own_shi1.camp = camp
        own_shi2.row = 10; own_shi2.col = 6; own_shi2.camp = camp
        own_xiang1.row = 10; own_xiang1.col = 3; own_xiang1.camp = camp
        own_xiang2.row = 10; own_xiang2.col = 7; own_xiang2.camp = camp
        own_ma1.row = 10; own_ma1.col = 2; own_ma1.camp = camp
        own_ma2.row = 10; own_ma2.col = 8; own_ma2.camp = camp
        own_ju1.row = 10; own_ju1.col = 1; own_ju1.camp = camp
        own_ju2.row = 10; own_ju2.col = 9; own_ju2.camp = camp
        own_pao1.row = 8; own_pao1.col = 2; own_pao1.camp = camp
        own_pao2.row = 8; own_pao2.col = 8; own_pao2.camp = camp
        own_bing1.row = 7; own_bing1.col = 1; own_bing1.camp = camp
        own_bing2.row = 7; own_bing2.col = 3; own_bing2.camp = camp
        own_bing3.row = 7; own_bing3.col = 5; own_bing3.camp = camp
        own_bing4.row = 7; own_bing4.col = 7; own_bing4.camp = camp
        own_bing5.row = 7; own_bing5.col = 9; own_bing5.camp = camp

    }
}
