import QtQuick 2.12
import QtQuick.Controls 2.5

Rectangle {
    id: noteArea
    anchors.fill: parent
    color: "transparent" // Màu nền mờ để làm nổi bật
    visible: false // Ẩn ban đầu
    z: 100 // Đặt z cao để đè lên các thành phần khác
    radius: 40

    // Thuộc tính tùy chỉnh
    property string title: "Thông tin bệnh lý"
    property string description: "Thông tin mô tả.\nCó thể tùy chỉnh nội dung."
    // Tín hiệu khi đóng
    signal closed()
    // Nội dung Note
    Rectangle {
        id : recRight
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 200
        anchors.top: parent.top
        anchors.right: parent.right
        radius: 20
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#e8f8fd"
            }

            GradientStop {
                position: 0.53
                color: "#c3e1fc"
            }

            GradientStop {
                position: 1
                color: "#d2f9fe"
            }
        }
        z: 101

        Rectangle {
            id: closedBtn
            width: 30
            height: 30
            color: "transparent"
            radius: 10
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 10
            z: 102

            MouseArea {
                hoverEnabled: false
                enabled: true
                anchors.fill: parent
                onClicked: {
                    noteArea.visible = false // Ẩn vùng Note khi click
                    noteArea.closed()
                }
            }

            Image {
                id: image
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "qrc:/icons/backicon.png"
            }
        }
    }

    // MouseArea để đóng khi click ra ngoài nội dung
    MouseArea {
        id: overlayMouseArea
        anchors.fill: parent
        z: 99 // Đặt z thấp hơn noteContent để không chặn nút Đóng
        onClicked: {
            noteArea.visible = false
            noteArea.closed()
        }
    }

    // Ngăn MouseArea nền ảnh hưởng đến noteContent
    MouseArea {
        anchors.fill: noteContent
        z: 99
        onClicked: {
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
