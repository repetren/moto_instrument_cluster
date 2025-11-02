// Copyright (C) 2024 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
// #include <QThread>
#include <QDebug>
#include <QTimer>
#include <QtSerialBus/QCanBus>
#include <QtSerialBus/QCanBusDevice>
#include <QtSerialBus/QCanBusFrame>

#include "autogen/environment.h"
#include "bridgeregistry.h"
#include "can_id_utils.h"
#include "notificationhandler.h"

int main(int argc, char *argv[])
{
    set_qt_environment();
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Bridge responsible for creating classes for values backend and passing it to QML
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

    QString errorString;
    QCanBusDevice *device = QCanBus::instance()->createDevice(
        QStringLiteral("socketcan"), QStringLiteral("can1"), &errorString);

    if (!device) {
        qDebug() << errorString;
    } else {
        device->connectDevice();
    }

    QObject::connect(device, &QCanBusDevice::framesReceived, [device, &bridge, &notificationHandler]() {

        while (device->framesAvailable()) {
            const QCanBusFrame frame = device->readFrame();
            QByteArray data = frame.payload();

            switch (frame.frameId()) {
            case 0x100:
                can_id100_handler(bridge, data);
                break;

            case 0x110:
                can_id110_handler(bridge, data);
                break;

            case 0x120:
                can_id120_handler(bridge, data);
                break;

            case 0x121:
                can_id121_handler(bridge, data);
                break;

            case 0x130:
                can_id130_handler(notificationHandler, data);
                break;
            default:
                break;
            }
        }
    });

    return app.exec();
}
