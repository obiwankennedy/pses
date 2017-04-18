TEMPLATE = app

QT += qml quick widgets

CONFIG += c++11

SOURCES += main.cpp \
    qmlcontroler.cpp \
    cpphighlighter.cpp \
    diceresultmodel.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = pages

# Default rules for deployment.
include(deployment.pri)
include(DiceParser/diceparser.pri)

OTHER_FILES += pages/*.qml *.qml

HEADERS += \
    qmlcontroler.h \
    cpphighlighter.h \
    diceresultmodel.h

FORMS += \
    qmlcontroler.ui

DISTFILES += \
    pages/051_license_libre_et_jdr.qml


