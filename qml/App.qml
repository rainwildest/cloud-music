import QtQuick
import QtQuick.Window
//import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Fusion

import MyUtils

import "./components"

Window {
    id: window

    property int m_WIN_WIDTH: 1200
    property int m_WIN_HEIGHT: 800

    width: m_WIN_WIDTH
    height: m_WIN_HEIGHT
    visible: true
    title: qsTr("Hello World")

    HttpUtils {
        id: http
    }

    Component.onCompleted: {

        //        textHttp()
    }

    function textHttp() {
        function onHandle(e) {
            console.log("jj: ", e)
            http.onSuccess.disconnect(onHandle)
        }

        http.onSuccess.connect(onHandle)

        const form = {
            "2": 1,
            "rr": ["1", "2"],
            "ss": {
                "2": 9
            },
            "hasdd": true,
            "files": {
                "field": "avatar",
                "src": ["/Users/knight/Downloads/1.png", "/Users/knight/Downloads/雪中女孩.jpg"]
            }
        }
        //upload
        http.post("upload", form)
    }

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
        }

        // 底部工具栏
        LayoutBottomView {
            id: layoutBottomView
        }
    }
}
