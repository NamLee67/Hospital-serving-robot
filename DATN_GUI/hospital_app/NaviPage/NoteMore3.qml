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
                width: 250
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
                    fillMode: Image.PreserveAspectCrop
                    source: "qrc:/icons/hospital1.jpg"
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
                id: rectangle1
                width: 250
                color: "#b4feee"
                anchors.top: parent.top
                anchors.leftMargin: 272
                Column {
                    id: column1
                    anchors.fill: parent

                    Rectangle {
                        id: rectangle4
                        height: 100
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.top: parent.top
                        radius : 20
                        color: "#b4feee"
                        Image {
                            id: image2
                            width: 35
                            height: 35
                            anchors.top: parent.top
                            anchors.topMargin: 10
                            anchors.left: parent.left
                            anchors.leftMargin: 25
                            fillMode: Image.PreserveAspectFit
                            source: "qrc:/icons/check.png"
                        }

                        Text {
                            id: element3
                            color: "#000080"
                            text: qsTr("Gio lam viec")
                            horizontalAlignment: Text.AlignHCenter
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 25
                            anchors.left: parent.left
                            anchors.leftMargin: 7
                            font.pixelSize: 14
                        }

                        TextEdit {
                            id: textEdit
                            y: 0
                            width: 80
                            height: 20
                            color: "#000080"
                            text: qsTr("Thu 2-Thu 6\nSang: 7 gio-12 gio\nChieu: 13 gio-16 gio")
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 25
                            verticalAlignment: Text.AlignBottom
                            anchors.left: parent.left
                            anchors.leftMargin: 90
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 14
                        }
                    }

                    Rectangle {
                        id: rectangle5
                        height: 100
                        anchors.topMargin: 100
                        color: "#b4feee"
                        Image {
                            id: image3
                            width: 40
                            height: 40
                            anchors.left: parent.left
                            fillMode: Image.PreserveAspectFit
                            anchors.topMargin: 10
                            anchors.top: parent.top
                            source: "qrc:/icons/check.png"
                            anchors.leftMargin: 25
                        }

                        Text {
                            id: element4
                            width: 65
                            color: "#000080"
                            text: qsTr("Cap Cuu")
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            anchors.left: parent.left
                            font.pixelSize: 14
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 25
                            anchors.leftMargin: 10
                        }

                        TextEdit {
                            id: textEdit1
                            y: 0
                            width: 80
                            height: 20
                            color: "#000080"
                            text: qsTr("Cap Cuu: 115\nBenh Vien: 389668894")
                            verticalAlignment: Text.AlignBottom
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 25
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            font.pixelSize: 14
                            anchors.leftMargin: 90
                        }
                        anchors.left: parent.left
                        anchors.rightMargin: 0
                        anchors.top: parent.top
                        anchors.right: parent.right
                    }

                    Rectangle {
                        id: rectangle6
                        height: 100
                        anchors.topMargin: 200
                        radius : 20
                        color: "#b4feee"
                        Image {
                            id: image4
                            width: 40
                            height: 40
                            anchors.left: parent.left
                            fillMode: Image.PreserveAspectFit
                            anchors.topMargin: 10
                            anchors.top: parent.top
                            source: "qrc:/icons/check.png"
                            anchors.leftMargin: 25
                        }

                        Text {
                            id: element5
                            width: 65
                            color: "#000080"
                            text: qsTr("CSKH")
                            horizontalAlignment: Text.AlignHCenter
                            anchors.left: parent.left
                            font.pixelSize: 14
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 25
                            anchors.leftMargin: 10
                        }

                        TextEdit {
                            id: textEdit2
                            y: 0
                            width: 80
                            height: 20
                            color: "#000080"
                            text: qsTr("Goi ngay:\n1900066883\nDang ky kham truc tuyen")
                            verticalAlignment: Text.AlignBottom
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 25
                            anchors.left: parent.left
                            font.pixelSize: 14
                            anchors.leftMargin: 90
                        }
                        anchors.left: parent.left
                        anchors.rightMargin: 0
                        anchors.top: parent.top
                        anchors.right: parent.right
                    }


                }
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                radius : 20
                anchors.bottomMargin: 10
            }

            Rectangle {
                id: rectangle2
                width: 240
                color: "#b4feee"
                anchors.top: parent.top
                Column {
                    id: column2
                    anchors.fill: parent

                    Rectangle {
                        id: rectangle7
                        height: 75
                        color: "#b4feee"
                        radius: 20
                        Image {
                            id: image5
                            width: 40
                            height: 40
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 20
                            anchors.left: parent.left
                            fillMode: Image.PreserveAspectFit
                            anchors.topMargin: 15
                            anchors.top: parent.top
                            source: "qrc:/icons/check.png"
                            anchors.leftMargin: 25
                        }

                        TextEdit {
                            id: textEdit3
                            y: 0
                            width: 80
                            height: 20
                            color: "#000080"
                            text: qsTr("20+\nNam thanh lap")
                            font.family: "Arial"
                            horizontalAlignment: Text.AlignLeft
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            font.pixelSize: 16
                            anchors.bottom: parent.bottom
                            verticalAlignment: Text.AlignTop
                            anchors.bottomMargin: 20
                            anchors.leftMargin: 90
                        }
                        anchors.left: parent.left
                        anchors.rightMargin: 0
                        anchors.top: parent.top
                        anchors.right: parent.right
                    }

                    Rectangle {
                        id: rectangle8
                        height: 75
                        color: "#b4feee"
                        radius: 20
                        anchors.topMargin: 75
                        anchors.left: parent.left
                        anchors.rightMargin: 0
                        anchors.top: parent.top
                        anchors.right: parent.right

                        Image {
                            id: image6
                            width: 40
                            height: 40
                            anchors.left: parent.left
                            fillMode: Image.PreserveAspectFit
                            anchors.topMargin: 15
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            source: "qrc:/icons/check.png"
                            anchors.bottomMargin: 20
                            anchors.leftMargin: 25
                        }

                        TextEdit {
                            id: textEdit4
                            y: 0
                            width: 80
                            height: 20
                            color: "#000080"
                            text: qsTr("1000+\nGiuong benh")
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            font.pixelSize: 16
                            horizontalAlignment: Text.AlignLeft
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 20
                            verticalAlignment: Text.AlignTop
                            anchors.leftMargin: 90
                        }
                    }

                    Rectangle {
                        id: rectangle9
                        height: 75
                        color: "#b4feee"
                        radius: 20
                        anchors.topMargin: 150
                        anchors.left: parent.left
                        anchors.rightMargin: 0
                        anchors.top: parent.top
                        anchors.right: parent.right

                        Image {
                            id: image7
                            width: 40
                            height: 40
                            anchors.left: parent.left
                            fillMode: Image.PreserveAspectFit
                            anchors.topMargin: 15
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            source: "qrc:/icons/check.png"
                            anchors.bottomMargin: 20
                            anchors.leftMargin: 25
                        }

                        TextEdit {
                            id: textEdit5
                            y: 0
                            width: 80
                            height: 20
                            color: "#000080"
                            text: qsTr("900,000+ nguoi\ndieu tri hang nam")
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            font.pixelSize: 16
                            horizontalAlignment: Text.AlignLeft
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 20
                            verticalAlignment: Text.AlignTop
                            anchors.leftMargin: 90
                        }
                    }

                    Rectangle {
                        id: rectangle10
                        height: 75
                        color: "#b4feee"
                        radius: 20
                        anchors.topMargin: 225
                        anchors.left: parent.left
                        anchors.rightMargin: 0
                        anchors.top: parent.top
                        anchors.right: parent.right

                        Image {
                            id: image8
                            width: 40
                            height: 40
                            anchors.left: parent.left
                            fillMode: Image.PreserveAspectFit
                            anchors.topMargin: 15
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            source: "qrc:/icons/check.png"
                            anchors.bottomMargin: 20
                            anchors.leftMargin: 25
                        }

                        TextEdit {
                            id: textEdit6
                            y: 0
                            width: 80
                            height: 20
                            color: "#000080"
                            text: qsTr("600+\nNhan su & bac si")
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            font.pixelSize: 16
                            horizontalAlignment: Text.AlignLeft
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 20
                            verticalAlignment: Text.AlignTop
                            anchors.leftMargin: 90
                        }
                    }
                }
                anchors.bottom: parent.bottom
                radius : 20
                anchors.bottomMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
            }
        }

        Rectangle {
            id: rectangle3
            width: 250
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
                    text: qsTr("ABOUT HOSPITAL")
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
D{i:17;anchors_x:0;anchors_y:0}D{i:14;anchors_height:200;anchors_width:138;anchors_x:5;anchors_y:0}
D{i:10;anchors_height:200;anchors_width:138}D{i:21;anchors_height:400;anchors_width:138;anchors_x:0;anchors_y:0}
D{i:22;anchors_height:92;anchors_width:125}D{i:23;anchors_x:0;anchors_y:0}D{i:20;anchors_height:200;anchors_width:125}
D{i:25;anchors_height:20;anchors_x:0;anchors_y:0}D{i:26;anchors_height:200;anchors_width:252}
D{i:27;anchors_height:20;anchors_width:138;anchors_x:0;anchors_y:0}D{i:24;anchors_height:92;anchors_width:125}
D{i:29;anchors_height:400;anchors_width:138;anchors_x:5;anchors_y:0}D{i:30;anchors_height:200;anchors_width:125;anchors_x:0;anchors_y:0}
D{i:31;anchors_height:35;anchors_width:125;anchors_x:0;anchors_y:0}D{i:28;anchors_height:200;anchors_width:252}
D{i:19;anchors_height:400;anchors_width:138;anchors_x:0;anchors_y:0}D{i:18;anchors_height:200;anchors_width:125}
D{i:35;anchors_height:35;anchors_width:138;anchors_x:0;anchors_y:0}D{i:36;anchors_height:200;anchors_width:125;anchors_x:0;anchors_y:0}
D{i:34;anchors_height:35;anchors_width:125;anchors_x:0;anchors_y:0}D{i:38;anchors_height:35;anchors_x:0;anchors_y:0}
D{i:39;anchors_height:200;anchors_width:125;anchors_x:0;anchors_y:0}D{i:37;anchors_height:35;anchors_width:125;anchors_x:0;anchors_y:0}
D{i:41;anchors_height:100;anchors_width:200;anchors_x:0;anchors_y:0}D{i:42;anchors_height:100;anchors_width:200;anchors_x:0;anchors_y:0}
D{i:40;anchors_height:35;anchors_width:125;anchors_x:0;anchors_y:0}D{i:44;anchors_height:35;anchors_x:0;anchors_y:0}
D{i:45;anchors_height:200;anchors_width:125;anchors_x:0;anchors_y:0}D{i:43;anchors_height:35;anchors_width:125;anchors_x:0;anchors_y:0}
D{i:33;anchors_height:200;anchors_width:125;anchors_x:0;anchors_y:0}D{i:32;anchors_height:35;anchors_width:252;anchors_x:0;anchors_y:0}
D{i:9;anchors_height:400;anchors_width:200}D{i:48;anchors_height:100;anchors_width:200}
D{i:47;anchors_height:100;anchors_width:200;anchors_x:0;anchors_y:0}D{i:46;anchors_height:35;anchors_x:0;anchors_y:0}
}
##^##*/
