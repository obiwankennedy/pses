import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Merci, à vos questions !"
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }

    ListModel {
          id: listSection
                ListElement {//color=\"blue\"
                    name: "<i>Site web</i>: <b>www.rolisteam.org</b>"
                    index:1
                }
                ListElement {
                    name: "<i>Courriel</i>: <b>renaud@rolisteam.org</b>"
                    index:1
                }
                ListElement {
                    name: "<i>Github</i>: <b>github.com/Rolisteam</b>"
                    index:1
                }
                ListElement {
                    name: "<i>Twitter</i>: <b>@Rolisteam</b></font>"
                    index:1
                }
                ListElement {
                    name: "<i>Facebook</i>: <b>www.facebook.com/rolisteam</b>"
                    index:1
                }
                ListElement {
                    name: "<i>Youtube</i>: https://www.youtube.com/channel/UC4uoGZl1nQRXbVs8WjxjKvw"
                    index:1
                }
                ListElement {
                    name: "<i>Irc</i>: <b>#RolisteamOfficial</b> on freenode.net"
                    index:1
                }


    }

    Text {
        id: text2
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: app.width*0.4
        anchors.bottomMargin: 50
        color: app.txtColor
        text: qsTr("Merci à : Chewba, Hythlodée, Henriette")
    }
}
