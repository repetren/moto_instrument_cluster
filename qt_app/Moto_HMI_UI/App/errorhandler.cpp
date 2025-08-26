#include "errorhandler.h"
#include <qdebug.h>

ErrorHandler::ErrorHandler(QObject *parent)

    : QObject(parent)

{}

int ErrorHandler::mark() const {
    return m_mark;
}

int ErrorHandler::deleteMark() const {
    return m_deleteMark;
}

void ErrorHandler::test(int mark) {
    m_mark = mark;
    emit newErrorSignal();
}

void ErrorHandler::removeError(int mark) {
    m_deleteMark = mark;
    emit removeErrorSignal();
}
