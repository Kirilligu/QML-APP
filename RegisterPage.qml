import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    title: "Регистрация"
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
            placeholderText: "Введите логин"
            Layout.fillWidth: true
        }

        TextField {
            placeholderText: "Введите email"
            Layout.fillWidth: true
        }

        TextField {
            placeholderText: "Введите пароль"
            echoMode: TextInput.Password
            Layout.fillWidth: true
        }

        Button {
            text: "Зарегистрироваться"
            Layout.fillWidth: true
            onClicked: {
                console.log("Регистрация завершена");
                stackView.pop();
            }
        }
    }
}
