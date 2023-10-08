import QtQuick
import QtQuick.Controls.Fusion

import QtQuick.Layouts

import "../components"

ScrollView {
    clip: true // 裁剪
    ColumnLayout {
        spacing: 0

        Text {
            text: qsTr("内容推荐")
            font.pixelSize: 18
        }

        MusicBannerView {
            id: bannerview
            Layout.preferredWidth: (window.width - 200)
            Layout.preferredHeight: (window.width - 200) * 0.3

            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

    Component.onCompleted: {
        textHttp()
    }

    function textHttp() {
        function onHandle(e) {
            http.onSuccess.disconnect(onHandle)

            const value = JSON.parse(e)

            if (value.code === 2000) {
                const banners = value.data.banners.map(item => item.imageUrl)
                bannerview.bannerList = banners
            }
        }

        http.onSuccess.connect(onHandle)

        http.get("banner")
    }
}
