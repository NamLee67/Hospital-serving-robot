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

        Row {
            id: row
            spacing: 5
            anchors.topMargin: 100
            anchors.fill: parent

//            Rectangle {
//                id: rectangle
//                width: 250
//                color: "#ffffff"
//                anchors.leftMargin: 10
//                anchors.bottom: parent.bottom
//                anchors.left: parent.left
//                anchors.top: parent.top
//                radius : 20
//                clip: true
//                anchors.bottomMargin: 10

//                Image {
//                    id: image9
//                    clip: true
//                    anchors.fill: parent
//                    fillMode: Image.Stretch
//                    source: "qrc:/icons/hospital1.jpg"
//                }
//            }
            Rectangle {
                id: recRight1
                width: 512
                height: parent.height - 20 // Đảm bảo chiều cao phù hợp
                color: "#ffffff"
                radius: 20
                anchors.leftMargin: 10
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.top: parent.top
                clip: true
                anchors.bottomMargin: 10
                layer.enabled: true // Bật Layer
                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: recRight1.width
                        height: recRight1.height
                        Rectangle {
                            anchors.fill: parent
                            radius: 20 // Đồng bộ radius với recRight
                        }
                    }
                }

                Image {
                    id: backgroundImage
                    anchors.fill: parent
                    fillMode: Image.Stretch
                    source: "qrc:/icons/Bang_gia_tien_giuong.png"
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
                width: 240
                color: "#d8fdf7"
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                radius : 20
                anchors.bottomMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10

                Column {
                    id: column
                    anchors.fill: parent
                    TextEdit {
                        id: textEdit
                        height: 20
                        color: "#000080"
                        text: qsTr("DOI TUONG UU TIEN")
                        anchors.left: parent.left
                        anchors.rightMargin: 0
                        anchors.top: parent.top
                        anchors.topMargin: 20
                        horizontalAlignment: Text.AlignHCenter
                        anchors.leftMargin: 0
                        font.bold: true
                        font.pixelSize: 18
                        anchors.right: parent.right
                    }

                    TextEdit {
                        id: textEdit1
                        color: "#000080"
                        text: qsTr("1. Trong tinh trang cap cuu.\n\n2.Tre em duoi 2 tuoi.\n\n3.Phu nu co thai.\n\n4.Nguoi khuyet tat.\n\n5.Nguoi gia tren 75 tuoi.\n\n6.Nguoi co cong voi cach mang.")
                        anchors.fill: parent
                        anchors.topMargin: 70
                        anchors.leftMargin: 10
                        font.pixelSize: 14
                    }
                }
            }
        }

        Rectangle {
            id: rectangle3
            width: 280
            height: 80
            color: "#b4feee"
            radius: 15
            border.color: "#6ea3e2"
            border.width: 2
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Row {
                id: row1
                anchors.fill: parent

                Text {
                    id: element2
                    width: 200
                    color: "#000080"
                    text: qsTr("CHINH SACH BENH VIEN")
                    anchors.horizontalCenter: parent.horizontalCenter
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                    font.pixelSize: 20
                    anchors.verticalCenter: parent.verticalCenter
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
    D{i:0;autoSize:true;height:480;width:640}D{i:11;anchors_height:400;anchors_width:138;anchors_x:5;anchors_y:0}
D{i:12;anchors_height:200;anchors_width:138}D{i:13;anchors_height:400;anchors_width:138;anchors_x:5;anchors_y:0}
D{i:15;anchors_height:400;anchors_width:138;anchors_x:5;anchors_y:0}D{i:16;anchors_height:200;anchors_width:125}
D{i:17;anchors_x:0;anchors_y:0}D{i:14;anchors_height:200;anchors_width:138}D{i:10;anchors_height:200;anchors_width:138}
D{i:20;anchors_width:80}D{i:21;anchors_height:20;anchors_width:80}D{i:19;anchors_height:400;anchors_width:200}
D{i:18;anchors_height:200;anchors_width:125;anchors_x:0;anchors_y:0}D{i:9;anchors_height:400;anchors_width:200}
D{i:24;anchors_height:35;anchors_width:125;anchors_x:0;anchors_y:0}D{i:23;anchors_height:200;anchors_width:125;anchors_x:0;anchors_y:0}
D{i:22;anchors_height:35;anchors_x:0;anchors_y:0}D{i:25;anchors_height:35;anchors_x:0;anchors_y:0}
D{i:26;anchors_height:200;anchors_width:125;anchors_x:0;anchors_y:0}
}
##^##*/
