import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: ""//Libérez vos parties

    Text {
        id: grandTitre
        anchors.fill: parent
        color: app.txtColor
        text: qsTr("Libérez vos parties!")
        font.pixelSize: app.height/8
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
    }

    Text {
        id: text2
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        color: app.txtColor
        text: qsTr("Renaud Guezennec")
        font.pixelSize: app.height/25
    }

    Image {
        id: image2
        anchors.top:  view.bottom
        anchors.topMargin: -100

        anchors.left: parent.left
        anchors.leftMargin: app.width*0.01
        width: app.width*0.1
        height: app.height*0.1
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/cc.png"
    }
}
