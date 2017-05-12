import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id: futurproject
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
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: image1.bottom
        width: app.width*0.5
        height: app.height*0.01
        color: app.txtColor
        text: qsTr("Dans l'avenir")
        anchors.horizontalCenterOffset: 1
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: app.height/20
    }
    Rectangle {

        anchors.left:image1.right
        anchors.leftMargin: -app.width*0.1
        anchors.top: image1.bottom
 //       anchors.topMargin: app.width*0.1
        width: app.width*0.8
        height: app.height*0.8
        color: "grey"
        opacity: (futurproject.idState == 4 ) ? 1.0: 0.0

        Image {
            id: mindmap
            anchors.fill: parent
            opacity: (futurproject.idState == 4 ) ? 1.0: 0.0
            Behavior on opacity {
                NumberAnimation {
                    duration: 1000
                }
            }
            source: "qrc:/rsrc/mindmap.svg"
        }
    }
    Keys.onUpPressed: {
        --idState

    }
    Keys.onDownPressed: {
        ++idState
    }
    onIdStateChanged: {
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
        visible: idState != 4 ? true : false
        //spacing: ScreenH*0.1
        width: app.width*0.4
        height: app.height*0.4
        delegate: Item {
            width: app.width/2
            height: listView1.height/listView1.count
                Text {
                    color: app.txtColor
                    text: name
                    font.pointSize: (app.height >100 ? app.height : 800)/28
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: index=== 0 ? true : false
                }
                opacity: (futurproject.idState >= index ) ? 1.0: 0.0
                Behavior on opacity {
                    NumberAnimation {
                        id: bouncebehavior
                        duration: 1000
                    }
                }
        }
        model: ListModel {
            ListElement {
                name: "Fonctionnalités"
                index:0
            }
            ListElement {
                name: "Serveur Dédié"
                index:1
            }
            ListElement {
                name: "Partage de notes"
                index:2
            }
            ListElement {
                name: "Mindmap"
                index:3
            }
            ListElement {
                name: "Gestion de jeu de cartes"
                index:5
            }
        }
    }
    ListView {
        id: listView2
        anchors.left: listView1.right
        anchors.top: listView1.top
        anchors.bottom: listView1.bottom

        //spacing: ScreenH*0.1
        width: app.width*0.3
        height: app.height/2
        visible: idState != 4 ? true : false

        delegate: Item {
            width: app.width/2
            height: listView2.height/listView2.count
                Text {
                    color: app.txtColor
                    text: name
                    font.pointSize: (app.height >100 ? app.height : 800)/28
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: index=== 6 ? true : false
                }
                opacity: (futurproject.idState >= index ) ? 1.0: 0.0
                Behavior on opacity {
                    NumberAnimation {
                        id: bouncebehavior2
                        duration: 1000
                    }
                }
        }
        model: ListModel {
            ListElement {
                name: "Fonctionnement"
                index:6
            }
            ListElement {
                name: "GUI pour écran tactile"
                 index:7
            }
            ListElement {
                name: "Portage Android/iOS"
                 index:8
            }
            ListElement {
                name: "Sécurité & chiffrage"
                 index:9
            }
            ListElement {
                name: "Accessibilité"
                 index:10
            }
        }
    }
}
