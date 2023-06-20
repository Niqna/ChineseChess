import QtQuick 2.15
import Felgo 3.0
import QtMultimedia 5.15


Rectangle {
    signal cueRoundMes
    signal addStepMes
    signal gameOverMes
    signal xyChanged

    property int boardtheme
    property int camp

    property bool isfirstchoose: true
    property int _row
    property int _col
    property int first_row
    property int first_col
    property int rowcol
    property int isRed: 0

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

        if(isfirstchoose) {
            if(getID(_row, _col)) {
                if(getID(_row, _col).camp !== isRed) {
                    cueRoundMes()
                    return
                }
                clickedBoard.y = (_row - 1) * 54
                clickedBoard.x = (_col - 1) * 54
                clickedBoard.visible = !clickedBoard.visible
                isfirstchoose = false
                first_row = _row
                first_col = _col
            }
        } else if(canMove(first_row,  first_col,  _row,  _col)){
            if(getID(_row, _col).type === 1) {
                gameOverMes(isRed)
                win.play()
                return
            }
            //            xyChanged()
            //            if(getID(first_row, first_col).camp===0)
            //                server.xyChangedSlot(first_row,first_col,_row,_col)
            //            else
            //                connect.xyChangedSlot(first_row,first_col,_row,_col)
            moveStone(first_row, first_col, _row, _col)
            clickedBoard.visible = false
            isfirstchoose = true

        } else {
            clickedBoard.visible = false
            isfirstchoose = true
        }
    }

    function moveStone(row1, col1, row2, col2) {
        if(getID(row2, col2)) {
            s_cnv.play()
            getID(row2, col2).isExist = false
            getID(row2,col2).row = 0
        }
        getID(row1, col1).row = row2
        getID(row1, col1).col = col2
        lastStep.y = (row1 - 1) * 54
        lastStep.x = (col1 - 1) * 54
        lastStep.visible = true
        isRed = (isRed + 1)  % 2
    }

    Stone { id: opposite_jiang; theme: boardtheme; type: 1; isExist: true}
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

    MouseArea {
        anchors.fill: parent
        onClicked: {
            choose(mouseX,mouseY)
        }
    }

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

    Image {
        id: lastStep
        visible: false
        Keys.priority: Keys.AfterItem
        width: 54
        height:54
        source: "../../assets/image/gameImage/last.png"
        NumberAnimation {
            running: lastStep.visible
            loops: Animation.Infinite
            id: lastStepAnim
            target: lastStep
            property: "rotation"
            from: 0
            to: 360
            duration: 750
        }
    }

    MediaPlayer{
        id: s_cnv
        source: "../../assets/music/s_cnv.wav"
    }

    MediaPlayer{
        id: win
        source: "../../assets/music/win.mp3"
    }


    function init() {
        camp = gameScene.camp
        boardtheme = gameScene.theme
        clickedBoard.visible = false
        isRed = 0
        opposite_jiang.row = 1; opposite_jiang.col = 5; opposite_jiang.camp = (camp + 1)  % 2; opposite_jiang.isExist = true
        opposite_shi1.row = 1; opposite_shi1.col = 4; opposite_shi1.camp = (camp + 1)  % 2; opposite_shi1.isExist = true
        opposite_shi2.row = 1; opposite_shi2.col = 6; opposite_shi2.camp = (camp + 1)  % 2; opposite_shi2.isExist = true
        opposite_xiang1.row = 1; opposite_xiang1.col = 3; opposite_xiang1.camp = (camp + 1)  % 2; opposite_xiang1.isExist = true
        opposite_xiang2.row = 1; opposite_xiang2.col = 7; opposite_xiang2.camp = (camp + 1)  % 2; opposite_xiang2.isExist = true
        opposite_ma1.row = 1; opposite_ma1.col = 2; opposite_ma1.camp = (camp + 1)  % 2; opposite_ma1.isExist = true
        opposite_ma2.row = 1; opposite_ma2.col = 8; opposite_ma2.camp = (camp + 1)  % 2; opposite_ma2.isExist = true
        opposite_ju1.row = 1; opposite_ju1.col = 1; opposite_ju1.camp = (camp + 1)  % 2; opposite_ju1.isExist = true
        opposite_ju2.row = 1; opposite_ju2.col = 9; opposite_ju2.camp = (camp + 1)  % 2; opposite_ju2.isExist = true
        opposite_pao1.row = 3; opposite_pao1.col = 2; opposite_pao1.camp = (camp + 1)  % 2; opposite_pao1.isExist = true
        opposite_pao2.row = 3; opposite_pao2.col = 8; opposite_pao2.camp = (camp + 1)  % 2; opposite_pao2.isExist = true
        opposite_bing1.row = 4; opposite_bing1.col = 1; opposite_bing1.camp = (camp + 1)  % 2; opposite_bing1.isExist = true
        opposite_bing2.row = 4; opposite_bing2.col = 3; opposite_bing2.camp = (camp + 1)  % 2; opposite_bing2.isExist = true
        opposite_bing3.row = 4; opposite_bing3.col = 5; opposite_bing3.camp = (camp + 1)  % 2; opposite_bing3.isExist = true
        opposite_bing4.row = 4; opposite_bing4.col = 7; opposite_bing4.camp = (camp + 1)  % 2; opposite_bing4.isExist = true
        opposite_bing5.row = 4; opposite_bing5.col = 9; opposite_bing5.camp = (camp + 1)  % 2; opposite_bing5.isExist = true

        own_jiang.row = 10; own_jiang.col = 5; own_jiang.camp = camp; own_jiang.isExist = true
        own_shi1.row = 10; own_shi1.col = 4; own_shi1.camp = camp; own_shi1.isExist = true
        own_shi2.row = 10; own_shi2.col = 6; own_shi2.camp = camp; own_shi2.isExist = true
        own_xiang1.row = 10; own_xiang1.col = 3; own_xiang1.camp = camp; own_xiang1.isExist = true
        own_xiang2.row = 10; own_xiang2.col = 7; own_xiang2.camp = camp; own_xiang2.isExist = true
        own_ma1.row = 10; own_ma1.col = 2; own_ma1.camp = camp; own_ma1.isExist = true
        own_ma2.row = 10; own_ma2.col = 8; own_ma2.camp = camp; own_ma2.isExist = true
        own_ju1.row = 10; own_ju1.col = 1; own_ju1.camp = camp; own_ju1.isExist = true
        own_ju2.row = 10; own_ju2.col = 9; own_ju2.camp = camp; own_ju2.isExist = true
        own_pao1.row = 8; own_pao1.col = 2; own_pao1.camp = camp; own_pao1.isExist = true
        own_pao2.row = 8; own_pao2.col = 8; own_pao2.camp = camp; own_pao2.isExist = true
        own_bing1.row = 7; own_bing1.col = 1; own_bing1.camp = camp; own_bing1.isExist = true
        own_bing2.row = 7; own_bing2.col = 3; own_bing2.camp = camp; own_bing2.isExist = true
        own_bing3.row = 7; own_bing3.col = 5; own_bing3.camp = camp; own_bing3.isExist = true
        own_bing4.row = 7; own_bing4.col = 7; own_bing4.camp = camp; own_bing4.isExist = true
        own_bing5.row = 7; own_bing5.col = 9; own_bing5.camp = camp; own_bing5.isExist = true
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
    function getStoneCountAtLine( row1,  col1,  row2,  col2)
    {
        var  ret = 0;
        if(row1 !== row2 && col1 !== col2)
            return false;
        if(row1 === row2 && col1 === col2)
            return false;

        if(row1 === row2)
        {
            var min = col1 < col2 ? col1 : col2;
            var max = col1 < col2 ? col2 : col1;
            for(var col = min+1; col<max; ++col)
            {
                if(getID(row1, col) )
                {
                    ++ret;
                }
            }
        }
        else
        {
            min = row1 < row2 ? row1 : row2;
            max = row1 < row2 ? row2 : row1;
            for(var row = min+1; row<max; ++row)
            {
                if(getID(row, col1))
                {
                    ++ret;
                }
            }
        }

        return ret;
    }

    function relation( row1,  col1,  row,  col)
    {
        return Math.abs(row1-row)*10+ Math.abs(col1-col);
    }

    function canMove(row1,  col1,  row2,  col2)
    {
        if(getID(row1, col1) === getID(row2, col2))
            return false
        if(getID(row1, col1).camp === getID(row2, col2).camp)
            return false
        switch(getID(row1, col1).type) {
        case 7://bing
            var r=relation( row1,  col1,  row2,  col2)
            if(getID(row1,col1).camp!==camp)
            {
                if(row2<6)
                {
                    if(row2-row1==1&&(r===1||r===10))
                    {
                        return true;
                    }else{
                        return false;
                    }
                }else
                {
                    if((row2-row1==1||Math.abs(col2-col1)==1)&&r===1||r===10){
                        return true;
                    } else{
                        return false;
                    }
                }
            }else
            {
                if(row2>5)
                {
                    if(row2-row1==-1&&(r===1||r===10))
                    {
                        return true;
                    }else{
                        return false;
                    }
                }else
                {
                    if((row2-row1==-1||Math.abs(col2-col1)==1)&&(r===1||r===10)){
                        return true;
                    } else{
                        return false;
                    }
                }
            }
        case 4://ma
            r=relation( row1,  col1,  row2,  col2)
            if((r !== 12 && r !== 21)){
                return false;
            }else{
                if(r===12)
                {
                    if(getID(row1,(col1+col2)/2))
                    {
                        return false
                    }else{return true}
                }else if(r===21){
                    if(getID((row2+row1)/2,col1)){
                        return false
                    }else{return true}
                }
                return true
            }

        case 2://shi

            r=relation( row1,  col1,  row2,  col2)
            if(r !== 11 ||col2<4||col2>6||(row2>=4&&row2<=7)){
                return false;
            }else{
                return true;
            }
        case 3://xiang
            if(getID((row1+row2)/2,(col1+col2)/2))
            {
                return false
            }
            r=relation( row1,  col1,  row2,  col2)
            if(getID(row1,col1).camp!==camp)//camp==hong
            {
                if(row2>5){
                    return false;
                }else if(r !== 22){
                    return false
                }else{
                    return true;
                }
            }else {
                if(row2<6){
                    return false;
                }else if(r !== 22){
                    return false;
                }else{
                    return true;
                }
            }




        case 1://jiang
            r=relation(row1,  col1,  row2,  col2)
            if(r !== 1 && r !== 10||col2<4||col2>6||(row2>=4&&row2<=7))
            {
                return false;
            }else{
                return true;
            }
        case 5://che
            var ret = getStoneCountAtLine(row1, col1, row2, col2);
            if(ret===0)
            {
                return true;
            }else
            {
                return false
            }
        case 6://pao

            ret = getStoneCountAtLine(row2, col2, row1, col1);
            if(getID(row2,col2))
            {
                if(ret===1)
                {
                    return true
                }else
                {
                    return false
                }
            }else
            {
                if(ret===0)
                {
                    return true
                }else
                {
                    return false
                }
            }

        }


    }
}
