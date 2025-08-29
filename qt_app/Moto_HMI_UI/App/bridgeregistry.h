#ifndef BRIDGEREGISTRY_H
#define BRIDGEREGISTRY_H

#include <QQmlContext>
#include <QQmlApplicationEngine>

#include "App/flagtoqml.h"
#include "valuetoqml.h"

class BridgeRegistry {

public:
    BridgeRegistry() = default;

    void registerAll(QQmlApplicationEngine& engine) {

        auto context = engine.rootContext();

        // Telemetry contexts
        context->setContextProperty("odoBackend", &odoBackend);
        context->setContextProperty("tripABackend", &tripABackend);
        context->setContextProperty("rpmBackend", &rpmBackend);
        context->setContextProperty("speedBackend", &speedBackend);
        context->setContextProperty("engineTemp", &engineTemp);
        context->setContextProperty("coolantTemp", &coolantTemp);
        context->setContextProperty("gearBox", &gearBox);

        // Fuel contexts
        context->setContextProperty("litersPerKm", &litersPerKm);
        context->setContextProperty("fuelLevel", &fuelLevel);
        context->setContextProperty("fuelRange", &fuelRange);
        context->setContextProperty("lowFuelLevel", &lowFuelLevel);

        // Lights objects
        context->setContextProperty("turnLeft", &turnLeft);
        context->setContextProperty("turnRight", &turnRight);
        context->setContextProperty("drlState", &drlState);
        context->setContextProperty("beamMode", &beamMode);
    }

    // Telemetry objects
    ValueToQML odoBackend;
    ValueToQML tripABackend;
    ValueToQML rpmBackend;
    ValueToQML speedBackend;
    ValueToQML engineTemp;
    ValueToQML coolantTemp;
    ValueToQML gearBox;

    // Fuel objects
    ValueToQML litersPerKm;
    ValueToQML fuelLevel;
    ValueToQML fuelRange;
    FlagToQML lowFuelLevel;

    // Lights objects
    FlagToQML turnLeft;
    FlagToQML turnRight;
    FlagToQML drlState;
    ValueToQML beamMode;


};

#endif // BRIDGEREGISTRY_H
