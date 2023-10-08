import QtQuick
import QtQuick.Controls.Fusion
import Qt5Compat.GraphicalEffects

Item {
    property string src: "qrc:/images/player"
    property int rounded: 10

    Image {
        id: image
        anchors.fill: parent
        source: src
        smooth: true
        width: parent.width
        height: parent.height
        fillMode: Image.PreserveAspectCrop
        antialiasing: true

        layer.enabled: true
        layer.effect: OpacityMask {
            anchors.fill: image
            source: image
            maskSource: mask
            smooth: true
            antialiasing: true
        }
    }

    Rectangle {
        id: mask
        color: "black"
        anchors.fill: parent
        radius: rounded
        visible: false
        smooth: true
        antialiasing: true
    }
}
