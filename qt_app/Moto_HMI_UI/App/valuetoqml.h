#ifndef VALUETOQML_H
#define VALUETOQML_H

#include <QObject>

class ValueToQML : public QObject
{

    Q_OBJECT

    Q_PROPERTY(uint16_t value READ value WRITE setValue NOTIFY valueChanged FINAL)

public:
    explicit ValueToQML(QObject *parent = nullptr);

    //Getter
    uint16_t value() const;

    //Setter
    void setValue(uint16_t newValue);

signals:
    void valueChanged();

private:
    uint16_t m_value = 0;
};

#endif // VALUETOQML_H
