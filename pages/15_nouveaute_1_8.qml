import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id: rectangle1
    width: app.width
    height: app.height
    //    height: 600
    //  anchors.centerIn: parent
    border.color: app.bgColor
    border.width: 5
    color: app.bgColor
    property int idState: 0
    focus: true
    Image {
        id: image1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: app.width*0.04
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/Rolisteam.svg"
        width: app.width*0.2
    }

    Text {
        id: text1
        anchors.top:image1.top
        //anchors.horizontalCenter: parent.horizontalCenter
        anchors.left: image1.right
        anchors.bottom: image1.bottom
        anchors.right: parent.right
        width: app.width*0.5
        height: app.height*0.01
        color: app.txtColor
        text: qsTr("Les nouveautés v1.8")
        anchors.horizontalCenterOffset: 1
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: app.height/20
    }
    Keys.onUpPressed: {
        --idState
    }
    Keys.onDownPressed: {
        ++idState
    }
    onIdStateChanged:  {
        trigger.start()
    }
    Timer {
        id: trigger
        interval: 1001
        repeat: false
        onTriggered: app.currentItemChanged(view.currentItem)
    }
    ListView {
        id: listView1
        x: app.width/4
        y: app.height/4
        width: app.width/2
        height: app.height/2
        delegate: Item {
            width: app.width/2
            height: listView1.height/listView1.count
            Text {
                color: app.txtColor
                text: name
                font.pointSize: (app.height >100 ? app.height : 800)/28
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
            }
            opacity: (rectangle1.idState >= index ) ? 1.0: 0.0
            Behavior on opacity {
                NumberAnimation {
                    id: bouncebehavior
                    duration: 1000
                }
            }
        }

        model: ListModel {
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
        opacity: (rectangle1.idState == 0 || rectangle1.idState == 2 || rectangle1.idState == 4 ) ? 1.0: 0.0

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
