#include <QDebug>
#include <QGuiApplication>
#include <QIcon>
#include <QQmlApplicationEngine>

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);

    qDebug() << QIcon(":/images/music.ico").isNull();

    app.setWindowIcon(QIcon(":/images/music.ico"));

    QQmlApplicationEngine engine;
    const QUrl            url(u"qrc:/cloud-music/qml/App.qml"_qs);

    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject* obj, const QUrl& objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
