import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: loginPage
    title: "Вход"
    background: Rectangle {
        color: "#161616"
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

        ColumnLayout {
            Layout.fillWidth: true

            Text {
                text: "Логин"
                color: "white"
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            TextField {
                id: loginField
                placeholderText: ""
                Layout.fillWidth: true
                height: 40
                font.pixelSize: 14
                background: Rectangle {
                    color: "#FFF"
                    radius: 20
                    border.color: "#CCC"
                    border.width: 1
                }
            }
        }

        ColumnLayout {
            Layout.fillWidth: true

            Text {
                text: "Пароль"
                color: "white"
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            TextField {
                id: passwordField
                placeholderText: ""
                echoMode: TextInput.Password
                Layout.fillWidth: true
                height: 40
                font.pixelSize: 14
                background: Rectangle {
                    color: "#FFF"
                    radius: 20
                    border.color: "#CCC"
                    border.width: 1
                }
            }
        }

        Button {
            text: "Войти"
            Layout.fillWidth: true
            height: 40
            font.pixelSize: 16
            background: Rectangle {
                color: "#F65E49"
                radius: 20
            }
            contentItem: Text {
                text: "Войти"
                color: "#FFF6E8"
                font.pixelSize: 16
                anchors.centerIn: parent
            }
            onClicked: {
                if (loginField.text !== "" && passwordField.text !== "") {
                    stackView.push("UserProfilePage.qml");  // Переход на UserProfilePage
                } else {
                    console.log("Введите логин и пароль");
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 20

            Button {
                text: "Забыл пароль"
                Layout.alignment: Qt.AlignLeft
                onClicked: stackView.push("ResetPasswordPage.qml")
            }

            Button {
                text: "Регистрация"
                Layout.alignment: Qt.AlignRight
                onClicked: stackView.push("RegisterPage.qml")
            }
        }
    }
}
