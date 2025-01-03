import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: productCardPage
    property var productData: ({})

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

    background: Rectangle {
        color: "#1C1C1C"
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 20

        Text {
            text: productData.name || "Nike Air Max"
            font.pixelSize: 24
            color: "#1C1C1C"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        Rectangle {
            width: parent.width * 0.8
            height: parent.width * 0.5
            color: "#333333"
            radius: 10
            border.color: "#F65E49"
            border.width: 2
            Layout.alignment: Qt.AlignHCenter

            Image {
                source: productData.image || "image/nike.jpg"
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                anchors.margins: -100
            }
        }

        Text {
            text: "Цена: " + (productData.price || "7999") + " руб."
            font.pixelSize: 20
            color: "#1C1C1C"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        RowLayout {
            spacing: 10
            Layout.alignment: Qt.AlignHCenter

            Text {
                text: "   Цвет:  "
                font.pixelSize: 18
                color: "#FFF6E8"
            }

            ComboBox {
                model: productData.colors || ["Красный", "Синий", "Черный"]
                Layout.fillWidth: true
            }
        }

        RowLayout {
            spacing: 10
            Layout.alignment: Qt.AlignHCenter

            Text {
                text: " Размер:"
                font.pixelSize: 18
                color: "#FFF6E8"
            }

            ComboBox {
                model: productData.sizes || ["39", "40", "41", "42", "43"]
                Layout.fillWidth: true
            }
        }

        Button {
            text: "Добавить в корзину"
            background: Rectangle {
                color: "#F65E49"
                radius: 8
            }
            font.pixelSize: 16
            Layout.fillWidth: true
            onClicked: {
                console.log("Добавлено в корзину:", productData.name || "Товар");
            }
        }
    }
}
