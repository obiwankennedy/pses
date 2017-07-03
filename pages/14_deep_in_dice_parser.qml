import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1

SlidePage {
    id: page
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Analyse d’une commande"
    richText: true
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
    onIdStateChanged: {
        if(idState >= 7)
        {
            view.visible = false;
        }
        else
            view.visible = true;
    }
    Text {
        id: command
        text: page.idState === 0 ? "10d10e[=10]k5" : page.idState === 1 ? "<strong><span style=\"color:red\">10</style></strong>d10e[=10]k5" :
                                                  page.idState === 2 ? "10<strong><span style=\"color:red\">d10</style></strong>e[=10]k5" :
                                                  page.idState === 3 ? "10d10<strong><span style=\"color:red\">e[=10]</style></strong>k5" :
                                                  page.idState === 4 ? "10d10e[=10]<strong><span style=\"color:red\">k5</style></strong>" :
                                                  page.idState === 5 ? "10d10e[=10]<strong><span style=\"color:red\">k5</style></strong>" : "<strong>10d10e10k5</strong>"
        y:page.height * 0.1
        anchors.horizontalCenter: parent.horizontalCenter
        width: contentWidth
        height: page.height*0.01
        textFormat: Text.RichText
        font.pixelSize: page.height > 0 ? page.height/20 : 1
        color: "white"
    }
    ListModel {
         id: listSection

            ListElement {
                name: "NumberNode - valeur 10"
                index: 1
            }
            ListElement {
                name: "DiceNode - nombre de faces :10"
                index: 2
            }
            ListElement {
                name: "ExploseNode - validateur =10"
                index: 3
            }
            ListElement {
                name: "SortNode - ordre: descendant"
                index: 4
            }
            ListElement {
                name: "KeepNode - nombre: 5"
                index: 5
            }
            ListElement {
                name: "Result: <span style=\"color:red\">64</span>, details:[10d10e10k5 (<span style=\"color:red\">22 [10 10 2] 18 [10 8] 9 8 7</span> 7 5 4 3 1)]"
                index: 6
            }
        }

    Image {
        id: img
        source:"qrc:/rsrc/commande_des_schema.jpg"
        x: page.width * 0.1
        y: page.height * 0.1
        width: parent.width * 0.9
        height: parent.height * 0.9
        fillMode: Image.PreserveAspectFit
        transformOrigin: Item.Center
        visible: page.idState === 7
        focus: true
        Behavior on scale {
            NumberAnimation {
                duration: 500
            }
        }

        MouseArea {
            anchors.fill: parent
            property int previousX : 0
            property int previousY : 0
            onPressed: {
                previousX = mouse.x
                previousY = mouse.y
                parent.focus = true
                img.scale = 1.5
                mouse.accepted = true
            }
            onReleased: {
                img.scale = 1.0
                mouse.accepted = true
            }
            onWheel: {
               if(wheel.angleDelta.y > 0)
               {
                   img.scale += 0.1
               }
               else
               {
                   img.scale -= 0.1
               }
            }

            onPositionChanged: {
                img.x += mouse.x-previousX
                img.y += mouse.y-previousY
                mouse.accepted = true
            }
        }
    }
}
