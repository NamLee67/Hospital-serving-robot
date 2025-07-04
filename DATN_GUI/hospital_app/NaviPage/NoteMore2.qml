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
            id: rectangle
            height: 100
            color: "#ffffff"
            radius: 20
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 540

            Image {
                id: image5
                width: 50
                height: 50
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.verticalCenter: parent.verticalCenter
                fillMode: Image.PreserveAspectFit
                source: "qrc:/icons/features.png"
            }

            TextEdit {
                id: textEdit6
                width: 80
                height: 20
                text: qsTr("Tinh nang\ncua Robot")
                anchors.top: parent.top
                anchors.topMargin: 25
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                anchors.leftMargin: 90
                font.pixelSize: 20
            }
        }

        Rectangle {
            id: rectangle1
            width: 500
            color: "#6ea3e2"
            radius: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 20

            Rectangle {
                id: rectangle3
                width: 150
                color: "#b4feee"
                radius: 20
                anchors.top: parent.top
                anchors.topMargin: 50
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 50
                anchors.left: parent.left
                anchors.leftMargin: 10

                Image {
                    id: image2
                    width: 80
                    height: 80
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/icons/obstacle.png"
                }

                TextEdit {
                    id: textEdit
                    height: 20
                    text: qsTr("Ne Vat Can")
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignHCenter
                    anchors.top: parent.top
                    anchors.topMargin: 120
                    font.pixelSize: 20
                }

                TextEdit {
                    id: textEdit1
                    height: 20
                    text: qsTr("Robot co kha nang\nne tranh vat can\ntrong qua trinh\ndi chuyen den \ndiem dich.")
                    anchors.right: parent.right
                    anchors.rightMargin: 25
                    anchors.left: parent.left
                    anchors.leftMargin: 25
                    verticalAlignment: Text.AlignTop
                    horizontalAlignment: Text.AlignHCenter
                    anchors.top: parent.top
                    anchors.topMargin: 160
                    font.pixelSize: 12
                }
            }

            Rectangle {
                id: rectangle4
                x: -2
                y: -4
                width: 150
                color: "#b4feee"
                radius: 20
                anchors.left: parent.left
                anchors.topMargin: 50
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 50
                anchors.leftMargin: 175

                Image {
                    id: image3
                    width: 80
                    height: 80
                    fillMode: Image.PreserveAspectFit
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    source: "qrc:/icons/route.png"
                }

                TextEdit {
                    id: textEdit2
                    x: 1
                    y: 1
                    height: 20
                    text: qsTr("Diem Dich")
                    anchors.left: parent.left
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    anchors.topMargin: 120
                    anchors.rightMargin: 0
                    anchors.top: parent.top
                    anchors.right: parent.right
                    verticalAlignment: Text.AlignTop
                    anchors.leftMargin: 0
                }

                TextEdit {
                    id: textEdit3
                    x: 1
                    y: 1
                    height: 20
                    text: qsTr("Robot co kha nang\ndi chuyen tu hanh\nden phong kham\nma nbenh nhan chon.")
                    anchors.left: parent.left
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    anchors.topMargin: 160
                    anchors.rightMargin: 0
                    anchors.top: parent.top
                    anchors.right: parent.right
                    verticalAlignment: Text.AlignTop
                    anchors.leftMargin: 0
                }
            }

            Rectangle {
                id: rectangle5
                x: 4
                y: -8
                width: 150
                color: "#b4feee"
                radius: 20
                anchors.left: parent.left
                anchors.topMargin: 50
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 50
                anchors.leftMargin: 340

                Image {
                    id: image4
                    width: 80
                    height: 80
                    fillMode: Image.PreserveAspectFit
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    source: "qrc:/icons/interface.png"
                }

                TextEdit {
                    id: textEdit4
                    x: 1
                    y: 1
                    height: 20
                    text: qsTr("Tuong Tac")
                    anchors.left: parent.left
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 20
                    anchors.rightMargin: 0
                    anchors.topMargin: 120
                    anchors.top: parent.top
                    anchors.right: parent.right
                    verticalAlignment: Text.AlignTop
                    anchors.leftMargin: 0
                }

                TextEdit {
                    id: textEdit5
                    x: 2
                    y: 2
                    height: 20
                    text: qsTr("Robot co kha nang\ntuong tac linh hoat\nvoi doi ngu nhan vien\nva voi benh nhan.")
                    anchors.left: parent.left
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 12
                    anchors.rightMargin: 0
                    anchors.topMargin: 160
                    anchors.top: parent.top
                    anchors.right: parent.right
                    verticalAlignment: Text.AlignTop
                    anchors.leftMargin: 0
                }
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
            anchors.topMargin: 150

            Image {
                id: image1
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 20
                anchors.topMargin: 20
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "qrc:/icons/robot22.png"
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
    D{i:0;autoSize:true;height:480;width:640}D{i:9;anchors_height:200;anchors_width:200}
D{i:14;anchors_height:200}D{i:15;anchors_height:200;anchors_width:80}D{i:16;anchors_height:200;anchors_width:100}
D{i:13;anchors_height:200}D{i:18;anchors_height:200}D{i:19;anchors_height:200;anchors_width:200}
D{i:20;anchors_height:100;anchors_width:100}D{i:17;anchors_height:100;anchors_width:100}
D{i:22;anchors_height:200;anchors_width:200}D{i:23;anchors_height:100;anchors_width:100}
D{i:24;anchors_height:100;anchors_width:100}D{i:21;anchors_height:200}D{i:12;anchors_height:200}
D{i:26;anchors_height:100;anchors_width:100}D{i:25;anchors_height:200;anchors_width:200}
}
##^##*/
