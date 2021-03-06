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
#ifndef CPPHIGHLIGHTER_H
#define CPPHIGHLIGHTER_H

#include <QSyntaxHighlighter>

class CppHighLighter : public QSyntaxHighlighter
{    
    Q_OBJECT

public:
   CppHighLighter(QTextDocument *parent = 0);

protected:
   void highlightBlock(const QString &text);

private:
   struct HighlightingRule
   {
       QRegExp pattern;
       QTextCharFormat format;
   };
   QVector<HighlightingRule> highlightingRules;

   QTextCharFormat keywordFormat;
   QTextCharFormat propertyFormat;
   QTextCharFormat lookupFormat;
   QTextCharFormat quotationFormat;
   QTextCharFormat itemFormat;
   QTextCharFormat cppObjectFormat;
};

#endif // CPPHIGHLIGHTER_H
