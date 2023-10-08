import QtQuick
//import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Fusion

Rectangle {
    Layout.fillWidth: true
    height: 60
    color: "#00AAAA"

    Component.onCompleted: {
        console.log("加载成功")
    }

    RowLayout {
        anchors.fill: parent
        Item {
            Layout.preferredWidth: parent.width / 10
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        MusicIconButton {

            iconWidth: 32
            iconHeight: 32

            iconSource: "qrc:/images/previous"
        }

        MusicIconButton {

            iconWidth: 32
            iconHeight: 32

            iconSource: "qrc:/images/stop"
        }

        MusicIconButton {

            iconWidth: 32
            iconHeight: 32

            iconSource: "qrc:/images/next.png"
        }

        Item {
            Layout.preferredWidth: parent.width / 2
            Layout.fillHeight: true
            Layout.fillWidth: true

            // Layout.leftMargin: 20
            Layout.topMargin: 25

            Text {
                id: nameText
                text: "小可爱"

                anchors.left: slider.left
                anchors.bottom: slider.top
                anchors.bottomMargin: 2
                color: "#ffffff"
            }

            Text {
                id: timeText
                text: "00:00/05:30"

                anchors.right: slider.right
                anchors.bottom: slider.top
                anchors.bottomMargin: 2
                color: "#ffffff"
            }

            Slider {
                id: slider
                width: parent.width
                height: 25

                anchors.leftMargin: 10
                Layout.fillWidth: true

                background: Rectangle {
                    x: slider.leftPadding
                    y: slider.topPadding + (slider.availableHeight - height) / 2
                    width: slider.availableWidth
                    height: 4
                    radius: 2
                    color: "#e9f4ff"
                    Rectangle {
                        width: slider.visualPosition * parent.width
                        height: parent.height
                        color: "red"
                        radius: 2
                    }
                }

                handle: Rectangle {
                    x: slider.leftPadding + (slider.availableWidth - width) * slider.visualPosition
                    y: slider.topPadding + (slider.availableHeight - height) / 2
                    width: 15
                    height: 15
                    radius: 5
                    color: "#f0f0f0"
                    border.color: "#73a7ab"
                    border.width: 0.5
                }
            }
        }

        MusicIconButton {
            iconWidth: 32
            iconHeight: 32

            iconSource: "qrc:/images/favorite.png"
        }

        MusicIconButton {
            iconWidth: 32
            iconHeight: 32

            iconSource: "qrc:/images/repeat.png"
        }

        Item {
            Layout.preferredWidth: parent.width / 10
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
