import QtQuick
import QtQuick.Controls

Button {
    property string iconSource: ""
    property string toolTip: ""
    property int iconWidth: 32
    property int iconHeight: 32
    property bool isCheckable: false
    property bool isChecked: false

    id: self

    icon.source: iconSource
    icon.height: iconHeight
    icon.width: iconWidth

    background: Rectangle {
        color: self.down || (isCheckable
                             && self.checked) ? "#497563" : "#20e9f4ff"
        radius: 3
    }

    checkable: isCheckable
    checked: isChecked

    ToolTip.text: toolTip
    ToolTip.visible: hovered
}
