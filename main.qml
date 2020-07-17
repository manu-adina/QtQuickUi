import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window 2.2
import uibackend 1.0

ApplicationWindow {
    id: applicationWindow
    visibility: Window.FullScreen
    visible: true
    width: 800
    height: 480
    color: "#242424"
    title: qsTr("Scroll")

    UiBackEnd {
      id: backend
    }

    Connections {
        target: backend
        onValChanged_1: {
            console.log(backend.val_1);
            tempValLabel.text = qsTr("Value: " + backend.val_1);
            tempProgBar.barHeight = (backend.val_1 / 100) * 150;
        }
        onLastValsChanged_1: {
            tempLastValLabel.text = qsTr("Last 5 Readings:\n" + backend.last_vals_1[0] + ", "
                                            + backend.last_vals_1[1] + ", "
                                            + backend.last_vals_1[2] + ", "
                                            + backend.last_vals_1[3] + ", "
                                            + backend.last_vals_1[4]);
        }
        onAverageChanged_1: {
            tempAvgLabel.text = qsTr("Average: " + backend.average_1);
        }
        onMaxChanged_1: {
            tempMaxLabel.text = qsTr("Max Value (Last 24 Hrs): " + backend.max_1)
        }
        onMinChanged_1: {
            tempMinLabel.text = qsTr("Min Value (Last 24 Hrs): " + backend.min_1)
        }

        onValChanged_2: {
            console.log(backend.val_2);
            presValLabel.text = qsTr("Value: " + backend.val_2);
            presProgBar.barHeight = (backend.val_2 / 100) * 150;
        }
        onLastValsChanged_2: {
            presLastValLabel.text = qsTr("Last 5 Readings:\n" + backend.last_vals_2[0] + ", "
                                            + backend.last_vals_2[1] + ", "
                                            + backend.last_vals_2[2] + ", "
                                            + backend.last_vals_2[3] + ", "
                                            + backend.last_vals_2[4]);
        }
        onAverageChanged_2: {
            presAvgLabel.text = qsTr("Average: " + backend.average_2);
        }
        onMaxChanged_2: {
            presMaxLabel.text = qsTr("Max Value (Last 24 Hrs): " + backend.max_2);
        }
        onMinChanged_2: {
            presMinLabel.text = qsTr("Min Value (Last 24 Hrs): " + backend.min_2);
        }

        onValChanged_3: {
            console.log(backend.val_3);
            speedValLabel.text = qsTr("Value: " + backend.val_3);
            speedProgBar.barHeight = (backend.val_3 / 100) * 150;
        }
        onLastValsChanged_3: {
            speedLastValLabel.text = qsTr("Last 5 Readings:\n" + backend.last_vals_3[0] + ", "
                                            + backend.last_vals_3[1] + ", "
                                            + backend.last_vals_3[2] + ", "
                                            + backend.last_vals_3[3] + ", "
                                            + backend.last_vals_3[4]);
        }
        onAverageChanged_3: {
            speedAvgLabel.text = qsTr("Average: " + backend.average_3);
        }
        onMaxChanged_3: {
            speedMaxLabel.text = qsTr("Max Value (Last 24 Hrs): " + backend.max_3);
        }
        onMinChanged_3: {
            speedMinLabel.text = qsTr("Min Value (Last 24 Hrs): " + backend.min_3);
        }

        onValChanged_4: {
            console.log(backend.val_4);
            flowValLabel.text = qsTr("Value: " + backend.val_4);
            flowProgBar.barHeight = (backend.val_4 / 100) * 150;
        }
        onLastValsChanged_4: {
            flowLastValLabel.text = qsTr("Last 5 Readings:\n" + backend.last_vals_4[0] + ", "
                                            + backend.last_vals_4[1] + ", "
                                            + backend.last_vals_4[2] + ", "
                                            + backend.last_vals_4[3] + ", "
                                            + backend.last_vals_4[4]);
        }
        onAverageChanged_4: {
            flowAvgLabel.text = qsTr("Average: " + backend.average_4);
        }
        onMaxChanged_4: {
            flowMaxLabel.text = qsTr("Max Value (Last 24 Hrs): " + backend.max_4);
        }
        onMinChanged_4: {
            flowMinLabel.text = qsTr("Min Value (Last 24 Hrs): " + backend.min_4);
        }

    }

    Text {
        id: tempLabel
        x: 14
        y: 0
        width: 385
        height: 52
        color: "#ea2727"
        text: qsTr("Temperature ")
        styleColor: "#e00000"
        font.weight: Font.Medium
        style: Text.Outline
        font.wordSpacing: -0.3
        font.bold: true
        lineHeight: 1.1
        font.pixelSize: 36
    }

    Text {
        id: presLabel
        x: 400
        y: 0
        width: 400
        height: 52
        color: "#f4f41d"
        text: "Pressure"
        font.weight: Font.Medium
        font.bold: true
        styleColor: "#f6ce09"
        font.pixelSize: 36
        lineHeight: 1.1
        font.wordSpacing: -0.3
        style: Text.Outline
    }

    Text {
        id: speedLabel
        x: 14
        y: 240
        width: 385
        height: 53
        color: "#1ad010"
        text: qsTr("Speed")
        font.weight: Font.Medium
        font.bold: true
        styleColor: "#2ad120"
        font.pixelSize: 36
        lineHeight: 1.1
        font.wordSpacing: -0.3
        style: Text.Outline
    }

    Text {
        id: flowLabel
        x: 400
        y: 240
        width: 400
        height: 53
        color: "#27a9cf"
        text: qsTr("Flow")
        font.weight: Font.Medium
        font.bold: true
        styleColor: "#2ea7e3"
        font.pixelSize: 36
        lineHeight: 1.1
        font.wordSpacing: -0.3
        style: Text.Outline
    }

    Text {
        id: tempValLabel
        x: 14
        y: 58
        width: 104
        height: 25
        color: "#ffffff"
        text: qsTr("Value: " + backend.val_1)
        font.bold: true
        font.pixelSize: 16
    }

    Text {
        id: tempAvgLabel
        x: 14
        y: 89
        width: 104
        height: 25
        color: "#ffffff"
        text: qsTr("Average: " + backend.average_1)
        font.bold: true
        font.pixelSize: 16
    }

    Text {
        id: tempLastValLabel
        x: 14
        y: 120
        width: 135
        height: 25
        color: "#ffffff"
        text: qsTr("Last 5 Readings:\n" + backend.last_vals_1[0] + ", "
                                        + backend.last_vals_1[1] + ", "
                                        + backend.last_vals_1[2] + ", "
                                        + backend.last_vals_1[3] + ", "
                                        + backend.last_vals_1[4])
        font.bold: true
        font.pixelSize: 16
    }

    Text {
        id: presValLabel
        x: 400
        y: 58
        width: 104
        height: 25
        color: "#ffffff"
        text: qsTr("Value: " + backend.val_2)
        font.bold: true
        font.pixelSize: 16
    }

    Text {
        id: presAvgLabel
        x: 400
        y: 89
        width: 104
        height: 25
        color: "#ffffff"
        text: qsTr("Average: " + backend.average_2)
        font.bold: true
        font.pixelSize: 16
    }

    Text {
        id: presLastValLabel
        x: 400
        y: 120
        width: 135
        height: 25
        color: "#ffffff"
        text: qsTr("Last 5 Readings:\n" + backend.last_vals_2[0] + ", "
                                        + backend.last_vals_2[1] + ", "
                                        + backend.last_vals_2[2] + ", "
                                        + backend.last_vals_2[3] + ", "
                                        + backend.last_vals_2[4])
        font.bold: true
        font.pixelSize: 16
    }

    Text {
        id: speedValLabel
        x: 14
        y: 299
        width: 104
        height: 25
        color: "#ffffff"
        text: qsTr("Value: " + backend.val_3)
        font.bold: true
        font.pixelSize: 16
    }

    Text {
        id: speedAvgLabel
        x: 14
        y: 330
        width: 104
        height: 25
        color: "#ffffff"
        text: qsTr("Average: " + backend.average_3)
        font.bold: true
        font.pixelSize: 16
    }

    Text {
        id: speedLastValLabel
        x: 14
        y: 361
        width: 135
        height: 25
        color: "#ffffff"
        text: qsTr("Last 5 Readings:\n" + backend.last_vals_3[0] + ", "
                                        + backend.last_vals_3[1] + ", "
                                        + backend.last_vals_3[2] + ", "
                                        + backend.last_vals_3[3] + ", "
                                        + backend.last_vals_3[4])
        font.bold: true
        font.pixelSize: 16
    }

    Text {
        id: flowValLabel
        x: 400
        y: 299
        width: 104
        height: 25
        color: "#ffffff"
        text: qsTr("Value: " + backend.val_4)
        font.bold: true
        font.pixelSize: 16
    }

    Text {
        id: flowAvgLabel
        x: 400
        y: 330
        width: 104
        height: 25
        color: "#ffffff"
        text: qsTr("Average: " + backend.average_4)
        font.bold: true
        font.pixelSize: 16
    }

    Text {
        id: flowLastValLabel
        x: 400
        y: 361
        width: 135
        height: 25
        color: "#ffffff"
        text: qsTr("Last 5 Readings:\n" + backend.last_vals_4[0] + ", "
                                        + backend.last_vals_4[1] + ", "
                                        + backend.last_vals_4[2] + ", "
                                        + backend.last_vals_4[3] + ", "
                                        + backend.last_vals_4[4])
        font.bold: true
        font.pixelSize: 16
    }

    MyProgressBar {
        id: tempProgBar
        x: 269
        y: 58

        Component.onCompleted: PropertyAnimation { target: tempProgBar; property: "barHeight"; to: (backend.val_1 / 100) * 150; easing.type: "InOutQuad"}
    }

    MyProgressBar {
        id: presProgBar
        x: 669
        y: 58

        Component.onCompleted: PropertyAnimation { target: presProgBar; property: "barHeight"; to: (backend.val_2 / 100) * 150; easing.type: "InOutQuad"}
    }

    MyProgressBar {
        id: speedProgBar
        x: 269
        y: 299

        Component.onCompleted: PropertyAnimation { target: speedProgBar; property: "barHeight"; to: (backend.val_3 / 100) * 150; easing.type: "InOutQuad"}
    }

    MyProgressBar {
        id: flowProgBar
        x: 669
        y: 299

        Component.onCompleted: PropertyAnimation { target: flowProgBar; property: "barHeight"; to: (backend.val_4 / 100) * 150; easing.type: "InOutQuad"}
    }

    Text {
        id: tempMaxLabel
        x: 14
        y: 178
        width: 249
        height: 25
        color: "#ffffff"
        text: qsTr("Max Value (Last 24 Hrs): " + backend.max_1)
        font.bold: true
        font.pixelSize: 16
    }

    Text {
        id: tempMinLabel
        x: 14
        y: 209
        width: 249
        height: 25
        color: "#ffffff"
        text: qsTr("Min Value (Last 24 Hrs): " + backend.min_1)
        font.pixelSize: 16
        font.bold: true
    }

    Text {
        id: presMaxLabel
        x: 400
        y: 178
        width: 249
        height: 25
        color: "#ffffff"
        text: qsTr("Max Value (Last 24 Hrs): " + backend.max_2)
        font.pixelSize: 16
        font.bold: true
    }

    Text {
        id: presMinLabel
        x: 400
        y: 209
        width: 249
        height: 25
        color: "#ffffff"
        text: qsTr("Min Value (Last 24 Hrs): " + backend.min_2)
        font.pixelSize: 16
        font.bold: true
    }

    Text {
        id: speedMaxLabel
        x: 14
        y: 415
        width: 249
        height: 25
        color: "#ffffff"
        text: qsTr("Max Value (Last 24 Hrs): " + backend.max_3)
        font.pixelSize: 16
        font.bold: true
    }

    Text {
        id: speedMinLabel
        x: 14
        y: 446
        width: 249
        height: 25
        color: "#ffffff"
        text: qsTr("Min Value (Last 24 Hrs): " + backend.min_3)
        font.pixelSize: 16
        font.bold: true
    }

    Text {
        id: flowMaxLabel
        x: 400
        y: 415
        width: 263
        height: 25
        color: "#ffffff"
        text: qsTr("Max Value (Last 24 Hrs): " + backend.max_4)
        font.pixelSize: 16
        font.bold: true
    }

    Text {
        id: flowMinLabel
        x: 400
        y: 446
        width: 263
        height: 25
        color: "#ffffff"
        text: qsTr("Min Value (Last 24 Hrs): " + backend.min_4)
        font.pixelSize: 16
        font.bold: true
    }
}
