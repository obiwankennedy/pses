import QtQuick 2.5

import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtGraphicalEffects 1.0

ApplicationWindow {
    id: app
    visibility: Window.FullScreen;
   // width: app.width
   // height: app.height
    visible: true
    title: qsTr("End Users and QML in Rolisteam!")

    property color bgColor: "transparent"
    property color txtColor: "white"
    readonly property int bgcount : 5

    signal currentItemChanged(int current)
    property alias current: view.currentIndex
    onCurrentChanged: {
        //topcornerimage.visible = false
        //bottomcornerimage.visible = false
        if(current==0)
            bgimg.source = "qrc:/rsrc/graywood2.jpg"
        else if(current % bgcount == 0)
        {
            bgimg.source = "qrc:/rsrc/graywood2.jpg"
        }
        else if(current % bgcount == 1)
        {
            bgimg.source = "qrc:/rsrc/chaton.jpg";
        }
        else if(current % bgcount == 2)
        {
            bgimg.source = "qrc:/rsrc/lionne.jpg";
           // topcornerimage.visible = true
        }
        else if(current % bgcount == 3)
        {
            bgimg.source = "qrc:/rsrc/dice.jpg";
           // topcornerimage.visible = true
        }
        else if(current % bgcount == 4)
        {
            bgimg.source = "qrc:/rsrc/arbre.jpeg";
           // topcornerimage.visible = true
        }
/*

        else if(current % 9 == 4)
        {
            bgimg.source = "qrc:/rsrc/dragon.jpg";
           // topcornerimage.visible = true
        }
        else if(current % 9 == 5)
        {
            bgimg.source = "qrc:/rsrc/cloud.jpg";
           // topcornerimage.visible = true
        }
        else if(current % 9 == 7)
        {
            bgimg.source = "qrc:/rsrc/square.jpg";
           // topcornerimage.visible = true
        }
        else if(current % 9 == 8)
        {
            bgimg.source = "qrc:/rsrc/nyc.jpg";
           // topcornerimage.visible = true
        }*/
    }

    signal rollDiceCmd(string cmd)
    ListModel {
            id: qtConModel
            ListElement {
                name: "Intro"
                path: "01_qtCon_intro.qml"
                time: 1
                next: "rcse"
            }
            ListElement {
                name: "Rolisteam CharacterSheet Editor"
                path: "02_qtCon_rcse.qml"
                time: 1
                next: "stay in touch"
            }
            ListElement {
                name: "Stay In Touch"
                path: "03_qtCon_stayintouch.qml"
                time: 1
                next: ""
            }
    }
    ListModel {
            id: panelModel
            ListElement {
                name: "Intro"
                path: "01_intro.qml"
                time: 1
                next: "Présentation de Rolisteam"
            }
            ListElement {
                name: "Présentation de Rolisteam"
                path: "02_presentation.qml"
                time: 1
                next: "définition Jdr"
            }
            ListElement {
                name: "Introduction au jdr"
                path: "03_jdr_et_rolisteam.qml"
                time: 1
                next: "Les contraintes"
            }
            ListElement {
                name: "Contraintes"
                path: "04_jdr_avantages_pb.qml"
                time: 1
                next: "Avantages de l'informatique"
            }

            ListElement {
                name: "Le jdr virtuel le plus"
                path: "05_avantage_jdr_virtuel.qml"
                time: 1
                next: "Fonctionnalités"
            }
            ListElement {
                name: "Fonctionnalités Rolisteam"
                path: "06_fonctionnalites_rolisteam.qml"
                time: 1
                next: "Système de dés"
            }
            ListElement {
                name: "Dice Parser"
                path: "13_dice_parser.qml"
                time: 1
                next: "Dice Parser 2"
            }
            ListElement {
                name: "Dice Parser 2"
                path: "14_deep_in_dice_parser.qml"
                time: 1
                next: "RCSE"
            }
            ListElement {
                name: "RCSE"
                path: "14_rcse.qml"
                time: 1
                next: "Son usage"
            }
            /*ListElement {
                name: "Les Nouveautés 1.9"
                path: "15_nouveaute_1_8.qml"
                time: 1
                next: "À venir"
            }*/
            /*ListElement {
                name: "Début de rolisteam"
                path: "07_rolisteam_debut.qml"
                time: 1
                next: "rolistik à rolisteam"
            }*/
           /* ListElement {
                name: "Rolistik à Rolisteam"
                path: "08_Rolistik_a_Rolisteam.qml"
                time: 1
                next: "Frise"
            }*/
            /*ListElement {
                name: "La frise"
                path: "10_frise_chronologique.qml"
                time: 1
                next: "Usage"
            }*/
            ListElement {
                name: "Son usage"
                path: "11_son_usage.qml"
                time: 1
                next: "Fonctionnement"
            }
            ListElement {
                name: "Son fonctionnement"
                path: "12_son_fonctionnement.qml"
                time: 1
                next: "L'avenir"
            }
            ListElement {
                name: "Projets d'avenir"
                path: "16_projet_avenir.qml"
                time: 1
                next: "Réussites"
            }
            ListElement {
                name: "Réussites"
                path: "17_reussites.qml"
                time: 1
                next: "Leçons"
            }
            ListElement {
                name: "Les leçons"
                path: "18_les_lecons.qml"
                time: 1
                next: "Libre et Rolisteam"
            }
            ListElement {
                name: "Objectif Rolisteam Libre"
                path: "19_objectif_rolisteam_libre.qml"
                time: 1
                next: "Need You"
            }
            ListElement {
                name: "Rolisteam a besoin de vous "
                path: "19_grafilabor.qml"
                time: 1
                next: "Fin FAQ"
            }
            ListElement {
                name: "Fin "
                path: "20_FAQ.qml"
                time: 1
                next: ""
            }
            /*ListElement {
                name: "Contact"
                path: "03_qtCon_stayintouch.qml"
                time: 1
                next: ""
            }*/
        }
    //Component.onCompleted: app.currentItemChanged(0)
   /* onVisibleChanged: trigger.start()
    Rectangle {
        id: rect
        anchors.fill: parent
        color: app.bgColor
    }*/
    Image {
        id: bgimg
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: "qrc:/rsrc/graywood2.jpg"
        verticalAlignment: Image.AlignBottom
    }
    FastBlur {
        anchors.fill: bgimg
        source: bgimg
        radius: 32
        opacity: bgimg.opacity
    }

    onVisibleChanged: trigger.start()

    PathView {
        id: view
        anchors.fill: parent
        model: panelModel
        highlightRangeMode:PathView.StrictlyEnforceRange
        snapMode: PathView.SnapOneItem
        delegate:  Loader {
            //property variant model: model
             source: "pages/"+path
             width: app.width
             height: app.height
        }

        Timer {
            id: trigger
            interval: 10
            repeat: false
            onTriggered: app.currentItemChanged(view.currentIndex)
        }

        onOffsetChanged: {
            if(Math.floor(offset)===offset)
            {
                //app.currentItemChanged(offset)
                trigger.start()
            }
        }
        interactive: false
        focus: true
        Keys.onLeftPressed: {
            decrementCurrentIndex()
        }
        Keys.onRightPressed:{
            incrementCurrentIndex()
        }
        Keys.onEscapePressed: {
            if(app.visibility === Window.FullScreen)
            {
                app.visibility = Window.Windowed;
            }
            else
            {
                app.visibility = Window.FullScreen;
            }
        }

        path: Path {
            startX: view.width/2
            startY: view.height/2
            PathLine { x: view.width/2+view.width*panelModel.count; y: view.height/2 }
        }
    }

    ListView {
        id: listView1
        x: app.width*0.02
        y: app.height*0.3
        width: parent.width/2
        height: app.height*0.2
        delegate: Item {
            width: parent.width
            height: listView1.height/listView1.count
                Text {
                    color: view.currentIndex>=index ? "black" : "gray"
                    text: name
                    font.pointSize: (app.height >100 ? app.height : 800)/48
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true

                }
        }
        visible: false //view.currentIndex>0 ? true : false

        model: ListModel {
            ListElement {
                name: "Concepts"
                index:1
            }
            ListElement {
                name: "Chroniques"
                index:6
            }
            ListElement {
                name: "Logiciel"//système de build, code spécifique par OS.
                index:9
            }
            ListElement {
                name: "Bilan"
                index:15
            }
        }
    }

    Text {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.bottomMargin: 50
        color: app.txtColor
        text: (view.currentIndex+1)+"/"+view.count
        visible: view.currentIndex>0 ? true : false
    }

    Image {
        anchors.fill: parent
        source: "qrc:/rsrc/Masque-Video.png"
        //opacity: 0.5
        fillMode: Image.Pad
        visible: false
    }
    Text {
        anchors.top: parent.top
        color: app.txtColor
        anchors.right: parent.right
        text: panelModel.get(view.currentIndex).next+">"
        visible: panelModel.get(view.currentIndex).next !== "" ? true : false
    }
}
