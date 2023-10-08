import QtQuick
import QtQuick.Controls

Frame {
    property int current: 0
    property var bannerList: []

    MusicRoundedImage {
        id: leftImage
        width: parent.width * 0.6
        height: parent.height * 0.8

        anchors {
            left: parent.left
            bottom: parent.bottom
            bottomMargin: 20
        }

        src: getLeftImageSrc()
        Rectangle {
            color: "red"
        }
    }

    MusicRoundedImage {
        id: centerImage
        width: parent.width * 0.6
        height: parent.height

        anchors.centerIn: parent
        z: 2

        src: getCenterImageSrc()
    }

    MusicRoundedImage {
        id: rightImage
        width: parent.width * 0.6
        height: parent.height * 0.8

        anchors {
            right: parent.right
            bottom: parent.bottom
            bottomMargin: 20
        }

        src: getRightImageSrc()
    }

    function getLeftImageSrc() {
        const length = bannerList.length
        const index = (current - 1 + (length || 0)) % length

        return length ? bannerList[index] : ""
    }

    function getCenterImageSrc() {
        return bannerList.length ? bannerList[current] : ""
    }

    function getRightImageSrc() {
        const length = bannerList.length
        const index = (current + 1 + (length || 0)) % length

        return length ? bannerList[current + 1] : ""
    }
}
