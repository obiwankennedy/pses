import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Les leçons"
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }




    ListModel {
        id: listSection
            ListElement {
                name: "Gestion de projet"
                index : 0
            }
            ListElement {
                name: "Internationalisation"
                index: 1
            }
            ListElement {
                name: "Contribution"
                index: 2
            }
            ListElement {
                name: "Streaming audio/chat vocal ou vidéo/Xmpp"
                index:3
            }
            ListElement {
                name: "Confusion Rolistik/Rolisteam"
                index:4
            }

    }
}
