#ifndef FLAGTOQML_H
#define FLAGTOQML_H

#include <QObject>

class FlagToQML : public QObject
{

    Q_OBJECT

    Q_PROPERTY(bool flag READ flag WRITE setFlag NOTIFY flagChanged FINAL)

public:
    FlagToQML(QObject *parent = nullptr);

    // Getter
    bool flag() const;

    // Setter
    void setFlag(bool flag);

signals:
    void flagChanged();

private:
    bool m_flag = false;
};

#endif // FLAGTOQML_H
