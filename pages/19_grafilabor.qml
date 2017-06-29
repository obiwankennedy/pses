import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Rolisteam a <i>besoin de vous</i>!"
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }

    ListModel {
        id:listSection
            ListElement {
                name: "Retour d'utilisation"
                index : 0
            }
            ListElement {
                name: "Logo"
                index: 1
            }
            ListElement {
                name: "Habillage"
                index: 2
            }
            ListElement {
                name: "Banque d'éléments"
                index:3
            }
            ListElement {
                name: "Réflexion d'Ux et de conception d'interface"
                index:4
            }
            ListElement {
                name: ""
                index:5
            }
            ListElement {
                name: "et toutes vos idées!"
                index:5
            }
        }

}
