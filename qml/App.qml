import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    ToolBar {
//        Layout.fillWidth: true
        width: parent.width

        RowLayout {
//            Layout.fillWidth: true
            anchors.fill: parent

            ToolButton {
                icon.source: "qrc:/images/music.png"
                width: 32
                height: 32
            }
            ToolButton {
                icon.source: "qrc:/images/about"
                width: 32
                height: 32
            }

            Rectangle {
                Layout.fillWidth: true

            }

            ToolButton {
                icon.source: "qrc:/images/power"
                width: 32
                height: 32
            }
        }
    }
}
