// NaviPage/HomePage.qml
import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12
import QtQuick.Controls 2.3

Item {
    width: 1024
    height: 600
    anchors.fill: parent
    property int waitNumber: 0
    property int left_status: 0
    property int right_status: 0
    property string waitPerson: ""
    property string goal_pos: "" // Default value
    property double vel: 0.0
    // Connections to handle wait number updates from clientManager
    Connections {
        target: clientManager
        function onWaitNumberUpdated(number) {
            waitNumber = number
            console.log("Wait number received in HomePage:", number)
            noteDisease.visible = true // Show the popup when number is receiveds
        }
        function onWaitPersonUpdated(person){
            waitPerson = person
            console.log("current wait person received : ", person)
        }
    }

    Connections {
        target: navigationSender
        function onVelocityUpdated(linearVelocity) {
            vel =linearVelocity
            console.log("GUI vel: " + vel)
            // velocityText.text = "Linear Velocity: " + linearVelocity.toFixed(2) 
        }
    }

    // Binding {
    //     target: velText
    //     property: "text"
    //     value: (vel || 0.0).toFixed(4)
    // }
    Image {
        id: image
        anchors.fill: parent
        fillMode: Image.Stretch
        source: ""

        Rectangle {
            id: recParent
            x: 50
            y: 10
            width: parent.width - 100
            height: parent.height - 10
            color: "#ffffff"
            radius: 40
            border.color: "#0897bb"
            border.width: 7
            anchors.centerIn: parent
            layer.enabled: true // Bật Layer
            layer.effect: OpacityMask {
                maskSource: Item {
                    width: recRight.width
                    height: recRight.height
                    Rectangle {
                        anchors.fill: parent
                        width: recRight.adapt ? recRight.width : Math.min(recRight.width, recRight.height)
                        height: recRight.adapt ? recRight.height : width
                        radius: 30
                    }
                }
            }
            Image {
                id: image2
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
                source: "qrc:/icons/BG01.jpg"
            }
            Rectangle {
                id: recRadius
                color: "transparent"
                radius: 40
                border.color: "#0897bb"
                border.width: 7
                anchors.topMargin: 0
                anchors.fill: parent
            }

            Rectangle {
                id: recRight
                color: "transparent"
                radius: 40
                clip: true
                anchors.fill: parent
                anchors.leftMargin: 350
                anchors.margins: 7




                Image {
                    id: image1
                    width: 300
                    height: 350
                    anchors.verticalCenter: parent.verticalCenter
                    fillMode: Image.PreserveAspectFit
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    anchors.right: parent.right
                    anchors.rightMargin: 100
                    source: "qrc:/icons/robot22.png"
                }
            }

            Rectangle {
                id: recNum
                width: 200
                height: 270
                color: "#d4f0f8"
                radius: 30
                border.color: "#90a5d5"
                border.width: 2
                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.verticalCenter: parent.verticalCenter

                Column {
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.topMargin: 40

                    CustomButton {
                        id: buttonA
                        anchors.fill: parent
                        hoverIconColor: "#59b3f3"
                        heightImg: 40
                        textleftMargin: 10
                        imgleftMargin: 110
                        defaultIconColor: "#e7f3fa"
                        pressedTextColor: "59b3f3"
                        buttonText: "Get Number"
                        defaultTextColor: "e7f3fa"
                        idName: "buttonA"
                        pressedColor: "#59b3f3"
                        widthImg: 40
                        defaultColor: "#afc7ee"
                        heightIcon: 50
                        widthIcon: 160
                        iconSource: "qrc:/icons/HomeIcon.png"
                        hoverColor: "#59b3f3"
                        hoverTextColor: "59b3f3"
                        onClicked: {

                            if (typeof clientManager !== "undefined") {
                                console.log("Requesting wait number from HomePage")
                                clientManager.requestWaitNumber()
                            } else {
                                console.log("Error: clientManager is undefined")
                            }
                        }
                    }

                    Text {
                        id: element3
                        color: "#142c9a"
                        text: qsTr("STATUS :")
                        anchors.leftMargin: 10
                        anchors.topMargin: 80
                        anchors.fill: parent
                        font.bold: true
                        font.pixelSize: 24
                    }

                    Text {
                        id: statusZone
                        color: "#142c9a"
                        text: qsTr("Current Person : \n%1").arg(waitPerson)
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.top: parent.top
                        anchors.topMargin: 110
                        font.italic: true
                        font.pixelSize: 12
                    }

                    Text {
                        id: statusZone1
                        color: "#142c9a"
                        text: qsTr("Goal Position : \n%1").arg(goal_pos)
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.topMargin: 150
                        font.italic: true
                        anchors.leftMargin: 10
                        font.pixelSize: 12
                    }
                }
            }

            Column {
                id: column
                width: 200
                height: 270
                spacing: 20
                anchors.left: parent.left
                anchors.leftMargin: 270
                anchors.verticalCenter: parent.verticalCenter

                Rectangle {
                    id: recSpeed
                    width: 200
                    height: 150
                    color: "#d4f0f8"
                    radius: 20
                    border.color: "#afc7ee"
                    border.width: 2

                    Column {
                        id: column1
                        anchors.rightMargin: 20
                        anchors.fill: parent

                        Text {
                            id: element
                            color: "#142c9a"
                            text: qsTr("SPEED")
                            anchors.top: parent.top
                            anchors.topMargin: 20
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.bold: true
                            font.pixelSize: 24
                        }

                        Text {
                            id: element1
                            color: "#142c9a"
                            text: qsTr("m/s")
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 20
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 20
                        }

                        Text {
                            id: velText
                            text: navigationSender.robotSpeed.toFixed(2)
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 45
                        }
                    }

                    ProgressBar {
                        id: progressBar
                        width: 100
                        height: 20
                        to: 0.5
                        anchors.left: parent.left
                        anchors.leftMargin: 110
                        anchors.verticalCenter: parent.verticalCenter
                        indeterminate: false
                        font.pointSize: 24
                        value: 0.3
                        rotation: -90

                    }
                }

                Rectangle {
                    id: recLight
                    color: "#d4f0f8"
                    radius: 20
                    border.color: "#90a5d5"
                    border.width: 2
                    anchors.topMargin: 170
                    anchors.fill: parent

                    Row {
                        id: row
                        spacing: 40
                        anchors.fill: parent

                        CustomButton {
                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.top: parent.top
                            anchors.topMargin: 20
                            anchors.verticalCenter: parent.verticalCenter
                            radiusIcon: 10
                            imgleftMargin: 10
                            widthIcon: 70
                            heightIcon: 60
                            buttonText: ""
                            iconSource: "qrc:/icons/lighticon1.png"
                            // Dynamic color bindings based on right_status
                            defaultColor: left_status == 1 ? "yellow" : "#59b3f3"
                            pressedColor: left_status == 1 ? "yellow" : "yellow"
                            hoverColor: left_status == 1 ? "yellow" : "#e7f3fa"
                            defaultIconColor: left_status == 1 ? "yellow" : "#e7f3fa"
                            hoverIconColor: left_status == 1 ? "yellow" : "#59b3f3"
                            pressedIconColor: left_status == 1 ? "yellow" : "#59b3f3"
                            defaultTextColor: left_status == 1 ? "yellow" : "#e7f3fa"
                            hoverTextColor: left_status == 1 ? "yellow" : "#59b3f3"
                            pressedTextColor: left_status == 1 ? "yellow" : "yellow"

                            heightImg: 50
                            widthImg: 50
                            onClicked: {
                                left_status = left_status == 1 ? 0 : 1
                                lightController.toggleLeftLight(!lightController.leftLightState)
                            }
                        }

                        CustomButton {
                            anchors.left: parent.left
                            anchors.leftMargin: 110
                            anchors.top: parent.top
                            anchors.topMargin: 20
                            anchors.verticalCenter: parent.verticalCenter
                            radiusIcon: 10
                            imgleftMargin: 10
                            widthIcon: 70
                            heightIcon: 60
                            buttonText: ""
                            iconSource: "qrc:/icons/lighticon2.png"
                            defaultColor: right_status == 1 ? "yellow" : "#59b3f3"
                            pressedColor: right_status == 1 ? "yellow" : "yellow"
                            hoverColor: right_status == 1 ? "yellow" : "#e7f3fa"
                            defaultIconColor: right_status == 1 ? "yellow" : "#e7f3fa"
                            hoverIconColor: right_status == 1 ? "yellow" : "#59b3f3"
                            pressedIconColor: right_status == 1 ? "yellow" : "#59b3f3"
                            defaultTextColor: right_status == 1 ? "yellow" : "#e7f3fa"
                            hoverTextColor: right_status == 1 ? "yellow" : "#59b3f3"
                            pressedTextColor: right_status == 1 ? "yellow" : "yellow"

                            heightImg: 50
                            widthImg: 50
                            onClicked: {
                                right_status = right_status == 1 ? 0 : 1
                                lightController.toggleRightLight(!lightController.rightLightState)
                            }
                        }

                    }
                }

            }
            NoteDisease {
                id : idDisease1
                noteWidth : 300
                noteheight: 200
                title: "Collected Number"
                description: "Your Number is 123."
            }
            // NoteDisease component to display wait number in a styled popup
                Rectangle {
                    id: noteDisease
                    anchors.fill: parent
                    color: "#80000000" // Semi-transparent background
                    visible: false // Hidden initially
                    z: 100 // Overlay on top
                    radius: 40
                    signal closed()

                    Rectangle {
                        id: noteContent
                        width: 300
                        height: 200
                        color: "white"
                        radius: 20
                        anchors.centerIn: parent
                        z: 101

                        Column {
                            anchors.centerIn: parent
                            spacing: 20

                            Text {
                                text: qsTr("Thông tin số chờ")
                                font.pixelSize: 20
                                font.bold: true
                                color: "#333333"
                                horizontalAlignment: Text.AlignHCenter
                            }

                            Text {
                                id: idDisease1Popup // Same ID as above, but scoped differently
                                text: qsTr("Số chờ của bạn: %1").arg(waitNumber)
                                font.pixelSize: 16
                                color: "#333333"
                                horizontalAlignment: Text.AlignHCenter
                            }

                            Rectangle {
                                id: closedBtn
                                width: 100
                                height: 60
                                color: "#38405F"
                                radius: 10
                                anchors.horizontalCenter: parent.horizontalCenter
                                z: 102

                                Text {
                                    text: qsTr("Đóng")
                                    color: "white"
                                    font.pixelSize: 16
                                    anchors.centerIn: parent
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        noteDisease.visible = false
                                        noteDisease.closed()
                                    }
                                }
                            }
                        }
                    }

                    MouseArea {
                        id: overlayMouseArea
                        anchors.fill: parent
                        z: 99
                        onClicked: {
                            noteDisease.visible = false
                            noteDisease.closed()
                        }
                    }

                    MouseArea {
                        anchors.fill: noteContent
                        z: 99
                        onClicked: {}
                    }
                }

        }
    }

}




/*##^##
Designer {
    D{i:2;anchors_height:590;anchors_width:924;anchors_x:50;anchors_y:10}D{i:11;anchors_height:400;anchors_width:200}
D{i:15;anchors_height:200;anchors_width:200}D{i:16;anchors_height:200;anchors_width:200}
D{i:17;anchors_height:400;anchors_width:200}D{i:12;anchors_height:80;anchors_width:200}
D{i:21;anchors_width:120}D{i:22;anchors_height:200;anchors_width:200}D{i:23;anchors_height:400;anchors_width:200}
D{i:24;anchors_height:400;anchors_width:200}D{i:18;anchors_height:400;anchors_width:200}
}
##^##*/
