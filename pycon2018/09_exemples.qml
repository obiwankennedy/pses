import QtQuick 2.0
import QtMultimedia 5.9

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
            name: "Animation vectorielle & 3D (PyODE)"
            index:9
        }
        ListElement {
            name: "Placement des clips en fonction d'une image"
            index:11
        }
        ListElement {
            name: "Générique de Star Wars"
            index:14
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
            video.stop()
            video2.stop()
            view.opacity = 0
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
            video.stop()
            video2.stop()
            view.opacity = 0
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
            video.stop()
            video2.stop()
            view.opacity = 0
            slideCode.visible = true;
            slideCode.code ="clip = ImageSequenceClip(images_list, fps=25)
clip.write_videofile(\"sequences.mp4\")"
        }
        else if(idState == 8)
        {
            video.stop()
            video2.stop()
            view.opacity = 0
            slideCode.visible = true;
            slideCode.code ="my_clip.write_videofile(\"movie.mp4\",fps=15)
my_clip.write_videofile(\"movie.webm\") # webm format
"
        }
        else if(idState == 10)
        {
            video.stop()
            video2.stop()
            view.opacity = 0
            slideCode.visible = true;
            slideCode.code ="# =============== FIRST PART : SIMULATION WITH PyODE
            import ode

            lx, ly, lz, density = 1.0, 1.0, 1.0, 1.0
            world = ode.World()
            world.setGravity( (0,-9.81,0) )

            world.setCFM(1E-6)
            space = ode.Space()
            contactgroup = ode.JointGroup()
            geoms = []


            def near_callback(args, geom1, geom2):
                #Callback function for the collide() method below.
                #This function checks if the given geoms do collide and
                #creates contact joints if they do.

                contacts = ode.collide(geom1, geom2)
                world,contactgroup = args
                for c in contacts:
                    c.setBounce(0.01)
                    c.setMu(60000)
                    j = ode.ContactJoint(world, contactgroup, c)
                    j.attach(geom1.getBody(), geom2.getBody())


            def new_cube(xyz):
                # Creates a new PyODE cude at position (x,y,z)
                body = ode.Body(world)
                M = ode.Mass()
                M.setBox(density, lx, ly, lz)
                body.setMass(M)
                body.shape = \"box\"
                body.boxsize = (lx, ly, lz)
                body.setPosition(xyz)
                geom = ode.GeomBox(space, lengths=body.boxsize)
                geom.setBody(body)
                geoms.append(geom) # avoids that geom gets trashed
                return body

            # The objects of the scene:

            floor = ode.GeomPlane(space, (0,1,0), 0)
            cubes = [new_cube(xyz) for xyz in
                     [(0.5,3,0.5),(0.5,4,0),(0,5,0),(-0.5,6,0),
                      (-0.5,7,-0.5),(0,8,0.5)]]

            # Start the simulation !

            t = 0.0
            dt = 0.005
            duration = 4.0
            trajectories = []
            while t<duration:
                trajectories.append([(c.getPosition(), c.getRotation())
                                     for c in cubes])
                space.collide((world,contactgroup), near_callback)
                world.step(dt)
                contactgroup.empty()
                t+=dt


            # =============== SECOND PART : RENDERING WITH VAPORY

            from moviepy.editor import VideoClip, ipython_display
            from vapory import *

            light = LightSource( [10,10,10], 'color', [3,3,3],
                                 'parallel', 'point_at', [0, 0, 0])

            ground = Plane([0,1,0],0, Texture('Rosewood'))

            def vapory_box(xyz, R):
                # Draws a box with at the given position and rotation
                return Box([-lx/2, -ly/2, -lz/2], [lx/2, ly/2, lz/2],
                            Texture('T_Ruby_Glass'), Interior('ior',4),
                            'matrix', R+xyz)

            def make_frame(t):
                # Returns the image of the scene rendered at time t
                boxes = [vapory_box(position, rotation)
                         for (position, rotation) in trajectories[int(t/dt)]]
                scene = Scene( Camera(\"location\", [0,3,-4], \"look_at\", [0,0,0]),
                               [light, ground, Background(\"White\")] + boxes,
                               included=[\"colors.inc\", \"textures.inc\", \"glass.inc\"])
                return scene.render(height=300, width=400, antialiasing=0.0001)

            clip = VideoClip(make_frame, duration=duration)
            clip.write_videofile(\"pyODE.avi\", codec='png', fps=20)  # lossless format"
        }
        else if(idState == 13)
        {
            video.stop()
            video2.stop()
            view.opacity = 0
            slideCode.visible = true;
            slideCode.code ="from moviepy.editor import *
from moviepy.video.tools.segmenting import findObjects

# Load the image specifying the regions.
im = ImageClip(\"../../ultracompositing/motif.png\")

# Loacate the regions, return a list of ImageClips
regions = findObjects(im)

# Load 7 clips from the US National Parks. Public Domain :D
clips = [VideoFileClip(n, audio=False).subclip(18,22) for n in
     [ \"videos/romo_0004.mov\",
      \"videos/apis-0001.mov\",
      \"videos/romo_0001.mov\",
      \"videos/elma_s0003.mov\",
      \"videos/elma_s0002.mov\",
      \"videos/calo-0007.mov\",
      \"videos/grsm_0005.mov\"]]

# fit each clip into its region
comp_clips =  [c.resize(r.size)
                .set_mask(r.mask)
                .set_pos(r.screenpos)
               for c,r in zip(clips,regions)]

cc = CompositeVideoClip(comp_clips,im.size)
cc.resize(0.6).write_videofile(\"composition.mp4\")"
        }
        else if(idState == 12)
        {
            view.opacity = 0
            video2.play()

        }
        else if(idState == 15)
        {
            view.opacity = 0
            video.play()

        }
        else if(idState == 16)
        {
            video.stop()
            video2.stop()
            view.opacity = 0
            slideCode.visible = true;
            slideCode.code = "import numpy as np
from skimage import transform as tf

from moviepy.editor import *
from moviepy.video.tools.drawing import color_gradient

# RESOLUTION

w = 720
h = w*9/16 # 16/9 screen
moviesize = w,h

# THE RAW TEXT
txt = \"\n\".join([
\"A long time ago, in a faraway galaxy,\",
\"there lived a prince and a princess\",
\"who had never seen the stars, for they\",
\"lived deep underground.\",
\"\",
\"Many years before, the prince's\",
\"grandfather had ventured out to the\",
\"surface and had been burnt to ashes by\",
\"solar winds.\",
\"\",
\"One day, as the princess was coding\",
\"and the prince was shopping online, a\",
\"meteor landed just a few megameters\",
\"from the couple's flat.\"
])


# Add blanks
txt = 10*\"\n\" +txt + 10*\"\n\"


# CREATE THE TEXT IMAGE


clip_txt = TextClip(txt,color='white', align='West',fontsize=25,
                    font='Xolonium-Bold', method='label')


# SCROLL THE TEXT IMAGE BY CROPPING A MOVING AREA

txt_speed = 27
fl = lambda gf,t : gf(t)[int(txt_speed*t):int(txt_speed*t)+h,:]
moving_txt= clip_txt.fl(fl, apply_to=['mask'])


# ADD A VANISHING EFFECT ON THE TEXT WITH A GRADIENT MASK

grad = color_gradient(moving_txt.size,p1=(0,2*h/3),
                p2=(0,h/4),col1=0.0,col2=1.0)
gradmask = ImageClip(grad,ismask=True)
fl = lambda pic : np.minimum(pic,gradmask.img)
moving_txt.mask = moving_txt.mask.fl_image(fl)


# WARP THE TEXT INTO A TRAPEZOID (PERSPECTIVE EFFECT)

def trapzWarp(pic,cx,cy,ismask=False):
    \"\"\" Complicated function (will be latex packaged as a fx) \"\"\"
    Y,X = pic.shape[:2]
    src = np.array([[0,0],[X,0],[X,Y],[0,Y]])
    dst = np.array([[cx*X,cy*Y],[(1-cx)*X,cy*Y],[X,Y],[0,Y]])
    tform = tf.ProjectiveTransform()
    tform.estimate(src,dst)
    im = tf.warp(pic, tform.inverse, output_shape=(Y,X))
    return im if ismask else (im*255).astype('uint8')

fl_im = lambda pic : trapzWarp(pic,0.2,0.3)
fl_mask = lambda pic : trapzWarp(pic,0.2,0.3, ismask=True)
warped_txt= moving_txt.fl_image(fl_im)
warped_txt.mask = warped_txt.mask.fl_image(fl_mask)


# BACKGROUND IMAGE, DARKENED AT 60%

stars = ImageClip('../../videos/stars.jpg')
stars_darkened = stars.fl_image(lambda pic: (0.6*pic).astype('int16'))


# COMPOSE THE MOVIE

final = CompositeVideoClip([
         stars_darkened,
         warped_txt.set_pos(('center','bottom'))],
         size = moviesize)


# WRITE TO A FILE

final.set_duration(8).write_videofile(\"starworms.avi\", fps=5)

# This script is heavy (30s of computations to render 8s of video)


def annotate(clip,txt,txt_color='white',bg_color=(0,0,255)):
    txtclip = TextClip(txt, fontsize=20, font='Ubuntu-bold',
                       color=txt_color)
    txtclip = txtclip.on_color((clip.w,txtclip.h+6), color=(0,0,255),
                        pos=(6,'center'))
    cvc =  CompositeVideoClip([clip , txtclip.set_pos((0,'bottom'))])
    return cvc.set_duration(clip.duration)


def resizeCenter(clip):
    return clip.resize( height=h).set_pos('center')

def composeCenter(clip):
    return CompositeVideoClip([clip.set_pos('center')],size=moviesize)

annotated_clips = [ annotate(clip,text) for clip,text in [

(composeCenter(resizeCenter(stars)).subclip(0,3),
    \"This is a public domain picture of stars\"),

(CompositeVideoClip([stars],moviesize).subclip(0,3),
    \"We only keep one part.\"),

(CompositeVideoClip([stars_darkened],moviesize).subclip(0,3),
    \"We darken it a little.\"),

(composeCenter(resizeCenter(clip_txt)).subclip(0,3),
    \"We generate a text image.\"),

(composeCenter(moving_txt.set_mask(None)).subclip(6,9),
    \"We scroll the text by cropping a moving region of it.\"),

(composeCenter(gradmask.to_RGB()).subclip(0,2),
    \"We add this mask to the clip.\"),

(composeCenter(moving_txt).subclip(6,9),
    \"Here is the result\"),

(composeCenter(warped_txt).subclip(6,9),
    \"We now warp this clip in a trapezoid.\"),

(final.subclip(6,9),
    \"We finally superimpose with the stars.\")
]]

# Concatenate and write to a file

concatenate_videoclips(annotated_clips).write_videofile('tutorial.avi', fps=5)"
        }
        else
        {
            view.opacity = 1
            slideCode.visible = false
            view.focus = false
            video.stop()
            video2.stop()
        }
    }

    AnimatedImage {
        id: gifplayer
        anchors.verticalCenter: parent.verticalCenter
        x: parent.width*0.6
        width: parent.width*0.3
        height: parent.height*0.3
        visible: idState == 4
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/pycon/redball.gif"
    }

    AnimatedImage {
        id: gifplayer2
        x: parent.width*0.6
        y: parent.height*0.4
        width: parent.width*0.3
        height: parent.height*0.3
        fillMode: Image.PreserveAspectFit
        visible: idState == 10
        source: "qrc:/rsrc/pycon/cube.gif"
    }

    Video {
        id: video2
        anchors.centerIn: parent
        width: parent.width*0.5
        height: parent.height*0.5
        source: "qrc:/rsrc/pycon/composing_image.mp4"
        visible: idState == 12
    }
    Image {
        id: img
        anchors.right: video2.left
        anchors.top: video2.top
        anchors.bottom: video2.bottom
        source: "qrc:/rsrc/pycon/compo_from_image.jpeg"
        visible: idState == 12
        fillMode: Image.PreserveAspectFit
    }

    Video {
        id: video
        anchors.centerIn: parent
        width: parent.width*0.5
        height: parent.height*0.5
        source: "qrc:/rsrc/pycon/Star_Worms.mp4"
        visible: idState == 15
    }

}
