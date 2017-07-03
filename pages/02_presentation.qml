import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: page
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Présentation Rolisteam"

    Image {
        id: screenShot
        source : "qrc:/rsrc/screen.png"
        y: parent.height * 0.2
        x: parent.width * 0.5
        //anchors.leftMargin: app.width*0.05

        fillMode: Image.PreserveAspectFit
        width: app.width*0.5
        height: app.height*0.6
        visible: true
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }

      ListModel {
          id: listSection
            ListElement {
                name: "2009 - fork de rolistik"
                index:0
            }
            ListElement {
                name: "Dépannage"
                index:1
            }
        }
}
