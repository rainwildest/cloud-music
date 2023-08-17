import QtQuick
import QtQuick.Window
//import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Fusion

Window {
    id: window

    property int m_WIN_WIDTH: 1200
    property int m_WIN_HEIGHT: 800

    width: m_WIN_WIDTH
    height: m_WIN_HEIGHT
    visible: true
    title: qsTr("Hello World")

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        LayoutHeaderView {
            id: layoutHeaderView
        }

        //        Rectangle {
        //            Layout.fillHeight: true
        //            Layout.preferredWidth: 200

        //            color: "#f0f0f0"
        //        }
        PageHomeView {
            id: pageHomeView

            Text {
                text: '8888888888'
            }
        }

        // 底部工具栏
        LayoutBottomView {
            id: layoutBottomView
        }
    }
}
