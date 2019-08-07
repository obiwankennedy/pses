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
    title: qsTr("Pycon2018: Rolisteam et pyMovie!")

    property color bgColor: "transparent"
    property color txtColor: "white"
    readonly property int bgcount : 5

    signal currentItemChanged(int current)
    property alias current: view.currentIndex

    FontLoader {id: inriaSan; source:"qrc:/rsrc/font/inria-sans/InriaSans-Regular.otf"}

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
            id: pyCon2018
            ListElement {
                name: "Intro"
                path: "01_intro.qml"
                time: 1
                next: "rolisteam"
            }
            ListElement {
                name: "Rolisteam"
                path: "02_rolisteam.qml"
                time: 1
                next: "besoin"
            }
            ListElement {
                name: "Le besoin"
                path: "03_besoin.qml"
                time: 1
                next: "pipeline"
            }
            ListElement {
                name: "Les pipelines Vidéos"
                path: "04_pipeline.qml"
                time: 1
                next: "solution"
            }
            ListElement {
                name: "Les solutions logicielles"
                path: "05_solutions.qml"
                time: 1
                next: "moviepy"
            }
            ListElement {
                name: "Présentation pyMovie"
                path: "06_pyMovie.qml"
                time: 1
                next: "Les concepts"
            }
            ListElement {
                name: "Les concepts"
                path: "07_concept.qml"
                time: 1
                next: "Le code"
            }
            ListElement {
                name: "Le code"
                path: "08_code.qml"
                time: 1
                next: "Exemples"
            }
            ListElement {
                name: "Exemples"
                path: "09_exemples.qml"
                time: 1
                next: "Conclusion"
            }
            ListElement {
                name: "Conclusion"
                path: "10_conclusion.qml"
                time: 1
                next: "Fin"
            }
            ListElement {
                name: "Fin"
                path: "11_fin.qml"
                time: 1
                next: ""
            }
    }

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
        model: pyCon2018
        highlightRangeMode:PathView.StrictlyEnforceRange
        snapMode: PathView.SnapOneItem
        delegate:  Loader {
            //property variant model: model
             source: "pycon2018/"+path
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
            PathLine { x: view.width/2+view.width*pyCon2018.count; y: view.height/2 }
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
        font.family: inriaSan.name
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
        font.family: inriaSan.name
        text: pyCon2018.get(view.currentIndex).next+">"
        visible: pyCon2018.get(view.currentIndex).next !== "" ? true : false
    }
}
