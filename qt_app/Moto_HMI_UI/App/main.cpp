// Copyright (C) 2024 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QApplication>
#include <QQmlApplicationEngine>
#include "fuelvalues.h"
#include "lightsicons.h"
#include "telemetrydata.h"
#include "errorhandler.h"
#include <QQmlContext>
#include "autogen/environment.h"
#include <QThread>
#include <QDebug>
#include <QTimer>

int main(int argc, char *argv[])
{
    set_qt_environment();
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;


    // Declaring classes for CAN values
    FuelValues fuelBackend;
    LightsIcons lightsBackend;
    TelemetryData telemetryBackend;
    ErrorHandler errorBackend;


    // Bridge values form C++ to Qt/QML
    engine.rootContext()->setContextProperty("fuelBackend", &fuelBackend);
    engine.rootContext()->setContextProperty("lightsBackend", &lightsBackend);
    engine.rootContext()->setContextProperty("telemetryBackend", &telemetryBackend);
    engine.rootContext()->setContextProperty("errorBackend", &errorBackend);

    const QUrl url(mainQmlFile);
    QObject::connect(
                &engine, &QQmlApplicationEngine::objectCreated, &app,
                [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.addImportPath(QCoreApplication::applicationDirPath() + "/qml");
    engine.addImportPath(":/");
    engine.load(url);

    if (engine.rootObjects().isEmpty())
        return -1;

    // TEST IMTPUT TIMER START BLOCK

    QTimer* timer = new QTimer;
    int fakeValue = 1200;
    int turnCounter = 0;
    int errorCounter = 0;
    int markCounter = 0;
    uint16_t rpm = 0;
    uint16_t speed = 0;

    QObject::connect(timer, &QTimer::timeout, [&]() {
        fakeValue = fakeValue - 10;



        // Turn and lights sumulator

        turnCounter++;
            if (turnCounter < 50) {
                lightsBackend.updateTurnRight(false);
                lightsBackend.updateTurnLeft(false);
                lightsBackend.updateDrlState(true);
                lightsBackend.updateBeamMode(0);
            }

            else if (turnCounter >= 50 && turnCounter < 100) {
                lightsBackend.updateTurnLeft(true);
                lightsBackend.updateDrlState(false);
                lightsBackend.updateBeamMode(1);
            }

            else if (turnCounter >= 100 && turnCounter < 150) {
                lightsBackend.updateTurnLeft(false);
                lightsBackend.updateTurnRight(true);
                lightsBackend.updateBeamMode(2);
            }

            else {
                turnCounter = 0;
            }

            // qDebug() << "Turn counter: " << turnCounter << " flag:" << lightsBackend.turnLeft();


        // Fuel simulator

        if (fakeValue < 0) {
            fakeValue = 1200;
        }

        fuelBackend.updateFuelLevel(fakeValue);

        fuelBackend.updateFuelRange(fakeValue / 204.8 / 4 * 100);

        if (fakeValue < 800) {
            if (fuelBackend.lowLevel() != true) {
                    fuelBackend.updateLowLevel(true);
                }

        } else {
            if (fuelBackend.lowLevel() != false) {
                    fuelBackend.updateLowLevel(false);
                }

        }

        // Telemetry simulator
        telemetryBackend.updateRpmValue(rpm += 10);
        telemetryBackend.updateSpeedValue(speed++);

        // qDebug() << "Speed: " << telemetryBackend.speedValue();

        if (rpm >= 4096) { rpm = 0; }
        if (speed >= 280) { speed = 0; }

        errorCounter++;
        markCounter++;

        if (errorCounter == 50) {
            errorBackend.test(50);
        } else if (errorCounter == 100) {
            errorBackend.test(100);
        } else if (errorCounter == 150) {
            errorBackend.test(150);
        } else if (errorCounter == 200) {
            errorBackend.removeError(150);
        } else if (errorCounter == 250) {
            errorBackend.removeError(50);
            errorCounter = 0;
        }

    });

    timer->start(100);

    // TEST IMTPUT TIMER END BLOCK


    return app.exec();
}
