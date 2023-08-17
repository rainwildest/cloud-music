import QtQuick
//import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Fusion
import QtQuick.Window

ToolBar {
    Layout.fillWidth: true

    //            width: parent.width
    background: Rectangle {
        color: '#00AAAA'
    }

    RowLayout {
        //            Layout.fillWidth: true
        anchors.fill: parent

        MusicToolButton {
            iconSource: "qrc:/images/music.png"
            width: 32
            height: 32
            toolTip: "关于"
            onClicked: {
                aboutPopup.open()
            }
        }
        MusicToolButton {
            iconSource: "qrc:/images/about"

            width: 32
            height: 32
            toolTip: "关于"
            onClicked: {
                Qt.openUrlExternally("https://www.baidu.com")
            }
        }
        MusicToolButton {
            id: smallWindow
            iconSource: "qrc:/images/small-screen"
            width: 32
            height: 32
            toolTip: "小窗播放"
            onClicked: {
                setWindowSize(330, 650)

                normalWindow.visible = true
                smallWindow.visible = false
            }
        }

        MusicToolButton {
            id: normalWindow
            iconSource: "qrc:/images/exit-small-window"
            width: 32
            height: 32
            toolTip: "退出小窗播放"
            visible: false
            onClicked: {
                setWindowSize()

                normalWindow.visible = false
                smallWindow.visible = true
            }
        }

        Item {
            Layout.fillWidth: true
            Text {
                anchors.centerIn: parent
                text: qsTr("续加仪")
                font.pointSize: 15
            }
        }

        MusicToolButton {
            iconSource: "qrc:/images/minimize-screen"
            width: 32
            height: 32
            toolTip: "最小化"
            onClicked: {
                window.hide()
            }
        }

        MusicToolButton {
            id: resize

            iconSource: "qrc:/images/small-screen"
            width: 32
            height: 32
            toolTip: "退出全屏"
            onClicked: {
                // setWindowSize()
                window.visibility = Window.AutomaticVisibility

                maxWindow.visible = true
                resize.visible = false
            }
        }

        MusicToolButton {
            id: maxWindow

            iconSource: "qrc:/images/full-screen"
            width: 32
            height: 32
            toolTip: "全屏"
            onClicked: {
                window.visibility = Window.Maximized

                maxWindow.visible = false
                resize.visible = true
            }
        }

        MusicToolButton {
            icon.source: "qrc:/images/power"
            width: 32
            height: 32
            toolTip: "退出"
            onClicked: {
                Qt.quit()
            }
        }
    }

    Popup {
        id: aboutPopup

        parent: Overlay.overlay
        modal: true

        x: (parent.width - width) / 2
        y: (parent.height - height) / 2

        width: 250
        height: 230

        background: Rectangle {
            color: "#e9f4ff"
            radius: 5
        }

        contentItem: ColumnLayout {
            width: parent.width
            height: parent.height

            Layout.alignment: Qt.AlignHCenter

            Image {
                Layout.preferredHeight: 60
                Layout.fillWidth: true
                source: "qrc:/images/music"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                text: qsTr("测试")
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 18
                color: "#8573a7ab"
            }

            Text {
                text: qsTr("这是我的 Clound Music Player")
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 18
                color: "#8573a7ab"
            }

            Text {
                text: qsTr("这是我的 Clound Music Player")
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 18
                color: "#8573a7ab"
            }
        }
    }

    function setWindowSize(width = window.m_WIN_WIDTH, height = window.m_WIN_HEIGHT) {
        window.height = height
        window.width = width

        //        window.x = (Screen.desktopAvailableWidth - window.width) / 2
        //        window.y = (Screen.desktopAvailableHeight - window.height) / 2
    }
}
