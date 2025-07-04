import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQuick.Layouts 1.12

Page {
    width: 1024
    height: 600
    property int status_1: 0
    property int status_2: 0
    property int status_3: 0
    property int status_4: 0
    property int status_5: 0
    Item {
        id: mainScreen
        anchors.fill: parent
        anchors.bottomMargin: 170
        anchors.topMargin: 20
        anchors.leftMargin: 20
        anchors.rightMargin: 20

        Rectangle {
            id: recLeft
            width: 250
            color: "#59b3f3"
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.top: parent.top
            radius: 20

            Row {
                id: row
                height: 50
                anchors.right: parent.right
                anchors.rightMargin: 60
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 10

                Image {
                    id: image
                    width: 50
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.top: parent.top
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/icons/HomeIcon.png"
                }

                Text {
                    id: element
                    color: "#e7f3fa"
                    text: qsTr("More Feature")
                    font.bold: true
                    anchors.leftMargin: 60
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.pixelSize: 16
                }
            }

            Column {
                id: column
                width: 200
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 8
                anchors.top: parent.top
                anchors.leftMargin: 15
                anchors.topMargin: 80

                CustomButton {
                    defaultColor: status_1 == 1 ? "#e7f3fa" : "#59b3f3"
                    pressedColor: status_1 == 1 ? "#e7f3fa" : "#e7f3fa"
                    hoverColor: status_1 == 1 ? "#e7f3fa" : "#e7f3fa"
                    defaultTextColor: status_1 == 1 ? "Black" : "Black"
                    hoverTextColor: status_1 == 1 ? "Black" : "Black"
                    pressedTextColor: status_1 == 1 ? "Black" : "Black"
                    heightImg: 30
                    widthImg: 30
                    onClicked: {
                        status_1 = status_1 == 1 ? 0 : 1
                        idNote1.visible = true
                    }
                    radiusIcon: 10
                    imgleftMargin: 10
                    widthIcon: 165
                    buttonText: "Policy"
                    iconSource: "qrc:/icons/policyicon.png"
                    isOverlay : false
                    textSize : 14
                    heightIcon: 45
                    anchors.leftMargin: 15
                    anchors.fill: parent
                    pageToPush: ""
                    textleftMargin: 50
                    anchors.topMargin: 0

                }

                CustomButton {
                    defaultColor: status_2 == 1 ? "#e7f3fa" : "#59b3f3"
                    pressedColor: status_2 == 1 ? "#e7f3fa" : "#e7f3fa"
                    hoverColor: status_2 == 1 ? "#e7f3fa" : "#e7f3fa"
                    defaultTextColor: status_2 == 1 ? "Black" : "Black"
                    hoverTextColor: status_2 == 1 ? "Black" : "Black"
                    pressedTextColor: status_2 == 1 ? "Black" : "Black"
                    heightImg: 30
                    widthImg: 30
                    onClicked: {
                        status_2 = status_2 == 1 ? 0 : 1
                        idNote2.visible = true
                    }
                    pressedIconColor: "#59b3f3"
                    radiusIcon: 10
                    imgleftMargin: 10
                    widthIcon: 165
                    buttonText: "About Robot"
                    iconSource: "qrc:/icons/roboticon.png"
                    textSize : 14
                    heightIcon: 45
                    anchors.leftMargin: 15
                    anchors.fill: parent
                    pageToPush: ""
                    textleftMargin: 50
                    anchors.topMargin: 55
                }

                CustomButton {
                    defaultColor: status_3 == 1 ? "#e7f3fa" : "#59b3f3"
                    pressedColor: status_3 == 1 ? "#e7f3fa" : "#e7f3fa"
                    hoverColor: status_3 == 1 ? "#e7f3fa" : "#e7f3fa"
                    defaultTextColor: status_3 == 1 ? "Black" : "Black"
                    hoverTextColor: status_3 == 1 ? "Black" : "Black"
                    pressedTextColor: status_3 == 1 ? "Black" : "Black"
                    heightImg: 30
                    widthImg: 30
                    onClicked: {
                        status_3 = status_3 == 1 ? 0 : 1
                        idNote3.visible = true
                    }
                    radiusIcon: 10
                    imgleftMargin: 10
                    widthIcon: 165
                    buttonText: "About Hospital"
                    iconSource: "qrc:/icons/hospitalicon.png"
                    textSize : 14
                    heightIcon: 45
                    anchors.leftMargin: 15
                    anchors.fill: parent
                    pageToPush: ""
                    textleftMargin: 50
                    anchors.topMargin: 110
                }

                CustomButton {
                    defaultColor: status_4 == 1 ? "#e7f3fa" : "#59b3f3"
                    pressedColor: status_4 == 1 ? "#e7f3fa" : "#e7f3fa"
                    hoverColor: status_4 == 1 ? "#e7f3fa" : "#e7f3fa"
                    defaultTextColor: status_4 == 1 ? "Black" : "Black"
                    hoverTextColor: status_4 == 1 ? "Black" : "Black"
                    pressedTextColor: status_4 == 1 ? "Black" : "Black"
                    heightImg: 30
                    widthImg: 30
                    onClicked: {
                        status_4 = status_4 == 1 ? 0 : 1
                        idNote4.visible = true
                    }
                    radiusIcon: 10
                    imgleftMargin: 10
                    widthIcon: 165
                    buttonText: "Reviews"
                    iconSource: "qrc:/icons/reviewicon.png"
                    textSize : 14
                    heightIcon: 45
                    anchors.leftMargin: 15
                    anchors.fill: parent
                    pageToPush: ""
                    textleftMargin: 50
                    anchors.topMargin: 165
                }

                CustomButton {
                    defaultColor: status_5 == 1 ? "#e7f3fa" : "#59b3f3"
                    pressedColor: status_5 == 1 ? "#e7f3fa" : "#e7f3fa"
                    hoverColor: status_5 == 1 ? "#e7f3fa" : "#e7f3fa"
                    defaultTextColor: status_5 == 1 ? "Black" : "Black"
                    hoverTextColor: status_5 == 1 ? "Black" : "Black"
                    pressedTextColor: status_5 == 1 ? "Black" : "Black"
                    heightImg: 30
                    widthImg: 30
                    onClicked: {
                        status_5 = status_5 == 1 ? 0 : 1
                        idNote5.visible = true
                    }
                    radiusIcon: 10
                    imgleftMargin: 10
                    widthIcon: 165
                    buttonText: "Setting"
                    iconSource: "qrc:/icons/settingicon.png"
//                    defaultColor: "#59b3f3"
//                    pressedColor: "#e7f3fa"
//                    hoverColor: "#e7f3fa"
//                    hoverIconColor: "#59b3f3"
//                    defaultIconColor: "#e7f3fa"
//                    pressedIconColor: "#59b3f3"
//                    defaultTextColor: "e7f3fa"
//                    hoverTextColor: "59b3f3"
//                    pressedTextColor: "59b3f3"
                    textSize : 14
                    heightIcon: 45
                    anchors.leftMargin: 15
                    anchors.fill: parent
                    pageToPush: ""
                    textleftMargin: 50
                    anchors.topMargin: 220
                }
            }
        }

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
                    color: "#dfecfe"
                }

                GradientStop {
                    position: 0.413
                    color: "#b0d0fa"
                }

                GradientStop {
                    position: 0.603
                    color: "#a4c9f9"
                }

                GradientStop {
                    position: 0.994
                    color: "#dfecfe"
                }

                GradientStop {
                    position: 1
                    color: "#dfecfe"
                }

            }

        }
        NoteMore1 {
            id : idNote1
        }
        NoteMore2 {
            id : idNote2
        }
        NoteMore3 {
            id : idNote3
        }
        NoteMore4 {
            id : idNote4
        }
        NoteMore5 {
            id : idNote5
        }

    }
}

/*##^##
Designer {
    D{i:4;anchors_height:30;anchors_width:92}D{i:3;anchors_width:165}D{i:7;anchors_x:15;anchors_y:100}
D{i:8;anchors_x:15;anchors_y:100}D{i:9;anchors_x:15;anchors_y:100}D{i:10;anchors_x:15;anchors_y:100}
D{i:11;anchors_x:15;anchors_y:100}D{i:6;anchors_height:322}
}
##^##*/
