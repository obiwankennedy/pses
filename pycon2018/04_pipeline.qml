import QtQuick 2.0
import QtQuick.Window 2.2
import QtMultimedia 5.8

SlidePage {
    id: jdr
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Mes Pipelines d'enregistrement"
    ListModel {
        id: listSection
        ListElement {
            name: "1: SimpleScreenRecorder (SSR) + Teamspeak (TS)(2015)"
            index:0
        }
        ListElement {
            name: "     En sortie: Un fichier vidéo, un fichier son (non synchronisé)"
            index:1
        }
        ListElement {
            name: ""
            index:1
        }
        ListElement {
            name: "2: Avatar Highlight + SSR + TS + plugin v1"
            index: 2
        }
        ListElement {
            name: "     En sortie: Un fichier vidéo, un fichier son (non synchronisé)"
            index:3
        }
        ListElement {
            name: ""
            index:3
        }
        ListElement {
            name: "3: Avatar Highlight + SSR + TS + plugin v2"
            index: 4
        }
        ListElement {
            name: "     En sortie: Un fichier vidéo, un fichier son synchronisé"
            index:5
        }
        ListElement {
            name: ""
            index:5
        }
        ListElement {
            name: "4: OBS Studio + Avatar Highlight + Rolisteam"
            index:6
        }
        ListElement {
            name: "     En sortie: Une vidéo avec du son (2017)"
            index:7
        }
        ListElement {
            name: ""
            index:7
        }
        ListElement {
            name: "A retenir"
            index:8
        }
    }
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
    Video {
        id: video
        anchors.centerIn: parent
        width: parent.width*0.5
        height: parent.height*0.5
        source: "qrc:/rsrc/pycon/01_first_video.mp4"
        volume:0.0

        onPlaybackStateChanged:{
            console.log("state:"+playbackState)
            if(playbackState == MediaPlayer.PlayingState)
                view.opacity = 0.0
            else
                view.opacity = 1.0

        }

    }

    onIdStateChanged: {
        if(idState == 1)
        {
            video.visible = true
            video.play()
        }
        else if(idState == 6)
        {
            video.visible = true
            video.volume = 1.0
            video.source = "qrc:/rsrc/pycon/01_second_video.mp4"
            video.play()
        }
        else
        {
            video.visible = false
        }
    }

}
