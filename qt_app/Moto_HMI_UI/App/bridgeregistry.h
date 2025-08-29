#ifndef BRIDGEREGISTRY_H
#define BRIDGEREGISTRY_H

#include <QQmlContext>
#include <QQmlApplicationEngine>

#include "bridgetoqml.h"

class BridgeRegistry {

public:
    BridgeRegistry() = default;

    void registerAll(QQmlApplicationEngine& engine) {

        auto context = engine.rootContext();

        // Telemetry contexts
        context->setContextProperty("odoValue", &odoValue);
        context->setContextProperty("tripAValue", &tripAValue);

        // Fuel contexts
        context->setContextProperty("litersPerKm", &litersPerKm);
        context->setContextProperty("fuelLevel", &fuelLevel);
        context->setContextProperty("fuelRange", &fuelRange);
        context->setContextProperty("lowFuelLevel", &lowFuelLevel);
    }

    // Telemetry objects
    BridgeToQML odoValue;
    BridgeToQML tripAValue;

    // Fuel objects
    BridgeToQML litersPerKm;
    BridgeToQML fuelLevel;
    BridgeToQML fuelRange;
    BridgeToQML lowFuelLevel;

};

#endif // BRIDGEREGISTRY_H
