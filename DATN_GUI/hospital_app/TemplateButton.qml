import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

Item {
    id: root
    // Thuộc tính tùy chỉnh
    property string iconSource: "" // Đường dẫn đến biểu tượng
    property string defaultColor: "#8B939C"              // Màu nền mặc định
    property string hoverColor: "#A1A9B2"               // Màu khi hover
    property string pressedColor: "#6B737E"             // Màu khi nhấn
    property string defaultIconColor: "#38405F"          // Màu biểu tượng mặc định
    property string hoverIconColor: "#5A607F"           // Màu biểu tượng khi hover
    property string pressedIconColor: "#2A304F"         // Màu biểu tượng khi nhấn
    property string pageToPush: ""                      // Trang để chuyển đến khi nhấn
    property var heightIcon: 50
    property var widthIcon: 50
    property var radiusIcon: 13
//    property StackView stackView: null                  // StackView để điều hướng
    Rectangle {
        id: buttonFrame
        height: heightIcon
        width: widthIcon
        radius: radiusIcon
        // Màu nền mặc định ban đầu
        color: defaultColor

        // Image với ColorOverlay
        Image {
            id: buttonIcon
            anchors.centerIn: parent
            source: iconSource
            width: 30
            height: 30
            visible: false // Ẩn Image gốc để sử dụng ColorOverlay
        }

        ColorOverlay {
            id: buttonColor
            anchors.fill: buttonIcon
            source: buttonIcon
            color: defaultIconColor // Màu biểu tượng mặc định
            antialiasing: true
        }

        // MouseArea để xử lý các sự kiện chuột
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true

            // Khi chuột di chuyển vào
            onEntered: {
                buttonFrame.color = hoverColor
                buttonColor.color = hoverIconColor
            }

            // Khi chuột rời khỏi
            onExited: {
                buttonFrame.color = defaultColor
                buttonColor.color = defaultIconColor
            }

            // Khi nhấn chuột
            onPressed: {
                buttonFrame.color = pressedColor
                buttonColor.color = pressedIconColor
            }

            // Khi thả chuột
            onReleased: {
                if (containsMouse) {
                    buttonFrame.color = hoverColor
                    buttonColor.color = hoverIconColor
                } else {
                    buttonFrame.color = defaultColor
                    buttonColor.color = defaultIconColor
                }
            }

            // Khi click
            onClicked: {
                buttonFrame.color = hoverColor
                buttonColor.color = hoverIconColor
                if (stackView && pageToPush !== "") {
                    stackView.push(pageToPush)
                }
            }
        }
    }
}

