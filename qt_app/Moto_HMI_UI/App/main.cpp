// Copyright (C) 2024 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QApplication>
#include <QQmlApplicationEngine>
#include "fuelvalues.h"
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
    engine.rootContext()->setContextProperty("fuelBackend", &fuelBackend);

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

    QObject::connect(timer, &QTimer::timeout, [&]() {
        fakeValue = fakeValue - 10;
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

    });

    timer->start(100);


    return app.exec();
}
