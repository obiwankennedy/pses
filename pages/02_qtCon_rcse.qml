import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id: jdr
    width: Screen.width
    height: Screen.height
    border.color: "#E3E3E3"
    border.width: 5
    color: "#E3E3E3"
    property int idState: 0
    Text {
        id: text1
        anchors.top:parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: jdr.height*0.1
        color: "black"
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
        height: parent.height*0.5
        delegate: Item {
            width: jdr.width
            height: parent.height/listView1.count
                Text {
                    color: "black"
                    text: name
                    font.pointSize: jdr.height/28
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
                name: "Do annoying stuff (e.g: design UI, field positioning)"
                index:0
            }
            ListElement {
                name: "Generate QML"
                index:2
            }
            ListElement {
                name: "Learn QML"
                index:5
            }
            ListElement {
                name: "Edit QML code"
                index:6
            }
            ListElement {
                name: "Test how it will appear in game"
                index:7
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
        opacity: (jdr.idState == 3 ) ? 1.0: 0.0
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
        opacity: (jdr.idState == 4 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }

    Image {
        id: img4
        anchors.top: listView1.top
        anchors.left: listView1.right
        anchors.leftMargin: -listView1.width*0.4

        anchors.right: jdr.right
        anchors.bottom: jdr.bottom
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/charactersheet_in_rolisteam.png"
        opacity: (jdr.idState == 8) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }
}
