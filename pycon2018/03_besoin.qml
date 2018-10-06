import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: jdr
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Mon besoin"
    ListModel {
        id: listSection
        ListElement {
            name: "Montrer l'utilisation du logiciel"
            index:0
        }
        ListElement {
            name: "Garder un historique des parties"
            index:1
        }
        ListElement {
            name: "Rendre actratif le visionnage"
            index:2
        }
        ListElement {
            name: "Impératif: limiter le travail sur la vidéo"
            index:3
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
