import QtQuick
import QtQuick.Controls.Fusion

import Qt5Compat.GraphicalEffects

Item {
    Text {
        text: qsTr("搜索音乐")
        font.pixelSize: 18
    }

    Rectangle {
        width: 100
        height: 100
        id: image

        anchors.centerIn: parent

        LinearGradient {
            width: parent.width + 50
            height: parent.height + 50

            anchors.centerIn: parent

            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: "#80222222"
                }
                GradientStop {
                    position: 0.4
                    color: "#FFFFFFFF"
                }
            }

            start: Qt.point(0, 0)
            end: Qt.point(0, 180)

            RotationAnimation on rotation {
                to: 360
                duration: 1000
                loops: Animation.Infinite
            }
        }

        layer.enabled: true
        layer.effect: OpacityMask {
            anchors.fill: image
            source: image
            maskSource: mask
            smooth: true
            antialiasing: true
        }

        //        clip: true
        Rectangle {
            id: content
            anchors.centerIn: parent
            width: parent.width - 6
            height: parent.height - 6
            radius: 10

            color: "white"

            //            color: "red"
            Text {
                text: 'kk'
            }

            layer.enabled: true
            layer.effect: DropShadow {
                //                radius: 10
                samples: 25
                color: "white"
            }
        }

        //        DropShadow {
        //            anchors.fill: content
        //            radius: 10
        //            samples: 16
        //            color: "white"
        //            source: content
        //        }
        Rectangle {
            id: mask
            color: "black"
            anchors.fill: parent
            radius: 10
            visible: false
            smooth: true
            antialiasing: true
        }
    }
}
