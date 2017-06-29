import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.0

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "DiceParser: Le système de dés"
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
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
                name: "Générique"
                index: 2
            }

        }

    Item {
        id: diceRoller
        anchors.fill: parent
        opacity: (rectangle1.idState == 3 ) ? 1.0: 0.0
        TextField {
            property int current: 0
            id: diceCommand
            anchors.horizontalCenter: parent.horizontalCenter
            y: app.height*0.2
            width:app.width*0.2
            onEditingFinished:{
                app.rollDiceCmd(diceCommand.text)
                diceCommand.text = ""
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
    }
}
