import QtQuick 2.12
import QtQuick.Controls 2.5

Rectangle {
    id: noteDisease
    anchors.fill: parent
    color: "#80000000" // Màu nền mờ để làm nổi bật
    visible: false // Ẩn ban đầu
    z: 10 // Đặt z cao để đè lên các thành phần khác
    radius: 40

    // Thuộc tính tùy chỉnh
    property string title: "Thông tin bệnh lý"
    property string description: "Thông tin mô tả.\nCó thể tùy chỉnh nội dung."

    // Nội dung Note
    Rectangle {
        id: noteContent
        width: 300
        height: 200
        color: "white"
        radius: 20
        anchors.centerIn: parent
        z: 11 // Đảm bảo noteContent ở trên noteDisease

        Column {
            anchors.centerIn: parent
            spacing: 20

            Text {
                text: title
                font.pixelSize: 20
                font.bold: true
                color: "#333333"
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                text: description
                font.pixelSize: 16
                color: "#333333"
                horizontalAlignment: Text.AlignHCenter
            }

            // Nút đóng
            Rectangle {
                width: 100
                height: 60
                color: "#38405F"
                radius: 10
                anchors.horizontalCenter: parent.horizontalCenter
                z: 12 // Đảm bảo nút Đóng ở trên tất cả

                Text {
                    text: "Đóng"
                    color: "white"
                    font.pixelSize: 16
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        noteDisease.visible = false // Ẩn vùng Note khi click
                    }
                }
            }
        }
    }

    // MouseArea để đóng khi click ra ngoài nội dung
    MouseArea {
        id: overlayMouseArea
        anchors.fill: parent
        z: 9 // Đặt z thấp hơn noteContent để không chặn nút Đóng
        onClicked: {
            noteDisease.visible = false
            console.log("Click ra ngoài, noteDisease.visible:", noteDisease.visible)
        }
    }

    // Ngăn MouseArea nền ảnh hưởng đến noteContent
    MouseArea {
        anchors.fill: noteContent
        z: 11 // Đồng bộ với noteContent
        onClicked: {
            // Không làm gì, ngăn sự kiện lan ra ngoài
        }
    }
}
