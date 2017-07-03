import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.2


SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Son fonctionnement"
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
        view.height = rectangle1.height * 0.4
    }
      ListModel {
          id: listSection
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
        anchors.left: view.left
        anchors.right:view.right
        anchors.top: view.bottom
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
