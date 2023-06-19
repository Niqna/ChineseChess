import QtQuick 2.15
import Felgo 3.0

Rectangle {

    //    signal firstMouseEvent

    property int boardtheme
    property int camp

    property bool isfirstchoose: true
    property int _row
    property int _col
    property int first_row
    property int first_col
    property int rowcol

    id: board
    x: parent.x
    y: parent.y + 125
    width: parent.width
    height: 540
    color: "transparent"

    function xy_to_rowcol(x,y) {
        _row = y / 54 + 1
        _col = x / 54 + 1
    }

    function choose(_x, _y) {
        //        _row = xy_to_rowcol(_x)
        //        _col = xy_to_rowcol(_y)
        xy_to_rowcol(_x, _y)
        console.log(_row, _col)
        if (isfirstchoose) {
            if (getID(_row, _col)) {
                clickedBoard.y = (_row - 1) * 54
                clickedBoard.x = (_col - 1) * 54
                if(!clickedBoard.visible)
                    clickedBoard.visible = true
                else
                    clickedBoard.visible = false
                getID(_row, _col).isClicked = true
                isfirstchoose = false
                first_row = _row
                first_col = _col
            }
        } else if(_row!=first_row || _col!=first_col){
            getID(_row, _col).isExist = false
            getID(_row,_col).row = 0
            moveStone.start()
            clickedBoard.visible = false
            isfirstchoose = true
            getID(first_row, first_col).isClicked = first
//            if(getID(_row, _col))

        } else {
            clickedBoard.visible = false
            isfirstchoose = true
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            choose(mouseX,mouseY)
        }
    }

    ParallelAnimation {
        id: moveStone
        PropertyAnimation { target: getID(first_row, first_col); property: "row"; to: _row; duration: 100}
        PropertyAnimation { target: getID(first_row, first_col); property: "col"; to: _col; duration: 100}

    }

    Stone { id: opposite_jiang; theme: boardtheme; type: 1;}
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

    SpriteSequence {
        visible: false
        id: clickedBoard
        //        anchors.fill: parent
        width: 54
        height:54
        Sprite {
            name: "click1"
            source: "../../assets/image/gameImage/click1.png"
            frameDuration: 300
            to: { "click2": 1 }

        }
        Sprite {
            name: "click2"
            source: "../../assets/image/gameImage/click2.png"
            frameDuration: 300
            to: { "click1": 1 }
        }
    }

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

    function getID(row, col) {
        if( opposite_jiang.row ===row && opposite_jiang.col ===col ) { return opposite_jiang }
        else if( opposite_shi1.row ===row && opposite_shi1.col ===col ) { return opposite_shi1 }
        else if( opposite_shi2.row ===row && opposite_shi2.col ===col ) { return opposite_shi2 }
        else if( opposite_xiang1.row ===row && opposite_xiang1.col ===col ) { return opposite_xiang1 }
        else if( opposite_xiang2.row ===row && opposite_xiang2.col ===col ) { return opposite_xiang2 }
        else if( opposite_ma1.row ===row && opposite_ma1.col ===col ) { return opposite_ma1 }
        else if( opposite_ma2.row ===row && opposite_ma2.col ===col ) { return opposite_ma2 }
        else if( opposite_ju1.row ===row && opposite_ju1.col ===col ) { return opposite_ju1 }
        else if( opposite_ju2.row ===row && opposite_ju2.col ===col ) { return opposite_ju2 }
        else if( opposite_pao1.row ===row && opposite_pao1.col ===col ) { return opposite_pao1 }
        else if( opposite_pao2.row ===row && opposite_pao2.col ===col ) { return opposite_pao2 }
        else if( opposite_bing1.row ===row && opposite_bing1.col ===col ) { return opposite_bing1 }
        else if( opposite_bing2.row ===row && opposite_bing2.col ===col ) { return opposite_bing2 }
        else if( opposite_bing3.row ===row && opposite_bing3.col ===col ) { return opposite_bing3 }
        else if( opposite_bing4.row ===row && opposite_bing4.col ===col ) { return opposite_bing4 }
        else if( opposite_bing5.row ===row && opposite_bing5.col ===col ) { return opposite_bing5 }

        else if( own_jiang.row ===row && own_jiang.col ===col ) { return own_jiang }
        else if( own_shi1.row ===row && own_shi1.col ===col ) { return own_shi1 }
        else if( own_shi2.row ===row && own_shi2.col ===col ) { return own_shi2 }
        else if( own_xiang1.row ===row && own_xiang1.col ===col ) { return own_xiang1 }
        else if( own_xiang2.row ===row && own_xiang2.col ===col ) { return own_xiang2 }
        else if( own_ma1.row ===row && own_ma1.col ===col ) { return own_ma1 }
        else if( own_ma2.row ===row && own_ma2.col ===col ) { return own_ma2 }
        else if( own_ju1.row ===row && own_ju1.col ===col ) { return own_ju1 }
        else if( own_ju2.row ===row && own_ju2.col ===col ) { return own_ju2 }
        else if( own_pao1.row ===row && own_pao1.col ===col ) { return own_pao1 }
        else if( own_pao2.row ===row && own_pao2.col ===col ) { return own_pao2 }
        else if( own_bing1.row ===row && own_bing1.col ===col ) { return own_bing1 }
        else if( own_bing2.row ===row && own_bing2.col ===col ) { return own_bing2 }
        else if( own_bing3.row ===row && own_bing3.col ===col ) { return own_bing3 }
        else if( own_bing4.row ===row && own_bing4.col ===col ) { return own_bing4 }
        else if( own_bing5.row ===row && own_bing5.col ===col ) { return own_bing5 }
        else return false
    }
}
