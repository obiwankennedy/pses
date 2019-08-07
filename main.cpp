/***************************************************************************
    *   Copyright (C) 2016 by Renaud Guezennec                                *
    *   http://www.rolisteam.org/contact                                      *
    *                                                                         *
    *   rolisteam is free software; you can redistribute it and/or modify     *
    *   it under the terms of the GNU General Public License as published by  *
    *   the Free Software Foundation; either version 2 of the License, or     *
    *   (at your option) any later version.                                   *
    *                                                                         *
    *   This program is distributed in the hope that it will be useful,       *
    *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
    *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
    *   GNU General Public License for more details.                          *
    *                                                                         *
    *   You should have received a copy of the GNU General Public License     *
    *   along with this program; if not, write to the                         *
    *   Free Software Foundation, Inc.,                                       *
    *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
    ***************************************************************************/
#include <QApplication>
#include <QQmlApplicationEngine>
#include "qmlcontroler.h"
#include <QQmlContext>
#include <QQuickTextDocument>
#include <QScreen>

#include "cpphighlighter.h"
#include "diceresultmodel.h"
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("ScreenW",1920);//1920x1080
    engine.rootContext()->setContextProperty("ScreenH",1080);
    DiceResultModel* model = new DiceResultModel();

    engine.rootContext()->setContextProperty("_diceModel",model);

   /* QTextDocument text(NULL);
    CppHighLighter cppHighLighter(&text);
    engine.rootContext()->setContextProperty("_hightedDoc",&text);*/
    //engine.rootContext()->setContextProperty("CppHighLightedDocument",720);

    QmlControler ctr;
    ctr.setResultModel(model);
    ctr.setEngine(&engine);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    QList<QObject*> roots = engine.rootObjects();
    QObject* root = roots.at(0);
    QObject::connect(root,SIGNAL(rollDiceCmd(QString)),&ctr,SLOT(rollDice(QString)));


    ctr.setVisible(true);


    return app.exec();
}
