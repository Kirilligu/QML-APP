import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: footSizeCalculatorPage
    title: "Калькулятор размера"

    background: Rectangle {
        color: "#1C1C1C"
    }

    // Выдвижное меню
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
                    menuDrawer.close();
                    stackView.push(userProfilePage);
                }
            }

            Button {
                text: "Выход"
                font.pixelSize: 18
                Layout.fillWidth: true
                onClicked: {
                    console.log("Выход из аккаунта");
                    menuDrawer.close();
                    stackView.push(loginPage);
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

    ScrollView {
        anchors.fill: parent
        contentWidth: parent.width

        ColumnLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 12
            width: parent.width * 0.9

            // Заголовки
            Text {
                text: "Длина ступни (см)"
                font.pixelSize: 16
                color: "white"
            }

            RowLayout {
                spacing: 8
                TextField {
                    placeholderText: "..."
                    font.pixelSize: 14
                    width: parent.width * 0.7
                }

                Button {
                    text: "Как измерить?"
                    font.pixelSize: 12
                }
            }

            Text {
                text: "Ширина ступни (см)"
                font.pixelSize: 16
                color: "white"
            }

            RowLayout {
                spacing: 8
                TextField {
                    placeholderText: "..."
                    font.pixelSize: 14
                    width: parent.width * 0.7
                }

                Button {
                    text: "Как измерить?"
                    font.pixelSize: 12
                }
            }

            Text {
                text: "Степень полноты"
                font.pixelSize: 16
                color: "white"
            }

            RowLayout {
                spacing: 12
                Button {
                    text: "Узкая"
                    font.pixelSize: 14
                }
                Button {
                    text: "Средняя"
                    font.pixelSize: 14
                }
                Button {
                    text: "Широкая"
                    font.pixelSize: 14
                }
            }

            Text {
                text: "Проблемы со стопами (если есть)"
                font.pixelSize: 16
                color: "white"
            }

            ComboBox {
                model: ["...", "Плоскостопие", "Шишки", "Натирания"]
                width: parent.width
            }

            Text {
                text: "Выбор бренда"
                font.pixelSize: 16
                color: "white"
            }

            ComboBox {
                model: ["...", "Nike", "Adidas", "Puma"]
                width: parent.width
            }

            Text {
                text: "Страна"
                font.pixelSize: 16
                color: "white"
            }

            ComboBox {
                model: ["...", "Россия", "США", "Китай", "Италия"]
                width: parent.width
            }

            Text {
                text: "Пол"
                font.pixelSize: 16
                color: "white"
            }

            ComboBox {
                model: ["...", "Мужской", "Женский"]
                width: parent.width
            }


            Button {
                text: "Рассчитать размер"
                background: Rectangle {
                    color: "#F65E49"
                    radius: 8
                }
                font.pixelSize: 16
                width: parent.width
                onClicked: {
                    console.log("Расчет размера...");
                }
            }
        }
    }
}
