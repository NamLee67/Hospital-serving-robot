import QtQuick 2.12
import QtQuick.Controls 2.5

Rectangle {
    // Thuộc tính tùy chỉnh
    property string title: "Thông tin bệnh lý"
    property string description: "Thông tin mô tả.\nCó thể tùy chỉnh nội dung."
    property var noteWidth: 300
    property var noteheight: 200
    property string colorparent: "#80000000"
    id: noteDisease
    anchors.fill: parent
    color: colorparent // Màu nền mờ để làm nổi bật
    visible: false // Ẩn ban đầu
    z: 100 // Đặt z cao để đè lên các thành phần khác
    radius: 40

    // Nội dung Note
    Rectangle {
        id: noteContent
        width: noteWidth
        height: 200
        color: "white"
        radius: 20
        anchors.centerIn: parent
        z: 101 // Đảm bảo noteContent ở trên noteDisease

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
                id: closedBtn
                width: 100
                height: 60
                color: "#38405F"
                radius: 10
                anchors.horizontalCenter: parent.horizontalCenter
                z: 102 // Đảm bảo nút Đóng ở trên tất cả

                Text {
                    text: "Đóng"
                    color: "white"
                    font.pixelSize: 16
                    anchors.centerIn: parent
                }

                MouseArea {
                    hoverEnabled: false
                    enabled: true
                    anchors.fill: parent
                    onClicked: {
                        noteDisease.visible = false // Ẩn vùng Note khi click
                        noteDisease.closed()
                    }
                }
            }
        }
    }

    // MouseArea để đóng khi click ra ngoài nội dung
    MouseArea {
        id: overlayMouseArea
        anchors.fill: parent
        z: 99 // Đặt z thấp hơn noteContent để không chặn nút Đóng
        onClicked: {
            noteDisease.visible = false
            noteDisease.closed()
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
