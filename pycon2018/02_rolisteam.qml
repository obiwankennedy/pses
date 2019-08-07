import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: jdr
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Rolisteam"
    ListModel {
        id: listSection
        ListElement {
            name: "Rolisteam"
            index:0
        }
        ListElement {
            name: "Logiciel de jeu de rôle en ligne"
            index:1
        }
        ListElement {
            name: "2009 à aujourd'hui"
            index:2
        }
        ListElement {
            name: "2015 - faire des vidéos"
            index:3
        }
    }
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }

    Image {
        x: parent.width*0.5
        y: parent.height*0.3
        source:"qrc:/rsrc/screen.png"
        width: parent.width*0.5
        height: parent.height*0.5
        fillMode: Image.PreserveAspectFit
    }
}
