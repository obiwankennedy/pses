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
#include "diceresultmodel.h"

DiceResultModel::DiceResultModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

QVariant DiceResultModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    return QVariant();
}

int DiceResultModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;

    return m_result.size();
}

QVariant DiceResultModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();


    if(role == Result)
    {
        return m_result.at(index.row());
    }
    else if(role == Command)
    {
        return m_command.at(index.row());
    }
    return QVariant();
}
QVariant DiceResultModel::getCmd(int i)
{
    if((i>0)&&(i<m_command.size()))
        return m_command.at(i);
    else
        return QString();
}

bool DiceResultModel::insertResult(QString result)
{
    if(!result.isEmpty())
    {
        beginInsertRows(QModelIndex(), 0, 0);
        m_result.prepend(result);
        endInsertRows();
        return true;
    }
    return false;
}

bool DiceResultModel::insertCommand(QString cmd)
{
    m_command.prepend(cmd);
}
QHash<int, QByteArray>  DiceResultModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Result] = "result";
    roles[Command] = "cmd";
    return roles;
}
