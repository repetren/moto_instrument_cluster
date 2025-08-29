#ifndef BRIDGETOQML_H
#define BRIDGETOQML_H

#include <QObject>

class BridgeToQML : public QObject
{

    Q_OBJECT

    Q_PROPERTY(uint16_t value READ value WRITE setValue NOTIFY valueChanged FINAL)
    Q_PROPERTY(bool flag READ flag WRITE setFlag NOTIFY flagChanged FINAL)


public:
    explicit BridgeToQML(QObject *parent = nullptr);

    //Getter
    uint16_t value() const;
    bool flag() const;

    //Setter
    void setValue(uint16_t newValue);
    void setFlag(bool flag);

signals:
    void valueChanged();
    void flagChanged();

private:
    uint16_t m_value = 0;
    bool m_flag = false;
};

#endif // BRIDGETOQML_H
