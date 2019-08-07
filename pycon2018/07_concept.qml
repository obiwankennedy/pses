import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: jdr
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Les concepts"
    ListModel {
        id: listSection
        ListElement {
            name: "Les clips: Audio, Video, VideoFile, Text, Image, Sequence"
            index:0
        }
        ListElement {
            name: "Créer, Éditer (couper, ralentir, assombrir, etc…) ou Mixer"
            index:1
        }
        ListElement {
            name: "SubClip, resize et les effets"
            index:2
        }
    }
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
