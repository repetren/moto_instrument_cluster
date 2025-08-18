// Copyright (C) 2024 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QApplication>
#include <QQmlApplicationEngine>
#include "fuelvalues.h"
#include "lightsicons.h"
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

    FuelValues fuelBackend;
    LightsIcons lightsBackend;

    engine.rootContext()->setContextProperty("fuelBackend", &fuelBackend);
    engine.rootContext()->setContextProperty("lightsBackend", &lightsBackend);

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

    // Test input timer

    QTimer* timer = new QTimer;
    int fakeValue = 1200;
    int turnCounter = 0;

    QObject::connect(timer, &QTimer::timeout, [&]() {
        fakeValue = fakeValue - 10;
        if (fakeValue < 0) {
            fakeValue = 1200;
        }

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

    });

    timer->start(100);


    return app.exec();
}
