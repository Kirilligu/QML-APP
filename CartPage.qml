import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: cartPage

    // Выдвижное меню (Drawer)
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
                    stackView.push(catalogPage); // Переход в каталог
                }
            }

            Button {
                text: "Калькулятор размера"
                font.pixelSize: 18
                Layout.fillWidth: true
                onClicked: {
                    console.log("Перейти в калькулятор");
                    menuDrawer.close();
                    stackView.push(footSizeCalculatorPage); // Переход в калькулятор
                }
            }

            Button {
                text: "Корзина"
                font.pixelSize: 18
                Layout.fillWidth: true
                onClicked: {
                    console.log("Перейти в корзину");
                    menuDrawer.close();
                    stackView.push(cartPage); // Переход в корзину
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
                    stackView.push(loginPage); // Возврат на страницу логина
                }
            }
        }
    }

    // Заголовок с кнопкой бургер-меню
    header: Frame {
        width: parent.width
        height: 60
        background: Rectangle {
            color: "#000000" // Черный цвет фона
        }

        ToolButton {
            id: burgerMenuButton
            text: "☰"
            font.pixelSize: 20
            anchors.top: parent.top
            anchors.left: parent.left
            onClicked: {
                if (menuDrawer.opened) {
                    menuDrawer.close(); // Закрыть меню, если оно открыто
                } else {
                    menuDrawer.open(); // Открыть меню, если оно закрыто
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

    background: Rectangle {
        color: "#000000"
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 20

        Text {
            text: "Корзина"
            font.pixelSize: 24
            color: "#FFF6E8"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        // Список товаров в корзине
        ListView {
            width: parent.width
            height: parent.height - 120
            model: ListModel {
                ListElement { name: "Nike Air Max"; price: "7999 руб."; sizes: "42"; image: "qrc:/images/sneaker1.jpg" }
            }

            delegate: Item {
                width: parent.width
                height: 180

                Rectangle {
                    width: parent.width
                    height: 150
                    color: "#333333"
                    radius: 10

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 10

                        Image {
                            source: model.image
                            width: 100
                            height: 100
                            fillMode: Image.PreserveAspectFit
                        }

                        ColumnLayout {
                            spacing: 10
                            Layout.fillWidth: true

                            Text {
                                text: model.name
                                color: "white"
                                font.pixelSize: 18
                                Layout.fillWidth: true
                            }

                            Text {
                                text: "Размеры: " + model.sizes
                                color: "white"
                                font.pixelSize: 16
                                Layout.fillWidth: true
                            }

                            Text {
                                text: "Цена: " + model.price
                                color: "white"
                                font.pixelSize: 16
                                Layout.fillWidth: true
                            }

                            Button {
                                text: "Удалить из корзины"
                                background: Rectangle {
                                    color: "#F65E49"
                                    radius: 10
                                }
                                font.pixelSize: 16
                                Layout.fillWidth: true
                                onClicked: {
                                    console.log(model.name + " удалены из корзины");
                                }
                            }
                        }
                    }
                }
            }
        }

        // Кнопка для оформления заказа
        Button {
            text: "Оформить заказ"
            background: Rectangle {
                color: "#F65E49"
                radius: 8
            }
            font.pixelSize: 16
            Layout.fillWidth: true
            onClicked: {
                console.log("Заказ оформлен");
            }
        }
    }
}
