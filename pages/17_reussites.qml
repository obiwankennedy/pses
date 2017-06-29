import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Les réussites"
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }

   ListModel {
       id: listSection
            ListElement {
                name: "Multi-plateforme"
                 index: 0
            }
            ListElement {
                name: "Un acteur du Jdr à distance"
                 index: 1
            }
            ListElement {
                name: "Simple d'usage"
                 index: 2
            }
            ListElement {
                name: "Hackable"
                 index: 3
            }
            ListElement {
                name: "Défi technique"
                 index: 4
            }
            ListElement {
                name: "Logiciel Libre"
                index: 5
            }

    }
}
