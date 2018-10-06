import QtQuick 2.0
import QtQuick.Window 2.2


SlidePage {
    id: jdr
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Merci de votre attention"
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
            name: "<i>Github</i>: <b>https://github.com/Rolisteam</b>"
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
            name: "<i>Youtube</i>: https://www.youtube.com/c/RolisteamYT"
            index:1
        }
        ListElement {
            name: "<i>Discord</i>: https://discord.gg/MrMrQwX"
            index:1
        }
    }


    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
