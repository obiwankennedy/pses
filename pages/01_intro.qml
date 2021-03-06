import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id: rectangle1
    width: app.width //app.width
    height: app.height //ScreenH

    border.width: 0
    color: app.bgColor

    Image {
        id: image1
        width: app.width*0.75
        height: app.height*0.75
        fillMode: Image.PreserveAspectFit
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/rsrc/Rolisteam.svg"
    }

    Text {
        id: text1
        anchors.top:image1.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: app.width*0.5
        height: app.height*0.1
        color: app.txtColor
        text: qsTr("Libérez vos parties!")
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: app.height/20
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
        anchors.top: parent.top
       // anchors.topMargin: ScreenH*0.1
        anchors.left: parent.left
        anchors.leftMargin: app.width*0.01
        width: app.width*0.1
        height: app.height*0.1
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/cc.png"
    }
}
