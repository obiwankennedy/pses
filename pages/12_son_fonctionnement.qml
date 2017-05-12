import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.2


Rectangle {
    id: howitwork
    width: app.width
    height: app.height
    property int idState : 0
    border.color: app.bgColor
    border.width: 5
    color: app.bgColor
    property alias listView1: listView1
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
        text: qsTr("Son fonctionnement")
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
        y: app.height/8
        width: app.width/2
        height: app.height/3
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
            opacity: (howitwork.idState >= index ) ? 1.0: 0.0
            Behavior on opacity {
                NumberAnimation {
                    id: bouncebehavior
                    duration: 1000
                }
            }
        }

        model: ListModel {
            ListElement {
                name: "Application Client/Serveur TCP/IP"
                index: 0
            }
            ListElement {
                name: "Application MDI"
                index: 1
            }
            ListElement {
                name: "C++/Qt"
                index:2
            }
        }
    }
    ListModel {
        id: codeData
        ListElement {
            Language: "C++"
            files: 153
            comment: 4634
            code: 33169
        }
        ListElement {
            Language: "C/C++ Header"
            files: 149
            comment: 8586
            code: 6664
        }
        ListElement {
            Language: "Bourne Shell"
            files: 11
            comment: 244
            code: 431
        }
        ListElement {
            Language: "IDL"
            files: 4
            comment: 0
            code: 339
        }
        ListElement {
            Language: "QML"
            files: 9
            comment: 2
            code: 297
        }
        ListElement {
            Language: "CMake"
            files: 3
            comment: 12
            code: 112
        }
        ListElement {
            Language: "Python"
            files: 1
            comment: 12
            code: 61
        }
        ListElement {
            Language: "make"
            files: 1
            comment: 24
            code: 15
        }
        ListElement {
            Language: "Somme"
            files: 331
            comment: 13513
            code: 41088
        }
    }
    TableView {
        //width: app.width/2
        //height: ScreenH/2
        anchors.left: listView1.left
        anchors.right:listView1.right
        anchors.top: listView1.bottom
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        Layout.preferredHeight: 1000
        model:codeData
        opacity: (idState >= 3 ) ? 1.0: 0.0
        headerDelegate : Item {
            height: 40
            Text {
                text: styleData.value
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: (app.height >100 ? app.height : 800)/50
            }
        }

        rowDelegate: Rectangle{
            width: childrenRect.width
            height: 40
            color: (styleData.row%2==0) ? "grey" : "white"
        }
        itemDelegate: Item {

            Text {
                anchors.verticalCenter: parent.verticalCenter
                color: "black" //styleData.textColor
                elide: styleData.elideMode
                text: styleData.value
                font.pointSize: (app.height >100 ? app.height : 800)/50
            }
        }

        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
        TableViewColumn {
            role: "Language"
            title: "Language"
            width: app.width/8.01
        }
        TableViewColumn {
            role: "files"
            title: "Fichiers"
            horizontalAlignment: Text.AlignHCenter
            width: app.width/8.01
        }
        TableViewColumn {
            role: "comment"
            title: "Commentaire"
            horizontalAlignment: Text.AlignHCenter
            width: app.width/8.01
        }
        TableViewColumn {
            role: "code"
            title: "Code"
            horizontalAlignment: Text.AlignHCenter
            width: app.width/8.01
        }
    }
}
