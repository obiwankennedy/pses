import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Les nouveautés v1.8"
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }

    ListModel {
        id: listSection
            ListElement {
                name: "Plan vectoriel"
                index: 0
            }
            ListElement {
                name: "Fiche de personnage"
                index: 2
            }
            ListElement {
                name: "Générateur de nom et Convertisseur"
                index: 4
            }

    }
    Image {
        anchors.left:image1.right
        anchors.leftMargin: -app.width*0.1
        anchors.top: image1.bottom
       // anchors.topMargin: app.width*0.1
        width: app.width*0.8
        height: app.height*0.8
        opacity: (rectangle1.idState == 1 ) ? 1.0: 0.0
        fillMode: Image.PreserveAspectFit
        source:"qrc:/rsrc/v1.8.png"
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }
    Image {
        anchors.left:image1.right
        anchors.leftMargin: -app.width*0.1
        anchors.top: image1.bottom
        //anchors.topMargin: app.width*0.1
        width: app.width*0.8
        height: app.height*0.8
        opacity: (rectangle1.idState == 3 ) ? 1.0: 0.0
        fillMode: Image.PreserveAspectFit
        source:"qrc:/rsrc/fiche_perso.png"
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }
    Row {
        anchors.left:image1.right
        anchors.leftMargin: -app.width*0.1
        anchors.top: image1.bottom
        anchors.topMargin: app.width*0.1
        width: app.width*0.8
        height: app.height*0.8
        opacity: (rectangle1.idState == 5 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
        Image {

            fillMode: Image.PreserveAspectFit
            source:"qrc:/rsrc/generatorConvertor.png"
            width: parent.width*0.5
        }
        Image {

            fillMode: Image.PreserveAspectFit
            source:"qrc:/rsrc/generat.png"
            width: parent.width*0.5
        }
    }
}
