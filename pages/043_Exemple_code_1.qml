import QtQuick 2.5
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
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: image1.bottom
        width: app.width*0.5
        height: app.height*0.01
        color: app.txtColor
        text: qsTr("Évolution du code")
        anchors.horizontalCenterOffset: 1
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: app.height/20
    }
    ListView {
        id: listView1
        x: app.width/4
        y: app.height/4
        width: app.width/2
        height: app.height/2.2
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
        }
        model: ListModel {
            ListElement {
                name: "Étude de la fonction: closeMapOrImage"
            }
            ListElement {
                name: "Récupération de l'id courant"
            }
            ListElement {
                name: "C'est une image ou une carte"
            }
            ListElement {
                name: "Suppression de la fenêtre"
            }
            ListElement {
                name: "Fermeture chez les autres joueurs."
            }
        }
    }
    Keys.onDownPressed: {
        if(state == "")
        {
            state="media"
        }
        else if(state=="media")
        {
            state ="network";
        }
        else if(state=="network")
        {
            state ="";
        }
    }


    states: [
        State {
            name: ""
            PropertyChanges {
                target: listView1
                visible: true
            }
            PropertyChanges {
                target: idMedia
                visible: false
            }
        },
        State {
            name: "media"
            PropertyChanges {
                target: listView1
                visible: false
            }
            PropertyChanges {
                target: idMedia
                visible: true
            }
        },
        State {
            name: "network"
            PropertyChanges {
                target: listView1
                visible: false
            }
            PropertyChanges {
                target: idMedia
                visible: true
            }
            PropertyChanges {
                target: image2
                source: "qrc:/rsrc/rolistikNetwork.png"
            }
            PropertyChanges {
                target: image3
                source: "qrc:/rsrc/Rolisteam1Network.png"
            }
            PropertyChanges {
                target: image4
                source: ""
            }
        }
    ]
}
