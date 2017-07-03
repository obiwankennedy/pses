import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1

SlidePage {
    id: page
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "DiceParser: Le système de dés"
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
    onIdStateChanged: {
        if(idState >= 4)
        {
            view.visible = false;
        }
        else
            view.visible = true;
    }

    ListModel {
         id: listSection
            ListElement {
                name: "Interpreteur de commandes"
                index: 0
            }
            ListElement {
                name: "Client: Rolisteam, Bot Irc, CLI, Bot twitter"
                index: 1
            }
            ListElement {
                name: "2 types de jets, 11 operateurs, 6 comparateurs logiques,\n 3 combinateurs logiques"
                index: 2
            }
            ListElement {
                name: "Générique"
                index: 3
            }
        }

    Item {
        id: diceRoller
        anchors.fill: parent
        opacity: (page.idState == 4 ) ? 1.0: 0.0
        TextField {
            property int current: 0
            id: diceCommand
            anchors.horizontalCenter: parent.horizontalCenter
            y: app.height*0.2
            width:app.width*0.2
            onEditingFinished: {
                if(diceCommand.text != "")
                {
                    app.rollDiceCmd(diceCommand.text)
                    diceCommand.text = ""
                }
            }
            Keys.onUpPressed: {
                current++;
                if(current>_diceModel.rowCount()-1)
                {
                    current=_diceModel.rowCount()-1
                }
                updateText()
            }
            Keys.onDownPressed: {
                current--;
                if(current<0)
                   current = 0;

                updateText()
            }

            function updateText()
            {
                diceCommand.text = _diceModel.getCmd(current)
            }


        }

        ListView {
            id: diceResult
            model: _diceModel
            anchors.top: diceCommand.bottom
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: app.width*0.5
            delegate: Item
            {

                width: app.width*0.5
                height: app.height*0.05
                Text {
                    text: result
                    color:app.txtColor
                    textFormat: Text.RichText
                    font.pointSize: (app.height >100 ? app.height : 800)*0.02
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                }
            }
        }
        ColumnLayout {
            id: commands
            x: parent.width * 0.8
            y: parent.height * 0.2
            width: parent.width * 0.2
            height: parent.height * 0.8
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredWidth: parent.width * 0.2
            Button {
               text: "1d20+3"
               onClicked: app.rollDiceCmd(text)
               focusPolicy: Qt.ClickFocus
            }
            Button {
               text: "6d10e10r1k3"
               onClicked: app.rollDiceCmd(text)
               focusPolicy: Qt.ClickFocus
            }
            Button {
               text: "6GS3"
               onClicked: app.rollDiceCmd(text)
               focusPolicy: Qt.ClickFocus
            }
            Button {
               text: "1L[épée,arc,couteau,pistolet,fusil]"
               onClicked: app.rollDiceCmd(text)
               focusPolicy: Qt.ClickFocus
            }
            Button {
                text: "5-5*5+5"
                onClicked: app.rollDiceCmd(text)
                focusPolicy: Qt.ClickFocus
            }
            Button {
                text: "(3+2D6)D10"
                onClicked: app.rollDiceCmd(text)
                focusPolicy: Qt.ClickFocus
            }
            Button {
                text: "4d[-1-1]"
                onClicked: app.rollDiceCmd(text)
                focusPolicy: Qt.ClickFocus
            }
            Button {
                text: "1d[-10--1]"
                onClicked: app.rollDiceCmd(text)
                focusPolicy: Qt.ClickFocus
            }
            Button {
                text: "4d10e6i[>7]{\"Succès\"}{\"Échec\"}"
                onClicked: app.rollDiceCmd(text)
                focusPolicy: Qt.ClickFocus
            }
            Button {
                text: "10029D66666666s"
                onClicked: app.rollDiceCmd(text)
                focusPolicy: Qt.ClickFocus
            }

        }

    }
    /*Item {
        visible: false
        anchors.fill: parent
        Rectangle {
            id: cursor
            color: "red"
            width: 10
            height: 10
        }
        MouseArea {
            anchors.fill: parent
            onPressed: {
                cursor.x = mouse.x
                cursor.y = mouse.y
            }
        }
    }*/
}
