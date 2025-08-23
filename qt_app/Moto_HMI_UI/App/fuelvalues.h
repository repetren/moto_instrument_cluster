//Fuel backend for interace
//Displaing fuel level, aproximated range, liter per 100 km,
//handling low fuel levels

#ifndef FUELVALUES_H
#define FUELVALUES_H

#include <QObject>

class FuelValues : public QObject
{
    Q_OBJECT

    Q_PROPERTY(uint16_t fuelLevel READ fuelLevel NOTIFY fuelLevelChanged)
    Q_PROPERTY(uint16_t fuelRange READ fuelRange NOTIFY fuelRangeChanged)
    Q_PROPERTY(uint8_t litersPerKm READ litersPerKm NOTIFY litersPerKmChanged)
    Q_PROPERTY(bool lowLevel READ lowLevel NOTIFY lowLevelChanged)


public:
    explicit FuelValues(QObject *parent = nullptr);

    //Getter functions
    uint16_t fuelLevel() const;
    uint16_t fuelRange() const;
    uint8_t litersPerKm() const;
    bool lowLevel() const;

    // Setter functions
    void updateFuelLevel(uint16_t value);
    void updateFuelRange(uint16_t value);
    void updateLowLevel(bool value);


signals:
    void fuelLevelChanged();
    void fuelRangeChanged();
    void litersPerKmChanged();
    void lowLevelChanged();

private:
    uint16_t m_fuelLevel = 2000;
    uint16_t m_fuelRange = 125;
    uint8_t m_litersPerKm = 4;
    bool m_lowLevel = false;

};

#endif // FUELVALUES_H
