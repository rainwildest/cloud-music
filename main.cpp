#include <QDebug>
#include <QGuiApplication>
#include <QIcon>
#include <QQmlApplicationEngine>

#include "httputils.h"
#include "myimageproviter.h"

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<HttpUtils>("MyUtils", 1, 0, "HttpUtils");

    // qDebug() << QIcon(":/images/music.ico").isNull();

    app.setWindowIcon(QIcon(":/images/music.ico"));

    QQmlApplicationEngine engine;
    const QUrl            url(u"qrc:/cloud-music/qml/App.qml"_qs);

    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated, &app,
        [url](QObject* obj, const QUrl& objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine.addImageProvider("clip", new MyImageProviter());
    engine.load(url);

    return app.exec();
}
