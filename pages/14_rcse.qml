import QtQuick 2.0
import QtQuick.Window 2.2
import QtMultimedia 5.6


SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Rolisteam Character Sheet Editor"
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
   ListModel {
       id: listSection
        ListElement {
            name: "Dessiner la fiche"
            index:0
        }
        ListElement {
            name: "Génèrer la fiche"
            index:2
        }
        ListElement {
            name: "Apprendre le QML"
            index:4
        }
        ListElement {
            name: "Éditer le QML"
            index:5
        }
        ListElement {
            name: "L’utiliser"
            index:6
        }
    }


    Image {
        id: img
        x: parent.width * 0.5
        y: parent.height * 0.2
        width: parent.width * 0.5
        height: parent.height * 0.5
        anchors.bottom: view.bottom
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/design_cs.png"
        opacity: (rectangle1.idState === 1 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }

    Image {
        id: img2
        x: parent.width * 0.5
        y: parent.height * 0.2
        width: parent.width * 0.5
        height: parent.height * 0.5
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/qml_generated.png"
        opacity: (rectangle1.idState === 4 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }

    Image {
        id: img3
        x: parent.width * 0.5
        y: parent.height * 0.2
        width: parent.width * 0.5
        height: parent.height * 0.5
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/test_rcse.png"
        opacity: (rectangle1.idState === 3 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }

   Image {
        id: img4
        anchors.fill:parent
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/end.png"
        opacity: (rectangle1.idState === 7) ? 1.0: 0.0
    }
    Video {
        id: video
        anchors.fill:parent
        source: "qrc:/rsrc/opening_CharacterSheet.mp4"
        visible: (rectangle1.idState === 7) ? true: false
        fillMode:VideoOutput.PreserveAspectFit
        onVisibleChanged: {
            video.play()
        }
    }
}
