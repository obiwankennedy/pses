import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: jdr
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Problèmes et Solutions"
    ListModel {
        id: listSection
        ListElement {
            name: "Pb1: Lier la vidéo et le son (résolu par OBS)"
            index:0
        }
        ListElement {
            name: "Pb2: Ajouter les génériques (résolu par OBS)"
            index:1
        }
        ListElement {
            name: "Pb3: Volumes (normalisation, gain, peak)"
            index:2
        }
        ListElement {
            name: "Pb4: Les silences trop long"
            index:3
        }
        ListElement {
            name: "S1: Logiciels de montage vidéo (Pitivi, OpenShot et Kdenlive)"
            index:4
        }
        ListElement {
            name: "S2: ffmpeg"
            index:5
        }
        ListElement {
            name: "S3: Script Bash avec ffmpeg + audacity"
            index:6
        }
        ListElement {
            name: "Pb5: Réduction des silences pour la vidéo"
            index:6
        }
        ListElement {
            name: "Pb6: Automatisation du tout"
            index:7
        }
        ListElement {
            name: "S4: Moviepy"
            index:8
        }
    }


    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }

}
