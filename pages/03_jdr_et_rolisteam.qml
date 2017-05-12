import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id: jdr
    width: app.width
    height: app.height
    border.color: app.bgColor
    border.width: 5
    color: app.bgColor
    property int idState: 0
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
        text: qsTr("Rolisteam et le jdr")
        anchors.horizontalCenterOffset: 1
        //anchors.topMargin: -203
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: app.height/20
    }
    focus: true
    Keys.onUpPressed: {
        --idState;
        //decrementCurrentIndex()
    }
    Keys.onDownPressed: {
        ++idState
       /* if(!panelInfo.visible)
        {
            panelInfo.visible = true
        }
        else
        {
            incrementCurrentIndex()
        }*/
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
                opacity: (jdr.idState >= index ) ? 1.0: 0.0
                Behavior on opacity {
                    NumberAnimation {
                        duration: 1000
                    }
                }
        }

        model: ListModel {
            ListElement {
                name: "Le JDR ?"
                index:0
            }
            ListElement {
                name: "Comment se passe une partie ?"
                index:2
            }
        }
    }
    Text {
        id: panelInfo

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: app.height*0.1
        horizontalAlignment: Text.AlignHCenter
        width: parent.width*0.8
        //height: parent.height*0.3
        color: app.txtColor
        font.pointSize: (app.height >100 ? app.height : 800)/50
        text: "«<i>Le jeu de rôle est un jeu de société dans lequel les participants <br/>conçoivent ensemble une fiction par l’interprétation de rôles et par la narration,<br/> dans le cadre de contraintes de jeu qu’ils s’imposent.</i>»<br/>   -Wikipedia"
        opacity: (jdr.idState == 1 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }
}
