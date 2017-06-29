import QtQuick 2.0
import QtQuick.Window 2.2


SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Le Libre dans le JDR"
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }

    ListModel {
            id: listSection
            ListElement {
                name: "Passerelle"
                index: 0
            }
            ListElement {
                name: "Réflexion sur le droit"
                index: 1
            }
            ListElement {
                name: "Décentralisation d'internet"
                index: 2
            }
        }

}
