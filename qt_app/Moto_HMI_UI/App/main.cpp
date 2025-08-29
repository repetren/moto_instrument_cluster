// Copyright (C) 2024 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QApplication>
#include <QQmlApplicationEngine>
#include "notificationhandler.h"
#include "bridgeregistry.h"
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

    // Bridge respondible for creating classes for values backend
    BridgeRegistry bridge;
    bridge.registerAll(engine);

    NotificationHandler notificationHandler;
    engine.rootContext()->setContextProperty("notificationHandler", &notificationHandler);

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
                bridge.turnRight.setFlag(false);
                bridge.turnLeft.setFlag(false);
                bridge.drlState.setFlag(true);
                bridge.beamMode.setValue(0);
            }

            else if (turnCounter >= 50 && turnCounter < 100) {
                bridge.turnLeft.setFlag(true);
                bridge.drlState.setFlag(false);
                bridge.beamMode.setValue(1);
            }

            else if (turnCounter >= 100 && turnCounter < 150) {
                bridge.turnLeft.setFlag(false);
                bridge.turnRight.setFlag(true);
                bridge.beamMode.setValue(2);
            }

            else {
                turnCounter = 0;
            }

            // qDebug() << "Turn counter: " << turnCounter << " flag:" << lightsBackend.turnLeft();


        // Fuel simulator

        if (fakeValue < 0) {
            fakeValue = 1200;
        }

        bridge.litersPerKm.setValue(8);

        bridge.fuelLevel.setValue(fakeValue);

        bridge.fuelRange.setValue(fakeValue / 204.8 / 4 * 100);

        if (fakeValue < 800) {
            if (bridge.lowFuelLevel.flag() != true) {
                    bridge.lowFuelLevel.setFlag(true);
                }

        } else {
            if (bridge.lowFuelLevel.flag() != false) {
                    bridge.lowFuelLevel.setFlag(false);
                }

        }

        // Telemetry simulator
        bridge.rpmBackend.setValue(rpm += 10);
        bridge.speedBackend.setValue(speed++);
        bridge.odoBackend.setValue(24400);
        bridge.tripABackend.setValue(140);
        bridge.engineTemp.setValue(89);
        bridge.coolantTemp.setValue(85);

        if (rpm >= 4096) { rpm = 0; }
        if (speed >= 280) { speed = 0; }

        errorCounter++;
        markCounter++;

        if (errorCounter == 50) {
            bridge.gearBox.setValue(1);
            notificationHandler.newNotification(50);
        } else if (errorCounter == 100) {
            bridge.gearBox.setValue(2);
            notificationHandler.newNotification(100);
        } else if (errorCounter == 150) {
            bridge.gearBox.setValue(3);
            notificationHandler.newNotification(150);
        } else if (errorCounter == 200) {
            bridge.gearBox.setValue(4);
            notificationHandler.removeNotification(150);
        } else if (errorCounter == 250) {
            bridge.gearBox.setValue(5);
            notificationHandler.removeNotification(50);
            errorCounter = 0;
        }

    });

    timer->start(100);

    // TEST IMTPUT TIMER END BLOCK


    return app.exec();
}
