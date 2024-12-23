import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    title: "Восстановление пароля"
    background: Rectangle {
        color: "#1C1C1C"
    }

    header: Frame {
        width: parent.width
        height: 60
        Row {
            anchors.centerIn: parent
            spacing: 5

            Text {
                text: "Step"
                font.family: "Pakenham"
                font.pixelSize: 24
                color: "#F65E49"
            }

            Text {
                text: "Calc"
                font.family: "Pakenham"
                font.pixelSize: 24
                color: "#FFF6E8"
            }
        }
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        TextField {
            placeholderText: "Введите email"
            Layout.fillWidth: true
        }

        Button {
            text: "Сбросить пароль"
            Layout.fillWidth: true
            onClicked: {
                console.log("Сброс пароля отправлен");
                stackView.pop();
            }
        }
    }
}
