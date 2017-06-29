import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Contraintes"
    Component.onCompleted:
    {
        points = listSection2
        anchors.fill = parent
    }
    ListModel {
        id: listSection
        ListElement {
            name: "Amusant"
            index:0
        }
        ListElement {
            name: "Activités sociales"
            index:1
        }
    }


    ListModel {
        id: listSection2
        ListElement {
            name: "Géographique (ville, trajet…)"
            index:0
        }
        ListElement {
            name: "Temps (vie professionelle, de famille…)"
            index:1
        }
        ListElement {
            name: "Matérielle (Local, livres…)"
            index:2
        }
    }
}

