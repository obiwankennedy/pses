import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Avantages de l'informatique"
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
     ListModel {
         id: listSection
            ListElement {
                name: "Coût et temps de transport"
                index: 0
            }
            ListElement {
                name: "Zone de recrutement plus grande"
                index: 1
            }
            ListElement {
                name: "Abstraction des règles"
                index:2
            }
     }
}
