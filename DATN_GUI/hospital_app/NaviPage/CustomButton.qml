import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

Item {
    id: root
    property string idName: ""
    property string iconSource: "" // Đường dẫn đến biểu tượng
    property string buttonText: "Button"
    property string defaultTextColor: "#000000"
    property string hoverTextColor: "#000000"
    property string pressedTextColor: "#000000"
    property string defaultColor: "#8B939C"              // Màu nền mặc định
    property string hoverColor: "#A1A9B2"               // Màu khi hover
    property string pressedColor: "#6B737E"             // Màu khi nhấn
    property string defaultIconColor: "#38405F"          // Màu biểu tượng mặc định
    property string hoverIconColor: "#5A607F"           // Màu biểu tượng khi hover
    property string pressedIconColor: "#2A304F"         // Màu biểu tượng khi nhấn
    property string borderColor: "black"
    property string pageToPush: ""                      // Trang để chuyển đến khi nhấn
    property var heightIcon: 60
    property var widthIcon: 250
    property var heightImg: 30
    property var widthImg: 30
    property var radiusIcon: 15
    property var imgleftMargin: 20
    property var textleftMargin: 60
    property var textSize : 16
    property var borderRec: 0
    property bool isOverlay: false
    signal clicked()
    Rectangle {
        id: buttonFrame
        width: widthIcon
        height: heightIcon
        color: defaultColor
        radius: radiusIcon
        border.color: borderColor
        border.width : borderRec

        Image {
            id: buttonIcon
            source: iconSource
            width: widthImg
            height: heightImg
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: imgleftMargin
            visible: !isOverlay
        }
        ColorOverlay {
            id: buttonColor
            anchors.fill: buttonIcon
            source: buttonIcon
            color: defaultIconColor
            antialiasing: true
            visible: isOverlay
        }


        Text {
            id: buttonTextID
            text: buttonText
            anchors.left: parent.left
            anchors.leftMargin: textleftMargin
            color: defaultTextColor
            font.pixelSize: textSize
            anchors.verticalCenter: parent.verticalCenter
        }

        // MouseArea để xử lý các sự kiện chuột
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true

            // Khi chuột di chuyển vào
            onEntered: {
                buttonFrame.color = hoverColor
                buttonTextID.color = hoverTextColor
                if (isOverlay) {
                    buttonColor.color = hoverIconColor
                }
            }

            // Khi chuột rời khỏi
            onExited: {
                buttonFrame.color = defaultColor
                buttonTextID.color = defaultTextColor
                if (isOverlay) {
                    buttonColor.color = defaultIconColor
                }
            }

            // Khi nhấn chuột
            onPressed: {
                buttonFrame.color = pressedColor
                buttonTextID.color = pressedTextColor
                if (isOverlay) {
                    buttonColor.color = pressedIconColor
                }
            }

            // Khi thả chuột
            onReleased: {
                if (containsMouse) {
                    buttonFrame.color = hoverColor
                    buttonTextID.color = hoverTextColor
                    if (isOverlay) {
                        buttonColor.color = hoverIconColor
                    }
                } else {
                    buttonFrame.color = defaultColor
                    buttonTextID.color = defaultTextColor
                    if (isOverlay) {
                        buttonColor.color = defaultIconColor
                    }
                }
            }

            // Khi click
            onClicked: {
                buttonFrame.color = hoverColor
                buttonTextID.color = hoverTextColor
                if (isOverlay) {
                    buttonColor.color = hoverIconColor
                }
                root.clicked()
            }
        }
    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:3;anchors_x:125}
}
##^##*/
