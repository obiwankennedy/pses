import QtQuick 2.0
import QtQuick.Window 2.2
import QtMultimedia 5.6
Rectangle {
    id: jdr
    width: Screen.width
    height: Screen.height
    border.color: app.bgColor
    border.width: 5
    color: app.bgColor
    property int idState: 0
    Text {
        id: text1
        anchors.top:parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: jdr.height*0.1
        color: app.txtColor
        text: qsTr("Rolisteam Character Sheet Editor")
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignBottom
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: jdr.height/18
    }
    focus: true
    Keys.onUpPressed: {
        --idState;
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
        x: jdr.width*0.1
        y: jdr.height*0.20
        width: jdr.width
        height: parent.height*0.8
        delegate: Item {
            width: jdr.width
            height: listView1.height/listView1.count
                Text {
                    color: app.txtColor
                    text: name
                    font.pointSize: (app.height >100 ? app.height : 800)/28
                    anchors.verticalCenter: parent.verticalCenter
                }
                opacity: (jdr.idState >= index ) ? 1.0: 0.0
                Behavior on opacity {
                    NumberAnimation {
                        duration: 1000
                    }
                }
        }

        model: ListModel {
            ListElement {
                name: "Dessine la fiche"
                index:0
            }
            ListElement {
                name: "Génère la fiche"
                index:2
            }
            ListElement {
                name: "Apprend le QML"
                index:4
            }
            ListElement {
                name: "Éditer le QML"
                index:5
            }
            ListElement {
                name: "L’utiliser"
                index:6
            }
        }
    }

    Image {
        id: img
        anchors.top: listView1.top
        anchors.topMargin: listView1.height/listView1.count
        anchors.left: listView1.left
        //anchors.right: jdr.right
        anchors.bottom: listView1.bottom
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/design_cs.png"
        opacity: (jdr.idState == 1 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }

    Image {
        id: img2
        anchors.top: listView1.top
        anchors.left: listView1.right
        anchors.leftMargin: -listView1.width*0.4

        anchors.right: jdr.right
        anchors.bottom: jdr.bottom
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/qml_generated.png"
        opacity: (jdr.idState == 4 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }

    Image {
        id: img3
        anchors.top: listView1.top
        anchors.left: listView1.right
        anchors.leftMargin: -listView1.width*0.4
        anchors.right: jdr.right
        anchors.bottom: jdr.bottom
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/test_rcse.png"
        opacity: (jdr.idState == 3 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }

   Image {
        id: img4
        anchors.fill:parent
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/end.png"
        opacity: (jdr.idState == 7) ? 1.0: 0.0
    }
    Video {
        id: video
        anchors.fill:parent
        source: "qrc:/rsrc/opening_CharacterSheet.mp4"
        visible: (jdr.idState == 7) ? true: false
        fillMode:VideoOutput.PreserveAspectFit
        onVisibleChanged: {
            video.play()
        }
       /* onStatusChanged:{
            video.play()
            video.seek(64*1000)
            video.pause()
        }*/
    }
}
