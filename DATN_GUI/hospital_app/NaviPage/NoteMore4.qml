import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.12

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
        id : recRight1
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 200
        anchors.top: parent.top
        anchors.right: parent.right
        radius: 20
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#6ea3e2"
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

        Rectangle {
            id: recRight
            width: 500
            height: parent.height - 40 // Đảm bảo chiều cao phù hợp
            color: "#ffffff"
            radius: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 20
            layer.enabled: true // Bật Layer
            layer.effect: OpacityMask {
                maskSource: Item {
                    width: recRight.width
                    height: recRight.height
                    Rectangle {
                        anchors.fill: parent
                        radius: 20 // Đồng bộ radius với recRight
                    }
                }
            }

            Image {
                id: backgroundImage
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
                source: "qrc:/icons/Hande_washing.jpg"
                layer.enabled: true // Bật layer cho Image
                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: backgroundImage.width
                        height: backgroundImage.height
                        Rectangle {
                            anchors.fill: parent
                            radius: 20 // Đồng bộ radius với recRight
                        }
                    }
                }

                // Các thành phần con khác giữ nguyên
            }
        }

        Rectangle {
            id: rectangle2
            color: "#6ea3e2"
            radius : 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 540
            anchors.top: parent.top
            anchors.topMargin: 20

            Column {
                id: column
                anchors.fill: parent

                TextEdit {
                    id: textEdit
                    height: 20
                    color: "#d8fdf7"
                    text: qsTr("Thu Tuc Kham Benh")
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    font.pixelSize: 18
                }

                TextEdit {
                    id: textEdit1
                    color: "#d8fdf7"
                    text: qsTr("Buoc 1:\n- Lay so cho.\n- Nhap thong tin.\n- Dong tien kham benh\n\n\nBuoc 2:\n- Xet nghiem lam sang.\n- Den phong kham dang ky.\n\n\nBuoc 3:- Ke don thuoc.")
                    anchors.leftMargin: 10
                    anchors.topMargin: 70
                    anchors.fill: parent
                    font.pixelSize: 14
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
    D{i:0;autoSize:true;height:480;width:640}D{i:10;anchors_height:200}D{i:11;anchors_height:200}
D{i:12;anchors_height:200;anchors_width:80}D{i:14;anchors_height:100;anchors_width:100}
D{i:15;anchors_height:200}D{i:16;anchors_height:200;anchors_width:200}D{i:13;anchors_height:200;anchors_width:100}
D{i:9;anchors_height:200}D{i:19;anchors_width:80}D{i:20;anchors_height:20;anchors_width:80}
D{i:18;anchors_height:400;anchors_width:200}D{i:17;anchors_height:200;anchors_width:200}
}
##^##*/
