import QtQuick 2.9
import QtQuick.Controls 2.2
import uibackend 1.0

ApplicationWindow {
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

        onValChanged_2: {
            console.log(backend.val_2);
            tempValLabel.text = qsTr("Value: " + backend.val_2);
        }
        onLastValsChanged_2: {
            tempLastValLabel.text = qsTr("Last 5 Readings:\n" + backend.last_vals_2[0] + ", "
                                            + backend.last_vals_2[1] + ", "
                                            + backend.last_vals_2[2] + ", "
                                            + backend.last_vals_2[3] + ", "
                                            + backend.last_vals_2[4]);
        }
        onAverageChanged_2: {
            tempAvgLabel.text = qsTr("Average: " + backend.average_2);
        }

        onValChanged_3: {
            console.log(backend.val_3);
            tempValLabel.text = qsTr("Value: " + backend.val_3);
        }
        onLastValsChanged_3: {
            tempLastValLabel.text = qsTr("Last 5 Readings:\n" + backend.last_vals_3[0] + ", "
                                            + backend.last_vals_3[1] + ", "
                                            + backend.last_vals_3[2] + ", "
                                            + backend.last_vals_3[3] + ", "
                                            + backend.last_vals_3[4]);
        }
        onAverageChanged_3: {
            tempAvgLabel.text = qsTr("Average: " + backend.average_3);
        }

        onValChanged_4: {
            console.log(backend.val_4);
            tempValLabel.text = qsTr("Value: " + backend.val_4);
        }
        onLastValsChanged_4: {
            tempLastValLabel.text = qsTr("Last 5 Readings:\n" + backend.last_vals_4[0] + ", "
                                            + backend.last_vals_4[1] + ", "
                                            + backend.last_vals_4[2] + ", "
                                            + backend.last_vals_4[3] + ", "
                                            + backend.last_vals_4[4]);
        }
        onAverageChanged_4: {
            tempAvgLabel.text = qsTr("Average: " + backend.average_4);
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
}
