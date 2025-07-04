import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12

ApplicationWindow {
    id: window
    visible: true
    width: 1024
    height: 600
    title: qsTr("Car Dashboard")
    flags: Qt.Window | Qt.FramelessWindowHint
//    visibility: window.FullScreen
    // Hàm cập nhật thời gian
    function updateTime() {
        var currentTime = new Date()
        var hours = currentTime.getHours()
        var minutes = currentTime.getMinutes()

        // Định dạng hiển thị 2 chữ số (09:42 thay vì 9:42)
        timeText.text = (hours < 10 ? "0" + hours : hours) + ":" +
                        (minutes < 10 ? "0" + minutes : minutes)
    }
    header:Rectangle {
        id : headerBar
        height: 60
        width: 1024
        gradient: Gradient {
                    GradientStop { position: 0.492; color: "#ccf4fc" }
                    GradientStop { position: 0.902; color: "#fbffff" }
                    GradientStop { position: 0.192; color: "#b8f0fa" }
                }

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            spacing: 10
            layoutDirection: Qt.LeftToRight
            ColumnLayout{
                width: 50
                Layout.fillHeight: false
                Layout.fillWidth: false
                Text {
                    width: 50
                    Text {
                        id: timeText
                        color: "#075e74"
                        styleColor: "#14195a"
                        font.pixelSize: 24
                        font.bold: true

                        Timer {
                            interval: 60000 // 1 phút = 60000ms
                            running: true
                            repeat: true
                            onTriggered: updateTime()
                            triggeredOnStart: true // Cập nhật ngay khi khởi động
                        }
                        // Khởi tạo giá trị ban đầu
                        Component.onCompleted: updateTime()
                    }
                    color: "#FFFFFF"
                    font.pixelSize: 20
                    font.bold: true
                }

                Text {
                    text: {
                        var currentDate = new Date();
                        var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
                        var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                        var dayName = days[currentDate.getDay()];
                        var monthName = months[currentDate.getMonth()];
                        var day = currentDate.getDate();
                        var year = currentDate.getFullYear();
                        return dayName + ", " + monthName + " " + day + ", " + year;
                    }
                    styleColor: "#2f3583"
                    color: "#138396"
                    font.pixelSize: 14
                    font.bold: true
                }
            }
        }
        // Khoảng trống giữa
        Item { Layout.fillWidth: true }

        RowLayout {
            anchors.right: parent.right
            anchors.rightMargin: 0
            spacing: 5
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.rightMargin: 10

            TemplateButton {
                Layout.topMargin: -30
                Layout.rightMargin: 50
                iconSource: "qrc:/icons/FindIcon.png"
                defaultColor: "transparent"
                                hoverColor: "#138396"
                                pressedColor: "#138396"
                                defaultIconColor: "#2f3583"
                                hoverIconColor: "#138396"
                                pressedIconColor: "#b8f0fa"
                                pageToPush: ""
                                heightIcon: 40
                                widthIcon: 50
                                radiusIcon: 15
                            }

            Text {
                                id: batteryText
                                width: 30
                                height: 20
                                text: qsTr("50%")
                                Layout.bottomMargin: 5
                                Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
                                Layout.margins: 0
                                horizontalAlignment: Text.AlignRight
                                color: "#5e7b9d"
                                font.pixelSize: 14
                                Layout.rightMargin: 0
            }
            Rectangle {
                                id: batteryArea
                                width: 30
                                color: "transparent"
                                Layout.preferredHeight: 40
                                Layout.preferredWidth: 30
                                radius: 5
                                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                Layout.rightMargin: 5

                                Image {
                                    id: batteryIcon
                                    anchors.centerIn: parent
                                    source: "qrc:/icons/BatteryIcon.png"
                                    width: 30
                                    height: 30
                                    rotation: -90

                                    ColorOverlay {
                                        source: parent
                                        color: "green"
                                        anchors.fill: parent
                                    }
                                }
                            }
        }
    }

    // Footer (Under bar)
    footer: Rectangle {
        id : footerBar
        height: 95
        gradient: Gradient {
                    GradientStop { position: 0; color: "#fffeff" }
                    GradientStop { position: 1; color: "#d7fffe" }
                }

        RowLayout {
            width: parent.width
            height: parent.height
            spacing: 40
            Layout.fillWidth: true

            // Đảm bảo RowLayout căn giữa và không có margins cố định

            layoutDirection: Qt.LeftToRight
            Item { Layout.fillWidth: true }

            TemplateButton {
                id : homeButton
                iconSource:"qrc:/icons/HomeIcon.png"
                height: 50
                width: 50
                pageToPush: "qrc:/NaviPage/HomePage.qml"
                defaultColor: "#b8f0fa"              // Màu nền mặc định
                hoverColor: "#138396"               // Màu nền khi hover
                pressedColor: "#138396"             // Màu nền khi nhấn
                defaultIconColor: "#2f3583"          // Màu biểu tượng mặc định
                hoverIconColor: "138396"           // Màu biểu tượng khi hover
                pressedIconColor: "#b8f0fa"         // Màu biểu tượng khi nhấn
            }

            TemplateButton {
                id : mapButton
                iconSource:"qrc:/icons/MapIcon.png"
                height: 50
                width: 50
                pageToPush: "qrc:/NaviPage/MapPage.qml"
                defaultColor: "#b8f0fa"              // Màu nền mặc định
                hoverColor: "#138396"               // Màu nền khi hover
                pressedColor: "#138396"             // Màu nền khi nhấn
                defaultIconColor: "#2f3583"          // Màu biểu tượng mặc định
                hoverIconColor: "138396"           // Màu biểu tượng khi hover
                pressedIconColor: "#b8f0fa"         // Màu biểu tượng khi nhấn
            }

            TemplateButton {
                id : diseaseButton
                iconSource:"qrc:/icons/NoteIcon.png"
                height: 50
                width: 50
                pageToPush: "qrc:/NaviPage/DiseasePage.qml"
                defaultColor: "#b8f0fa"              // Màu nền mặc định
                hoverColor: "#138396"               // Màu nền khi hover
                pressedColor: "#138396"             // Màu nền khi nhấn
                defaultIconColor: "#2f3583"          // Màu biểu tượng mặc định
                hoverIconColor: "138396"           // Màu biểu tượng khi hover
                pressedIconColor: "#b8f0fa"         // Màu biểu tượng khi nhấn
            }

            TemplateButton {
                id : moreButton
                iconSource:"qrc:/icons/MoreIcon.png"
                height: 50
                width: 50
                pageToPush: "qrc:/NaviPage/MorePage.qml"
                defaultColor: "#b8f0fa"              // Màu nền mặc định
                hoverColor: "#138396"               // Màu nền khi hover
                pressedColor: "#138396"             // Màu nền khi nhấn
                defaultIconColor: "#2f3583"          // Màu biểu tượng mặc định
                hoverIconColor: "138396"           // Màu biểu tượng khi hover
                pressedIconColor: "#b8f0fa"         // Màu biểu tượng khi nhấn
            }
            Item { Layout.fillWidth: true }
        }
    }

    // Phần Center (StackView quản lý các trang)
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "qrc:/NaviPage/HomePage.qml"
    }
}

/*##^##
Designer {
    D{i:19;anchors_height:95}
}
##^##*/
