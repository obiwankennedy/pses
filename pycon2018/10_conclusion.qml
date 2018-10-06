import QtQuick 2.0


SlidePage {
    id: jdr
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Exemples"
    ListModel {
        id: listSection
        ListElement {//color=\"blue\"
            name: "Editor"
            index:1
        }
        ListElement {
            name: "Dessiner avec gizeh"
            index:3
        }
        ListElement {
            name: "Séquence d'images"
            index:5
        }
        ListElement {
            name: "Conversion de format/Codec"
            index:7
        }
        ListElement {
            name: "Animation vectorielle & 3D"
            index:9
        }
        ListElement {
            name: "Placement des clips en fonction d'une image"
            index:11
        }
        ListElement {
            name: "Générique de Star Wars"
            index:13
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
            slideCode.visible = true;
            slideCode.code ="from moviepy.editor import *

clip = VideoFileClip(\"lac.mp4\").rotate(180)

clip.preview() # visuel dans une fenetre pygame
clip.show(10.5) # idem, permet de voir une frame

#visualiser dans ipython
clip.ipython_display(width=180)
"
        }
        else if(idState == 4)
        {
            slideCode.visible = true;
            slideCode.code ="import gizeh
import moviepy.editor as mpy

W,H = 128,128 # width, height, in pixels
duration = 2 # duration of the clip, in seconds

def make_frame(t):
    surface = gizeh.Surface(W,H)
    radius = W*(1+ (t*(duration-t))**2 )/6
    circle = gizeh.circle(radius, xy = (W/2,H/2), fill=(1,0,0))
    circle.draw(surface)
    return surface.get_npimage()

clip = mpy.VideoClip(make_frame, duration=duration)
clip.write_gif(\"circle.gif\",fps=15, opt=\"OptimizePlus\", fuzz=10)
"
        }
        else if(idState == 6)
        {
            slideCode.visible = true;
            slideCode.code ="

clip = ImageSequenceClip(images_list, fps=25)
clip.write_videofile(\"sequences.mp4\")
"
        }
        else if(idState == 8)
        {
            slideCode.visible = true;
            slideCode.code ="

my_clip.write_videofile(\"movie.mp4\",fps=15)
my_clip.write_videofile(\"movie.webm\") # webm format
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
