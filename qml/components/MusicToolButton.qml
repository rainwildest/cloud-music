import QtQuick
import QtQuick.Controls

ToolButton {
    property string iconSource: ""
    property string toolTip: ""

    property bool isCheckable: false
    property bool isChecked: false

    id: self

    icon.source: iconSource

    background: Rectangle {
        color: self.down || (isCheckable
                             && self.checked) ? "#eeeeee" : "#00000000"
    }

    checkable: isCheckable
    checked: isChecked

    ToolTip.text: toolTip
    ToolTip.visible: hovered
}
