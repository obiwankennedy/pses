import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Le commencement"
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }




    ListModel {
        id: listSection
            ListElement {
                name: "2009 - Rolistik"
                index: 0
            }
            ListElement {
                name: "Dépannage"
                index: 1
            }
            ListElement {
                name: "fork"
                index: 2
            }
        }

}
