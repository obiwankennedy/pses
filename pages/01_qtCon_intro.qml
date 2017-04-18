import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id: jdr
    width: Screen.width
    height: Screen.height
    border.color: app.bgColor
    border.width: 5
    color: app.bgColor
    property int idState: 0
    Image {
        id: logo
        width: jdr.width*0.30
        height: jdr.height*0.30
        fillMode: Image.PreserveAspectFit
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/rsrc/Rolisteam.svg"
    }
    Text {
        id: text1
        anchors.top:parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: jdr.height*0.1
        color: app.txtColor
        text: qsTr("End users and QML in Rolisteam!")
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignBottom
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: jdr.height/18
        onHeightChanged: {
            console.log("height: "+height)
        }

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
            height: listView1.height/listView1.count
                Text {
                    color: app.txtColor
                    text: name
                    font.pointSize: ScreenH/28
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
                name: "Renaud Guezennec"
                index:0
            }
            ListElement {
                name: "Rolisteam"
                index:1
            }
            ListElement {
                name: "Character Sheets"
                index:2
            }
            ListElement {
                name: "QML"
                index:3
            }
        }
    }
    Image {
        id: image2
        anchors.bottom: parent.bottom
       // anchors.topMargin: jdr.height*0.1
        anchors.left: parent.left
        anchors.leftMargin: jdr.width*0.01
        width: jdr.width*0.1
        height: jdr.height*0.1
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/cc.png"
    }


}
