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
#include "qmlcontroler.h"
#include "ui_qmlcontroler.h"
#include <QDebug>
#include "cpphighlighter.h"
#include <QQuickTextDocument>
#include <QQmlContext>

template <class T> T childObject(QQmlApplicationEngine& engine,
                                 const QString& objectName,
                                 const QString& propertyName)
{
    QList<QObject*> rootObjects = engine.rootObjects();
    foreach (QObject* object, rootObjects)
    {
        QList<QObject*> children = object->findChildren<QObject*>(objectName);
        for(auto child : children)
        {
            if (child != 0)
            {
                std::string s = propertyName.toStdString();
                QObject* object = child->property(s.c_str()).value<QObject*>();
                Q_ASSERT(object != 0);
                T prop = dynamic_cast<T>(object);
                Q_ASSERT(prop != 0);
                return prop;
            }
        }
    }
    return (T) 0;
}

QmlControler::QmlControler(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::QmlControler)
{
    ui->setupUi(this);

    m_timer = new QTimer();
    m_timer->setInterval(100);
    connect(m_timer,SIGNAL(timeout()),this,SLOT(refreshView()));


    m_diceParser = new DiceParser();
    m_resultModel = new DiceResultModel();

    m_diceParser->insertAlias(new DiceAlias("GS","d10e10r1k"),1);
    m_diceParser->insertAlias(new DiceAlias("G","d10e10k"),0);

    m_label = new QLabel();
    m_label->setLineWidth(0);
    m_label->setFrameStyle(QFrame::NoFrame);
    ui->scrollArea->setWidget(m_label);
    ui->scrollArea->setAlignment(Qt::AlignCenter);
    ui->scrollArea->setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
    ui->scrollArea->setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOff);

    //connect(m_label)
    m_commentData << "<br/>";


    m_commentData << "<br/>";


    m_commentData << "<br/>";


    m_commentData << "4";
    m_commentData << "5";
    m_commentData << "6";
    m_commentData << "2d6<br/>10D10s<br/>2d6c[%2=0]<br/>6d10e10k3<br/>(4D6)D10<br/>1L[tete,buste,ventre,bras,jambe]<br/>100190D6666666s<br/>6d10e10kl3<br/>1d100i[&lt;50]{\"Succes %1\"}{\"Echec %1\"}";
    m_commentData << "8";
    m_commentData << "9";
    m_commentData << "10";
    m_commentData << "11";
    m_commentData << "Roll20<br/>Fantasy Ground<br/>MapTool";
    m_commentData << "13";
    m_commentData << "14";
    m_commentData << "15";
    m_commentData << "16";

    m_currentScreen = 0;

    ui->scrollArea->installEventFilter(this);
    m_label->installEventFilter(this);
}

QmlControler::~QmlControler()
{
    delete ui;
}


DiceResultModel *QmlControler::getResultModel() const
{
    return m_resultModel;
}

void QmlControler::setResultModel(DiceResultModel *resultModel)
{
    m_resultModel = resultModel;
}

QQmlApplicationEngine *QmlControler::getEngine() const
{
    return m_engine;
}

void QmlControler::setEngine(QQmlApplicationEngine *engine)
{
    m_engine = engine;
    initConnection();
}
void QmlControler::initConnection()
{
    QObject* root = m_engine->rootObjects().first();
    m_window = qobject_cast<QQuickWindow*>(root);
    m_label->setScaledContents(true);
    m_label->setSizePolicy(QSizePolicy::Ignored, QSizePolicy::Ignored);

    connect(root,SIGNAL(currentItemChanged(int)),this,SLOT(currentPageHasChanged(int)));


m_timer->start();


}
#include <QMouseEvent>
bool QmlControler::eventFilter(QObject* label, QEvent* vt)
{
    if(label==ui->scrollArea)
    {
        if(vt->type() == QEvent::Resize)
        {
            resizeLabel();
        }
    }
    else if((label == m_label)&&
           ((vt->type() == QEvent::MouseButtonPress)||(vt->type() == QEvent::MouseButtonRelease)||(vt->type() == QEvent::MouseMove)))
    {
        QMouseEvent* evt = static_cast<QMouseEvent*>(vt);
        QPoint posOnLabel= evt->pos();


        int w = m_label->geometry().width();
        int h = m_label->geometry().height();

        qreal ratioW =  (qreal)m_window->width()/ ((qreal)w);
        qreal ratioH =  (qreal)m_window->height()/((qreal)h) ;

        qreal x = (posOnLabel.x()) * ratioW;
        qreal y = (posOnLabel.y()) * ratioH;

        QPointF posOnQML(x,y);
        QMouseEvent* event = new QMouseEvent(evt->type(),posOnQML.toPoint(),evt->button(),evt->buttons(),evt->modifiers());

        QObject* root = m_engine->rootObjects().first();
        //QCoreApplication::sendEvent(m_window,event);
        QCoreApplication::sendEvent(root,event);
        //m_window->sendEvent(m_window->contentItem(),event);
    }
    return false;
}
void QmlControler::refreshView()
{
    if(m_window != nullptr)
    {
        QImage img = m_window->grabWindow();


        m_ratioImage = (double)img.size().width()/img.size().height();
            m_ratioImageBis = (double)img.size().height()/img.size().width();

            m_label->setPixmap(QPixmap::fromImage(img));
            resizeLabel();
    }
}
void QmlControler::currentPageHasChanged(int i)
{
    m_currentScreen = i;
    QImage img = m_window->grabWindow();

    if(img.isNull())
        return;

    static int count = 0;


    //img.save(tr("/home/renaud/application/mine/pasSageEnSeine/screen/%1_screen.png").arg(++count,3,10,QChar('0')),"png");
    //qDebug() << "id page shot save" << i;

    m_ratioImage = (double)img.size().width()/img.size().height();
    m_ratioImageBis = (double)img.size().height()/img.size().width();

    m_label->setPixmap(QPixmap::fromImage(img));

    if((i+1>=0)&&(i+1<m_commentData.size()))
    {
        ui->textEdit->setHtml(m_commentData.at(i));
    }
    resizeLabel();
/*    QQuickTextDocument* doc = childObject<QQuickTextDocument*>(*m_engine, "cppTextEditor", "textDocument");
    if(NULL!=doc)
    {
        new CppHighLighter(doc->textDocument());
    }*/
}
void QmlControler::resizeLabel()
{
    int w = ui->scrollArea->viewport()->rect().width();
    int h = ui->scrollArea->viewport()->rect().height();
    if(w>h*m_ratioImage)
    {
        m_label->resize(h*m_ratioImage,h);
    }
    else
    {
        m_label->resize(w,w*m_ratioImageBis);
    }
}
void QmlControler::resizeEvent(QResizeEvent *event)
{
        resizeLabel();

    QMainWindow::resizeEvent(event);

}
void QmlControler::closeEvent(QCloseEvent* closeEvnt)
{
     m_window->close();
     QMainWindow::closeEvent(closeEvnt);
}
void QmlControler::showEvent(QShowEvent * nt)
{
    QMainWindow::showEvent(nt);
}
void QmlControler::rollDice(QString str)
{
    qDebug() << str;
    m_resultModel->insertCommand(str);
    QString result="";
    if(m_diceParser->parseLine(str))
    {
        m_diceParser->Start();
        if(!m_diceParser->getErrorMap().isEmpty())
        {
            result +=  "<span style=\"color: #FF0000;font-weight:bold\">Error:</span>" + m_diceParser->humanReadableError() + "<br/>";
        }
        else
        {

            ExportedDiceResult list;
            bool homogeneous = true;
            m_diceParser->getLastDiceResult(list,homogeneous);
            QString diceText = diceToText(list,true,homogeneous);
            QString scalarText;
            QString str;

            if(m_diceParser->hasIntegerResultNotInFirst())
            {
                scalarText = QString("%1").arg(m_diceParser->getLastIntegerResult());
            }
            else if(!list.isEmpty())
            {
                scalarText = QString("%1").arg(m_diceParser->getSumOfDiceResult());
            }


            str = QString("Result: <span style=\"color: #FF0000;font-weight:bold\">%1</span>, details:[%3 (%2)]").arg(scalarText).arg(diceText).arg(m_diceParser->getDiceCommand());


            if(m_diceParser->hasStringResult())
            {
                str = m_diceParser->getStringResult();
            }
            result += str + "<br/>";
        }
    }

    m_resultModel->insertResult(result);
}
QString QmlControler::diceToText(ExportedDiceResult& dice,bool highlight,bool homogeneous)
{
    QStringList resultGlobal;
    foreach(int face, dice.keys())
    {
        QStringList result;
        QStringList currentStreak;
        QList<QStringList> allStreakList;
        ListDiceResult diceResult =  dice.value(face);
        bool previousHighlight=false;
        QString previousColor;
        QString patternColor("<span style=\"color: #FF0000;font-weight:bold\">");
        foreach (HighLightDice tmp, diceResult)
        {
            if(previousColor != tmp.getColor())
            {
                if(!currentStreak.isEmpty())
                {
                    QStringList list;
                    list << patternColor+currentStreak.join(',')+"</span>";
                    allStreakList.append(list);
                    currentStreak.clear();
                }
                if(tmp.getColor().isEmpty())
                {
                    patternColor = QStringLiteral("<span style=\"color: #FF0000;font-weight:bold\">");
                }
                else
                {
                    patternColor = QStringLiteral("<span style=\"color:%1;font-weight:bold\">").arg(tmp.getColor());
                }
            }
            QStringList diceListStr;
            if((previousHighlight)&&(!tmp.isHighlighted()))
            {
                if(!currentStreak.isEmpty())
                {
                    QStringList list;
                    list << patternColor+currentStreak.join(',')+"</span>";
                    allStreakList.append(list);
                    currentStreak.clear();
                }

            }
            else if((!previousHighlight)&&(tmp.isHighlighted()))
            {
                if(!currentStreak.isEmpty())
                {
                    QStringList list;
                    list << currentStreak.join(',');
                    allStreakList.append(list);
                    currentStreak.clear();
                }
            }
            previousHighlight = tmp.isHighlighted();
            previousColor = tmp.getColor();
            for(int i =0; i < tmp.getResult().size(); ++i)
            {
                qint64 dievalue = tmp.getResult()[i];
                diceListStr << QString::number(dievalue);
            }
            if(diceListStr.size()>1)
            {
                QString first = diceListStr.takeFirst();
                first = QString("%1 [%2]").arg(first).arg(diceListStr.join(','));
                diceListStr.clear();
                diceListStr << first;
            }
            currentStreak << diceListStr.join(' ');
        }

        if(previousHighlight)
        {
            QStringList list;
            list <<  patternColor+currentStreak.join(',')+"</span>";
            allStreakList.append(list);
        }
        else
        {
            if(!currentStreak.isEmpty())
            {
                QStringList list;
                list << currentStreak.join(',');
                allStreakList.append(list);
            }
        }
        foreach(QStringList a, allStreakList)
        {
            result << a;
        }
        if(dice.keys().size()>1)
        {
            resultGlobal << QString(" d%2:(%1)").arg(result.join(",")).arg(face);
        }
        else
        {
            resultGlobal << result.join(",");
        }
    }
    return resultGlobal.join("");
}
