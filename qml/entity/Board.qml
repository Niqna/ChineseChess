import QtQuick 2.0
import Felgo 3.0

Rectangle {

    property int boardtheme

    id: board
    x: parent.x
    y: parent.y + 125
    width: 486
    height: 540
    color: "transparent"


    SequentialAnimation {
        id: move

    }

    Stone { id: hei_jiang; theme: boardtheme; camp: 1; type: 1; row: 5; col: 1}
    Stone { id: hei_shi1; theme: boardtheme; camp: 1; type: 2; row: 4; col: 1}
    Stone { id: hei_xiang1; theme: boardtheme; camp: 1; type: 3; row: 3; col: 1}
    Stone { id: hei_ma1; theme: boardtheme; camp: 1; type: 4; row: 2; col: 1}
    Stone { id: hei_ju1; theme: boardtheme; camp: 1; type: 5; row: 1; col: 1}
    Stone { id: hei_shi2; theme: boardtheme; camp: 1; type: 2; row: 6; col: 1}
    Stone { id: hei_xiang2; theme: boardtheme; camp: 1; type: 3; row: 7; col: 1}
    Stone { id: hei_ma2; theme: boardtheme; camp: 1; type: 4; row: 8; col: 1}
    Stone { id: hei_ju2; theme: boardtheme; camp: 1; type: 5; row: 9; col: 1}
    Stone { id: hei_pao1; theme: boardtheme; camp: 1; type: 6; row: 2; col: 3}
    Stone { id: hei_pao2; theme: boardtheme; camp: 1; type: 6; row: 8; col: 3}
    Stone { id: hei_bing1; theme: boardtheme; camp: 1; type: 7; row: 1; col: 4}
    Stone { id: hei_bing2; theme: boardtheme; camp: 1; type: 7; row: 3; col: 4}
    Stone { id: hei_bing3; theme: boardtheme; camp: 1; type: 7; row: 5; col: 4}
    Stone { id: hei_bing4; theme: boardtheme; camp: 1; type: 7; row: 7; col: 4}
    Stone { id: hei_bing5; theme: boardtheme; camp: 1; type: 7; row: 9; col: 4}

    Stone { id: hong_jiang; theme: boardtheme; camp: 0; type: 1; row: 5; col: 10}
    Stone { id: hong_shi1; theme: boardtheme; camp: 0; type: 2; row: 4; col: 10}
    Stone { id: hong_xiang1; theme: boardtheme; camp: 0; type: 3; row: 3; col: 10}
    Stone { id: hong_ma1; theme: boardtheme; camp: 0; type: 4; row: 2; col: 10}
    Stone { id: hong_ju1; theme: boardtheme; camp: 0; type: 5; row: 1; col: 10}
    Stone { id: hong_shi2; theme: boardtheme; camp: 0; type: 2; row: 6; col: 10}
    Stone { id: hong_xiang2; theme: boardtheme; camp: 0; type: 3; row: 7; col: 10}
    Stone { id: hong_ma2; theme: boardtheme; camp: 0; type: 4; row: 8; col: 10}
    Stone { id: hong_ju2; theme: boardtheme; camp: 0; type: 5; row: 9; col: 10}
    Stone { id: hong_pao1; theme: boardtheme; camp: 0; type: 6; row: 2; col: 8}
    Stone { id: hong_pao2; theme: boardtheme; camp: 0; type: 6; row: 8; col: 8}
    Stone { id: hong_bing1; theme: boardtheme; camp: 0; type: 7; row: 1; col: 7}
    Stone { id: hong_bing2; theme: boardtheme; camp: 0; type: 7; row: 3; col: 7}
    Stone { id: hong_bing3; theme: boardtheme; camp: 0; type: 7; row: 5; col: 7}
    Stone { id: hong_bing4; theme: boardtheme; camp: 0; type: 7; row: 7; col: 7}
    Stone { id: hong_bing5; theme: boardtheme; camp: 0; type: 7; row: 9; col: 7}
}
