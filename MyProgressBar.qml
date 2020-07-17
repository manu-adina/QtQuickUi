import QtQuick 2.0

Item {
    id: container
    width: 50; height: 150

    property alias barHeight: fillrectangle.height

    Rectangle {
        id: rectangle
        color: "white"
        anchors.fill: parent
    }

    Rectangle {
        id: fillrectangle
        width: 50; height: 20
        border.color: "white"
        color: "black"
        anchors.bottom: container.bottom

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: PropertyAnimation { target: fillrectangle; property: "height"; to: 70; easing.type: "InOutQuad" }
        }
    }

    Text {
        id: topLabelMax
        anchors.top: container.top
        anchors.horizontalCenter: container.horizontalCenter
        color: "black"
        text: "100"
    }

    Text {
        id: botLabelMin
        anchors.top: container.bottom
        anchors.horizontalCenter: container.horizontalCenter
        color: "white"
        text: "0"
    }
}
