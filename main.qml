import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 360
    height: 640
    title: "Прототип приложения"

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: loginPage

        Component {
            id: loginPage
            Loader {
                source: "LoginPage.qml"
            }
        }

        Component {
            id: resetPasswordPage
            Loader {
                source: "ResetPasswordPage.qml"
            }
        }

        Component {
            id: registerPage
            Loader {
                source: "RegisterPage.qml"
            }
        }

        Component {
            id: userProfilePage
            Loader {
                source: "UserProfilePage.qml"
            }
        }
    }
}
