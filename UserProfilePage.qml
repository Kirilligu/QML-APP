import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: userProfilePage
    title: "Личный кабинет"
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
                    stackView.push(footSizeCalculatorPage); // Переход в каталог
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
                    stackView.pop(); // Возврат на страницу логина
                }
            }
        }
    }

    header: Frame {
        width: parent.width
        height: 60

        // Кнопка бургер-меню
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

            Image {
                source: "qrc:/images/avatar.png"
                width: 50
                height: 50
                clip: true // Чтобы сделать изображение круглым
            }
        }
    }

    property var userData: {}

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: "Никнейм: " + 'Обувной мастер'
            color: "white"
            font.pixelSize: 18
            Layout.fillWidth: true
        }

        Text {
            text: "Имя: " + 'Валодя'
            color: "white"
            font.pixelSize: 18
            Layout.fillWidth: true
        }

        Text {
            text: "Возраст: " + '27'
            color: "white"
            font.pixelSize: 18
            Layout.fillWidth: true
        }

        Text {
            text: "Электронная почта: " + 'aboba@mail.biba'
            color: "white"
            font.pixelSize: 18
            Layout.fillWidth: true
        }

        Text {
            text: "Телефон: " + '88005553535'
            color: "white"
            font.pixelSize: 18
            Layout.fillWidth: true
        }

        Text {
            text: "Адрес доставки: " + 'Иркутск, Лермонтова 128'
            color: "white"
            font.pixelSize: 18
            Layout.fillWidth: true
        }

        Text {
            text: "Размер обуви: " + '43'
            color: "white"
            font.pixelSize: 18
            Layout.fillWidth: true
        }

        Button {
            text: "Выйти из аккаунта"
            background: Rectangle {
                color: "#F65E49"
                radius: 20 // Применяем радиус к фону кнопки
            }
            font.pixelSize: 16
            Layout.fillWidth: true
            onClicked: {
                stackView.pop(); // Возврат на страницу входа
            }
        }
    }

    Component.onCompleted: {
        console.log("User data received: ", userData);
    }

    // Импортируем компонент страницы каталога
    Component {
        id: catalogPage
        // Путь к файлу каталога
        Loader {
            source: "CatalogPage.qml"
        }
    }
}
