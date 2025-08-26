#ifndef ERRORHANDLER_H
#define ERRORHANDLER_H

#include <QObject>

class ErrorHandler : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int mark READ mark NOTIFY newErrorSignal FINAL)
    Q_PROPERTY(int deleteMark READ deleteMark NOTIFY removeErrorSignal FINAL)

public:
    explicit ErrorHandler(QObject *parent = nullptr);

    int mark() const;
    int deleteMark() const;
    // void setMark(int value);

    void test(int mark);
    void removeError(int mark);

signals:
    void newErrorSignal();
    void removeErrorSignal();

private:
    int m_mark = 0;
    int m_deleteMark = 0;
};

#endif // ERRORHANDLER_H
