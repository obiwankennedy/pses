import QtQuick 2.0


SlidePage {
    id: jdr
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Conclusion"
    ListModel {
        id: listSection
        ListElement {
            name: "moviepy dans mon process"
            index:1
        }
        ListElement {
            name: "Quand utiliser Moviepy ?"
            index:3
        }
        ListElement {
            name: "Trouver des exemples d'utilisation:
https://gist.github.com/Zulko"
            index: 4
        }
    }


    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }

    onIdStateChanged: {
        if(idState == 2)
        {
            view.opacity = 0.0
            slideCode.visible = true;
            slideCode.code ="
# Ensemble des commandes pour l'enregistrement
# Episode 22 campagne warhammer

promo 22 w

makeep 22 w # utilisation de moviepy

uploadYT.py -n 22 -c w
"
        }
        else
        {
            view.opacity = 1
            slideCode.visible = false
            view.focus = false
        }
    }
}
