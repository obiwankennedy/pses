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
        text: qsTr("Le commencement")
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
               // visible: (listView1.currentIndex >= index ) ? true: false
                opacity: (listView1.currentIndex >= index ) ? 1.0: 0.0
                Behavior on opacity {
                    NumberAnimation {
                        id: bouncebehavior
                        duration: 1000
                    }
                }

        }
        focus: true
        Keys.onUpPressed: {
            decrementCurrentIndex()
        }
        Keys.onDownPressed: {
             incrementCurrentIndex()
        }
        onCurrentIndexChanged: {
            trigger.start()
        }

        Timer {
             id: trigger
             interval: 1001
             repeat: false
             onTriggered: app.currentItemChanged(view.currentItem)
         }
        model: ListModel {
            ListElement {
                name: "2009 - Rolistik"
                index: 0
            }
            ListElement {
                name: "Dépannage"
                index: 1
            }
            ListElement {
                name: "fork"
                index: 2
            }
        }
    }
}
