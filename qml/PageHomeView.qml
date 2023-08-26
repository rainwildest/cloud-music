import QtQuick
//import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Fusion

RowLayout {
    property var qmlList: [{
            "icon": "recommend-white",
            "value": "推荐内容",
            "qml": "DetailRecommendPageView"
        }, {
            "icon": "cloud-white",
            "value": "搜索音乐",
            "qml": "DetailSearchPageView"
        }, {
            "icon": "local-white",
            "value": "本地音乐",
            "qml": "DetailLocalPageView"
        }, {
            "icon": "history-white",
            "value": "播放历史",
            "qml": "DetailHistoryPageView"
        }, {
            "icon": "favorite-big-white",
            "value": "我喜欢的",
            "qml": "DetailFavoritePageView"
        }]

    Frame {
        Layout.preferredWidth: 200
        Layout.fillHeight: true
        padding: 0

        background: Rectangle {
            color: "#AA00AAAA"
        }

        ColumnLayout {
            anchors.fill: parent

            Item {
                Layout.preferredHeight: 150
                Layout.fillWidth: true

                MusicRoundedImage {
                    anchors.centerIn: parent
                    height: 100
                    width: 100
                }
            }

            ListView {
                id: menuView
                height: parent.height

                Layout.fillHeight: true
                Layout.fillWidth: true

                model: ListModel {
                    id: menuViewModel
                }
                delegate: menuViewDelegate

                highlight: Rectangle {
                    color: "#aa73a7ab"
                }
                highlightMoveDuration: 0
                highlightResizeDuration: 0
            }
        }

        Component {
            id: menuViewDelegate
            Rectangle {
                id: menuViewDelegateItem
                height: 50
                width: 200
                color: "#AA00AAAA"
                RowLayout {
                    anchors.fill: parent
                    anchors.centerIn: parent
                    spacing: 15

                    Item {
                        width: 30
                    }

                    Image {
                        source: "qrc:/images/" + icon
                        Layout.preferredHeight: 20
                        Layout.preferredWidth: 20
                    }

                    Text {
                        text: value
                        Layout.fillWidth: true
                        height: 50
                        font.pointSize: 12
                        color: "#ffffff"
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        color = "#aa73a7ab"
                    }
                    onExited: {
                        color = "#AA00AAAA"
                    }
                    onClicked: {
                        let currentIndex = menuViewDelegateItem.ListView.view.currentIndex
                        repeater.itemAt(currentIndex).visible = false

                        menuViewDelegateItem.ListView.view.currentIndex = index

                        const loader = repeater.itemAt(index)
                        loader.visible = true
                        loader.source = `${qmlList[index].qml}.qml`
                    }
                }
            }
        }

        Component.onCompleted: {
            menuViewModel.append(qmlList)

            const loader = repeater.itemAt(0)
            loader.visible = true
            loader.source = `${qmlList[0].qml}.qml`

            console.log(`${qmlList[0].qml}.qml`)
        }

        //            Rectangle {
        //                anchors.fill: parent
        //                color: "blue"
        //            }
    }

    Repeater {
        id: repeater
        model: qmlList.length

        Loader {
            visible: false
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
