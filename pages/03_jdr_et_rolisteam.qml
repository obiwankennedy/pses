import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Rolisteam et le jdr"

   ListModel {
            ListElement {
                name: "Le JDR ?"
                index:0
            }
            ListElement {
                name: "Comment se passe une partie ?"
                index:2
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
