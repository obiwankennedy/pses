import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.2


SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Son usage"
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
     ListModel {
         id: listSection
            ListElement {
                name: "4 cas de figure"
                index: 0
            }
            ListElement {
                name: "Le MJ: permission"//système de build, code spécifique par OS.
                index: 1
            }
        }


    Image {


        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width * 0.4
        height: parent.height * 0.4

        fillMode: Image.PreserveAspectFit

        source: "qrc:/rsrc/diagram.jpg"
        opacity: (usage.idState == 0 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }
    Image {
        x: app.width*0.6
        anchors.right: parent.right
        anchors.top: listView1.top
        anchors.topMargin: app.height*0.2

        width: app.width*0.4
        height: app.height*0.4
        fillMode: Image.PreserveAspectFit

        source: "qrc:/rsrc/entree.png"
        opacity: (usage.idState ==1 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }
    Image {
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -20
        anchors.left: parent.left
        anchors.leftMargin: app.width*0.15
        width: app.width*0.7
        height: app.height*0.7
        source: "qrc:/rsrc/screen.png"
        opacity: (usage.idState == 2 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }
}
