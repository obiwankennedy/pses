import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: page
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Dans l'avenir"
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }


    Rectangle {

        x: page.width * 0.1
        y: page.height * 0.1
 //       anchors.topMargin: app.width*0.1
        width: app.width*0.8
        height: app.height*0.8
        color: "grey"
        opacity: (page.idState == 4 ) ? 1.0: 0.0

        Image {
            id: mindmap
            anchors.fill: parent
            opacity: (page.idState == 4 ) ? 1.0: 0.0
            Behavior on opacity {
                NumberAnimation {
                    duration: 1000
                }
            }
            source: "qrc:/rsrc/mindmap.svg"
        }
    }
   ListModel {
       id: listSection
            ListElement {
                name: "Fonctionnalités"
                index:0
            }
            ListElement {
                name: "Serveur Dédié"
                index:1
            }
            ListElement {
                name: "Partage de notes"
                index:2
            }
            ListElement {
                name: "Mindmap"
                index:3
            }
            ListElement {
                name: "Gestion de jeu de cartes"
                index:5
            }

    }
    ListView {
        id: listView2
        x: parent.width * 0.5
        y: parent.height * 0.2
        width: parent.width * 0.5
        height: parent.height * 0.8


        visible: page.idState != 4 ? true : false

        delegate: Item {
            width: app.width/2
            height: listView2.height/listView2.count
                Text {
                    color: app.txtColor
                    text: name
                    font.pointSize: (app.height >100 ? app.height : 800)/28
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: index=== 6 ? true : false
                }
                opacity: (page.idState >= index ) ? 1.0: 0.0
                Behavior on opacity {
                    NumberAnimation {
                        id: bouncebehavior2
                        duration: 1000
                    }
                }
        }
        model: ListModel {
            ListElement {
                name: "Fonctionnement"
                index:6
            }
            ListElement {
                name: "GUI pour écran tactile"
                 index:7
            }
            ListElement {
                name: "Portage Android/iOS"
                 index:8
            }
            ListElement {
                name: "Sécurité & chiffrage"
                 index:9
            }
            ListElement {
                name: "Accessibilité"
                 index:10
            }
        }
    }
}
