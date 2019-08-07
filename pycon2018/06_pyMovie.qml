import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: jdr
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "MoviePy!"
    ListModel {
        id: listSection
        ListElement {
            name: "MoviePy"
            index:0
        }
        ListElement {
            name: "Dev principal: Zulko - https://github.com/Zulko/"
            index:1
        }
        ListElement {
            name: "Install: pip install moviepy"
            index:2
        }
        ListElement {
            name: "Documentation: http://zulko.github.io/moviepy"
            index:3
        }
        ListElement {
            name: "ffmpeg"
            index:4
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
