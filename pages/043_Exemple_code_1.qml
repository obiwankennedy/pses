import QtQuick 2.5
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Évolution du code"

    ListModel {
            ListElement {
                name: "Étude de la fonction: closeMapOrImage"
                index: 0
            }
            ListElement {
                name: "Récupération de l'id courant"
                index: 1
            }
            ListElement {
                name: "C'est une image ou une carte"
                index: 2
            }
            ListElement {
                name: "Suppression de la fenêtre"
                index: 3
            }
            ListElement {
                name: "Fermeture chez les autres joueurs."
                index: 4
            }
        }

    Keys.onDownPressed: {
        if(state == "")
        {
            state="media"
        }
        else if(state=="media")
        {
            state ="network";
        }
        else if(state=="network")
        {
            state ="";
        }
    }


    states: [
        State {
            name: ""
            PropertyChanges {
                target: listView1
                visible: true
            }
            PropertyChanges {
                target: idMedia
                visible: false
            }
        },
        State {
            name: "media"
            PropertyChanges {
                target: listView1
                visible: false
            }
            PropertyChanges {
                target: idMedia
                visible: true
            }
        },
        State {
            name: "network"
            PropertyChanges {
                target: listView1
                visible: false
            }
            PropertyChanges {
                target: idMedia
                visible: true
            }
            PropertyChanges {
                target: image2
                source: "qrc:/rsrc/rolistikNetwork.png"
            }
            PropertyChanges {
                target: image3
                source: "qrc:/rsrc/Rolisteam1Network.png"
            }
            PropertyChanges {
                target: image4
                source: ""
            }
        }
    ]
}
