import QtQuick 2.0

SlidePage {
    id: jdr
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Rolisteam et MoviePy!"
    ListModel {
        id: listSection
        ListElement {
            name: "Renaud Guezennec"
            index:0
        }
        ListElement {
            name: "dev C++/Qt"
            index:1
        }
        ListElement {
            name: "Expérience Python"
            index:2
        }
        ListElement {
            name: "Rolisteam"
            index:3
        }
    }
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
