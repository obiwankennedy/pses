import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id: rectangle1
    width: app.width
    height: app.height
    //    height: 600
    //  anchors.centerIn: parent
    border.color: app.bgColor
    border.width: 5
    color: app.bgColor
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
        text: qsTr("Fonctionnalités")
        anchors.horizontalCenterOffset: 1
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: app.height/20
    }

    Image {
        id: screenShotCase
        property string newSource: "qrc:/rsrc/chat.png"
        anchors.left: text1.right
        anchors.leftMargin: -app.width*0.1
        anchors.top: text1.bottom
        anchors.bottom: listView1.bottom
        anchors.right: parent.right
        fillMode: Image.PreserveAspectFit
        source:  "qrc:/rsrc/chat.png"
        state : "msg"
        states: [
            State {
              name: "msg"
              when: listView1.currentIndex == 0
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/chat.png"
              }
            },
            State {
              name: "dice"
              when: listView1.currentIndex == 9
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/dice.png"
              }
            },
            State {
              name: "note"
              when: listView1.currentIndex == 1
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/notes.png"
              }
            },
            State {
              name: "plans"
              when: listView1.currentIndex == 2
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/map.jpg"
              }
            },
            State {
              name: "img"
              when: listView1.currentIndex == 3
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/picture.png"
              }
            },
            State {
              name: "music"
              when: listView1.currentIndex == 4
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/music_screen.jpg"
              }
            },
            State {
              name: "theme"
              when: listView1.currentIndex == 7
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/darkfusiontheme.jpg"
              }
            },
            State {
              name: "convertisseur"
              when: listView1.currentIndex == 6
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/generatorConvertor.png"
              }
            },
            State {
              name: "generateur"
              when: listView1.currentIndex == 5
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/generat.png"
              }
            },
            State {
              name: "perso"
              when: listView1.currentIndex == 8
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/fiche_perso.png"
              }
            }


        ]
        transitions: [
            Transition {
                from: "*"
                to: "*"
                SequentialAnimation{
                    PropertyAnimation {
                        target: screenShotCase
                        property: "opacity"
                        from: 1.0
                        to: 0.0
                    }
                  /*  PropertyAction {
                        target: screenShotCase
                        property: "source"
                        value:screenShotCase.newSource
                    }*/
                    PropertyAnimation {
                        target: screenShotCase
                        property: "opacity"
                        from: 0.0
                        to: 1.0
                    }
                }

            }
        ]
    }


    ListView {
        id: listView1
        x: app.width*0.18
        y: app.height*0.2
        width: app.width*0.32
        height: app.height*0.8
        delegate: Item {
            width: app.width/2
            height: listView1.height/listView1.count
                Text {
                    color: app.txtColor
                    text: "-"+name
                    font.pointSize: (app.height >100 ? app.height : 800)/28
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                opacity: (listView1.currentIndex >= index ) ? 1.0: 0.0
                Behavior on opacity {
                    NumberAnimation {
                        duration: 1000
                    }
                }

        }
        focus: true
        Keys.onUpPressed: {
            decrementCurrentIndex()
        }
        Keys.onDownPressed: {
             incrementCurrentIndex()
        }
        onCurrentIndexChanged: {
            trigger.start()
        }

        Timer {
             id: trigger
             interval: 1001
             repeat: false
             onTriggered: app.currentItemChanged(view.currentItem)
         }
        model: ListModel {
            ListElement {
                name: "Messagerie Instantanée"
                index: 0
            }
            ListElement {
                name: "Notes"
                index: 1
            }
            ListElement {
                name: "Dessiner et partage de plans"
                index: 2
            }
            ListElement {
                name: "Partage d'images"
                index: 3
            }
            ListElement {
                name: "Musique d'ambiance (3 pistes)"
                index: 4
            }
            ListElement {
                name: "Générateur de nom"
                index: 5
            }
            ListElement {
                name: "Convertisseur d’unités"
                index: 6
            }
            ListElement {
                name: "Personnalisation (themes)"
                index: 7
            }
            ListElement {
                name: "Fiche de personnage"
                index: 8
            }
            ListElement {
                name: "Lancer des dés"
                index: 9
            }
        }
    }

}
