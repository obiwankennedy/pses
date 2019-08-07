import QtQuick 2.0
import QtQuick.Window 2.2


SlidePage {
    id: jdr
    anchors.fill: parent
    logo: "qrc:/rsrc/Rolisteam.svg"
    focus: true
    title: "Le code"
    ListModel {
        id: listSection
        ListElement {
            name: "Concaténer 2 vidéos"
            index:1
        }
        ListElement {
            name: "Sampler votre vidéo"
            index: 3
        }
        ListElement {
            name: "Filtrer les samples"
            index:5
        }
        ListElement {
            name: "Encoder et écrire le fichier"
            index:7
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
            view.opacity = 0
            slideCode.visible = true;
            slideCode.code ="
from moviepy.editor import VideoFileClip, concatenate_videoclips

clip1 = VideoFileClip(\"generique_debut.mp4\")
clip2 = VideoFileClip(\"episode_36.mp4\")
clip3 = VideoFileClip(\"generique_fin.mp4\")

final_clip = concatenate_videoclips([clip1,clip2,clip3])
final_clip.write_videofile(\"episode_36_avec_generiques.mp4\")

"
        }
        else if(idState == 4)
        {
            view.opacity = 0
            slideCode.visible = true;
            slideCode.code ="import numpy as np
from moviepy.editor import VideoFileClip, concatenate_videoclips

video=\"/home/user/episode_36_avec_generiques.mp4\"
clip = VideoFileClip(video)

cut = lambda i: clip.audio.subclip(i,i+1).to_soundarray(fps=22000)
volume = lambda array: np.sqrt(((1.0*array)**2).mean())
volumes = [volume(cut(i)) for i in range(0,int(clip.audio.duration))]


"
        }
        else if(idState == 6)
        {
            view.opacity = 0
            slideCode.visible = true;
            slideCode.code ="final_times= []
#identify all part with sounds. What we keep.
for vol in volumes:
    if(begin != 0):
        if(( vol == 0.0 ) and (start!=-1)):
            end = i-1
            duo = [start,end]
            final_times.append(duo)
            sumVideo += (end-start)
            if(firstStart == 0):
                firstStart = start
            start = -1
        if((start == -1)and (vol>0.0)):
            start=i
        i=i+1
    begin=begin+1

duo=[0,firstStart]
final_times.insert(0,duo)
if(start != -1):
    final_times.append([start,begin])"
        }
        else if(idState == 8)
        {
            view.opacity = 0
            slideCode.visible = true;
            slideCode.code ="
final = concatenate_videoclips([clip.subclip(t[0],t[1])
      for t in final_times])

#write the file
final.write_videofile(finalpath,fps=25)"
        }
        else
        {
            view.opacity = 1
            slideCode.visible = false
            view.focus = false
        }
    }
}
