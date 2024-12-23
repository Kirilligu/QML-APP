import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    title: "Каталог"
    background: Rectangle {
        color: "#1C1C1C"
    }


    Drawer {
        id: menuDrawer
        width: parent.width * 0.75
        height: parent.height
        background: Rectangle {
            color: "#1C1C1C"
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
        background: Rectangle {
            color: "#1C1C1C"
        }

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

    ListView {
        width: parent.width
        height: parent.height
        model: ListModel {
            ListElement { name: "Nike Air Max"; price: "7999 руб."; sizes: "40, 41, 42, 43, 44"; image: "image/nike.jpg" }
            ListElement { name: "Adidas UltraBoost"; price: "9999 руб."; sizes: "40, 41, 42, 43, 44"; image: "image/adidas.jpg" }
            ListElement { name: "Puma RS-X"; price: "6999 руб."; sizes: "40, 41, 42, 43, 44"; image: "image/puma.jpg" }
            ListElement { name: "Reebok Classic"; price: "7499 руб."; sizes: "39, 40, 41, 42, 43"; image: "image/reebok.jpg" }
            ListElement { name: "New Balance 574"; price: "8999 руб."; sizes: "40, 41, 42, 43, 44"; image: "image/newb.jpeg" }
            ListElement { name: "Converse All Star"; price: "4999 руб."; sizes: "37, 38, 39, 40, 41"; image: "image/converce.jpg" }
            ListElement { name: "Vans Old Skool"; price: "6599 руб."; sizes: "38, 39, 40, 41, 42"; image: "image/vans.jpg" }
        }

        delegate: Rectangle {
            width: parent.width
            height: 170
            color: "#333333"
            radius: 10
            anchors.margins: 10

            RowLayout {
                anchors.fill: parent
                spacing: 10
                anchors.margins: 10

                Rectangle {
                    width: 100
                    height: 100
                    radius: 10
                    color: "#FFFFFF"

                    Image {
                        anchors.fill: parent
                        source: model.image
                        fillMode: Image.PreserveAspectFit
                    }
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
