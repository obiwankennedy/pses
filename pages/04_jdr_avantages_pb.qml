import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id: ads
    width: app.width
    height: app.height
    //    height: 600
    //  anchors.centerIn: parent
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
        text: qsTr("Contraintes")
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
        if(idState==-1)
        {
            idState=0;
        }
    }
    Keys.onDownPressed: {
        ++idState;
        if(idState==3)
        {
            idState=0;
        }
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
        width: app.width*0.3
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
                opacity: (ads.idState >= index ) ? 1.0: 0.0
                Behavior on opacity {
                    NumberAnimation {
                        duration: 1000
                    }
                }
        }
        model: ListModel {
            ListElement {
                name: "Amusant"
                index:0
            }
            ListElement {
                name: "Activités sociales"
                index:1
            }
        }
        visible: false
    }
    ListView {
        id: listView2
        //anchors.left: listView1.right
        x: app.width/4
        anchors.top: listView1.top
        width: app.width/2
        height: app.height/4
        delegate: Item {
            width: app.width/2
            height: listView2.height/listView1.count
                Text {
                    color: app.txtColor
                    text: name
                    font.pointSize: (app.height >100 ? app.height : 800)/28
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                opacity: (ads.idState>= index ) ? 1.0: 0.0
                Behavior on opacity {
                    NumberAnimation {
                        duration: 1000
                    }
                }
        }
        model: ListModel {
            ListElement {
                name: "Géographique (ville, trajet…)"
                index:0
            }
            ListElement {
                name: "Temps (boulot, vie de famille…)"
                index:1
            }
            ListElement {
                name: "Matérielle (Local, livres…)"
                index:2
            }
        }
    }
}
