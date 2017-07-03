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
                    index:0
                }
                ListElement {
                    name: "<i>Github</i>: <b>github.com/Rolisteam</b>"
                    index:0
                }
                ListElement {
                    name: "<i>Twitter</i>: <b>@Rolisteam</b></font>"
                    index:0
                }
                ListElement {
                    name: "<i>Facebook</i>: <b>www.facebook.com/rolisteam</b>"
                    index:0
                }
                ListElement {
                    name: "<i>Liberapay</i>: <b>https://liberapay.com/rolisteam/donate</b>"
                    index:0
                }
                ListElement {
                    name: "<i>Discord</i>: <b>https://discord.gg/MrMrQwX</b>"
                    index:0
                }
                ListElement {
                    name: "<i>Youtube</i>: www.youtube.com/channel/UC4uoGZl1nQRXbVs8WjxjKvw"
                    index:0
                }
                ListElement {
                    name: "<i>Courriel</i>: <b>renaud@rolisteam.org</b>"
                    index:0
                }
                ListElement {
                    name: "<i>Site technique</i>: <b>renaudguezennec.eu</b>"
                    index:0
                }
                ListElement {
                    name: "<i>Site roliste</i>: <b>blog.rolisteam.org</b>"
                    index:0
                }
                ListElement {
                    name: "<i>Twitter</i>: <b>@ObiLeSage</b>"
                    index:0
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
