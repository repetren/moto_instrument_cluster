//Fuel backend for interace
//Displaing fuel level, aproximated range, liter per 100 km,
//handling low fuel levels

#ifndef FUELVALUES_H
#define FUELVALUES_H

#include <QObject>

class FuelValues : public QObject
{
    Q_OBJECT

    // Q_PROPERTY(uint16_t fuelRange READ fuelRange NOTIFY fuelRangeChanged)
    // Q_PROPERTY(bool lowLevel READ lowLevel NOTIFY lowLevelChanged)


public:
    explicit FuelValues(QObject *parent = nullptr);

    //Getter functions
    // uint16_t fuelRange() const;
    // bool lowLevel() const;

    // Setter functions
    // void updateFuelRange(uint16_t value);
    // void updateLowLevel(bool value);


signals:
    // void fuelRangeChanged();
    // void lowLevelChanged();

private:
    // uint16_t m_fuelRange = 125;
    // bool m_lowLevel = false;

};

#endif // FUELVALUES_H
