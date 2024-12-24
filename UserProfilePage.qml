import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: userProfilePage

    background: Rectangle {
        color: "#1C1C1C"
    }


    Drawer {
        id: menuDrawer
        width: parent.width * 0.75
        height: parent.height
        background: Rectangle {
            color: "#333333"
        }

        ColumnLayout {
            spacing: 20

            Button {
                text: "Каталог"
                font.pixelSize: 18
                Layout.fillWidth: true
                onClicked: {
                    console.log("Перейти в каталог");
                    menuDrawer.close();
                    stackView.push(catalogPage);
                }
            }

            Button {
                text: "Калькулятор размера"
                font.pixelSize: 18
                Layout.fillWidth: true
                onClicked: {
                    console.log("Перейти в калькулятор");
                    menuDrawer.close();
                    stackView.push(footSizeCalculatorPage);
                }
            }


            Button {
                text: "Корзина"
                font.pixelSize: 18
                Layout.fillWidth: true
                onClicked: {
                    console.log("Перейти в корзину");
                    menuDrawer.close();
                    stackView.push(cartPage);
                }
            }

            Button {
                text: "Профиль"
                font.pixelSize: 18
                Layout.fillWidth: true
                onClicked: {
                    console.log("Переход в профиль");
                    menuDrawer.close(userProfilePage);
                }
            }

            Button {
                text: "Выход"
                font.pixelSize: 18
                Layout.fillWidth: true
                onClicked: {
                    console.log("Выход из аккаунта");
                    menuDrawer.close();
                    stackView.pop();
                }
            }
        }
    }

    header: Frame {
        width: parent.width
        height: 60

        ToolButton {
            id: burgerMenuButton
            text: "☰"
            font.pixelSize: 20
            anchors.top: parent.top
            anchors.left: parent.left
            onClicked: {
                if (menuDrawer.opened) {
                    menuDrawer.close();
                } else {
                    menuDrawer.open();
                }
            }
        }

        Row {
            anchors.centerIn: parent
            spacing: 8

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
        anchors.fill: parent
        spacing: 20
        anchors.margins: 16


        ColumnLayout {
            spacing: 8
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                width: 120
                height: 120
                radius: 60
                color: "#333333"
                anchors.horizontalCenter: parent.horizontalCenter

                Image {
                    source: "image/sasha.jpg"
                    anchors.fill: parent

                }
            }

            Text {
                text: "Александро"
                font.pixelSize: 20
                color: "#FFF6E8"
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                text: "20 лет"
                font.pixelSize: 16
                color: "#888888"
                horizontalAlignment: Text.AlignHCenter
            }
        }

        ColumnLayout {
            spacing: 10

            Text {
                text: "Личная информация:"
                font.pixelSize: 18
                color: "#FFF6E8"
            }

            RowLayout {
                spacing: 8

                Text {
                    text: "Имя:"
                    font.pixelSize: 16
                    color: "#FFF6E8"
                }

                Text {
                    text: "Александр "
                    font.pixelSize: 16
                    color: "#FFF6E8"
                }

            }

            Text {
                text: "Email: example@mail.ru"
                font.pixelSize: 16
                color: "#FFF6E8"
            }

            Text {
                text: "Телефон: 898091234567"
                font.pixelSize: 16
                color: "#FFF6E8"
            }

            Text {
                text: "Адрес доставки: ул. Лермонтова, д 126"
                font.pixelSize: 16
                color: "#FFF6E8"
            }
        }

        RowLayout {
            spacing: 8
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                text: "Мои размеры:"
                font.pixelSize: 18
                color: "#FFF6E8"
            }


        }

        Text {
            text: "Размер обуви: 44"
            font.pixelSize: 16
            color: "#FFF6E8"
        }


        Button {
            text: "Выйти из аккаунта"
            font.pixelSize: 16
            background: Rectangle {
                color: "#F65E49"
                radius: 8
            }
            Layout.fillWidth: true
            onClicked: console.log("Выход из аккаунта")
        }
    }
}
