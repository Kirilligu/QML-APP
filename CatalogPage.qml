import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    title: "Каталог"
    background: Rectangle {
        color: "#1C1C1C"
    }

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
                    stackView.push(cartPage); // Переход в каталог
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

    // Список товаров
    ListView {
        width: parent.width
        height: parent.height
        model: ListModel {
            ListElement { name: "Nike Air Max"; price: "7999 руб."; sizes: "40, 41, 42, 43, 44"; image: "//image/web120.png" }
            ListElement { name: "Adidas UltraBoost"; price: "9999 руб."; sizes: "40, 41, 42, 43, 44"; image: "qrc:/images/sneaker2.jpg" }
            ListElement { name: "Puma RS-X"; price: "6999 руб."; sizes: "40, 41, 42, 43, 44"; image: "qrc:/images/sneaker3.jpg" }
            ListElement { name: "Reebok Classic"; price: "7499 руб."; sizes: "39, 40, 41, 42, 43"; image: "qrc:/images/sneaker4.jpg" }
            ListElement { name: "New Balance 574"; price: "8999 руб."; sizes: "40, 41, 42, 43, 44"; image: "qrc:/images/sneaker5.jpg" }
            ListElement { name: "Converse All Star"; price: "4999 руб."; sizes: "37, 38, 39, 40, 41"; image: "qrc:/images/sneaker6.jpg" }
            ListElement { name: "Vans Old Skool"; price: "6599 руб."; sizes: "38, 39, 40, 41, 42"; image: "qrc:/images/sneaker7.jpg" }
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
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    // Переход на страницу карточки товара
                                    stackView.push(cardPage, {product: model});
                                }
                            }
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
                            text: "Добавить в корзину"
                            background: Rectangle {
                                color: "#F65E49"
                                radius: 10
                            }
                            font.pixelSize: 16
                            Layout.fillWidth: true
                            onClicked: {
                                console.log(model.name + " добавлены в корзину");
                            }
                        }
                    }
                }
            }
        }
    }
}
