import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: page
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Fonctionnalités"
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }

    Image {
        id: screenShotCase
        property string newSource: "qrc:/rsrc/chat.png"
        x: parent.width * 0.51
        y: parent.height * 0.2
        width: parent.width * 0.4
        height: parent.height * 0.8

        fillMode: Image.PreserveAspectFit
        source:  "qrc:/rsrc/chat.png"
        state : "msg"
        states: [
            State {
              name: "msg"
              when: page.idState === 0
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/chat.png"
              }
            },
            State {
              name: "dice"
              when: page.idState === 9
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/dice.png"
              }
            },
            State {
              name: "note"
              when: page.idState === 1
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/notes.png"
              }
            },
            State {
              name: "plans"
              when: page.idState === 2
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/map.jpg"
              }
            },
            State {
              name: "img"
              when: page.idState === 3
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/picture.png"
              }
            },
            State {
              name: "music"
              when: page.idState === 4
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/music_screen.jpg"
              }
            },
            State {
              name: "theme"
              when: page.idState === 7
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/darkfusiontheme.jpg"
              }
            },
            State {
              name: "convertisseur"
              when: page.idState === 6
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/generatorConvertor.png"
              }
            },
            State {
              name: "generateur"
              when: page.idState === 5
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/generat.png"
              }
            },
            State {
              name: "perso"
              when: page.idState >= 8
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


   ListModel {
       id: listSection
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
