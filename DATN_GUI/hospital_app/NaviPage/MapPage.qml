import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQuick.Layouts 1.12
//import QtQuick.VirtualKeyboard 2.4

Page {
    width: 1024
    height: 600


    // Function to search for all matching names and populate the searchResultModel
    function findName(searchName, model, role) {
        if (!searchName) {
            searchResultModel.clear();
            searchResultModel.append({ "name": "Please enter a name", "role": "" });
            return;
        }
        var matches = [];
        for (var i = 0; i < model.count; i++) {
            var nameInModel = model.get(i).name.toLowerCase();
            if (nameInModel.indexOf(searchName.toLowerCase()) !== -1) {
                matches.push(model.get(i).name);
            }
        }
        return matches;
    }
    property string searchTerm: ""

    // Define a ListModel with different names
    ListModel {
        id: sickModel
        ListElement { name: "Ho" }
        ListElement { name: "Sot" }
        ListElement { name: "Cam" }
        ListElement { name: "Nguyen Viet Trung" }
        ListElement { name: "Tran Nguyen Duong Phat" }
        ListElement { name: "Nguyen Long Vu" }
    }

    // ListModel to store search results
    ListModel {
        id: searchResultModel
    }

    Column {
        id: column
        anchors.rightMargin: 40
        anchors.leftMargin: 40
        anchors.bottomMargin: 160
        anchors.topMargin: 10
        anchors.fill: parent

        Rectangle {
            id: idNoteZone
            width: 400
            color: "#d8fdf7"
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            anchors.left: parent.left
            radius: 40
            border.color: "#6ea3e2"
            border.width: 5

            NoteDisease {
                id : idDisease1
                title: "Bệnh lý hô hấp"
                description: "Thông tin về bệnh lý về hô hấp.\nCó thể tùy chỉnh nội dung."
            }

            NoteDisease {
                id : idDisease2
                title: "Bệnh lý tim mạch"
                description: "Thông tin về bệnh lý về hô hấp.\nCó thể tùy chỉnh nội dung."
            }

            NoteDisease {
                id : idDisease3
                title: "Bệnh lý tieu hoa"
                description: "Thông tin về bệnh lý về hô hấp.\nCó thể tùy chỉnh nội dung."
            }
            NoteDisease {
                id : idDisease4
                title: "Bệnh lý tieu hoa"
                description: "Thông tin về bệnh lý về hô hấp.\nCó thể tùy chỉnh nội dung."
            }
            NoteDisease {
                id : idDisease5
                title: "Bệnh lý Ho"
                description: "Thông tin về bệnh lý về hô hấp.\nCó thể tùy chỉnh nội dung."
            }
            NoteDisease {
                id : idDisease6
                title: "Bệnh lý Sot"
                description: "Thông tin về bệnh lý về hô hấp.\nCó thể tùy chỉnh nội dung."
            }
            NoteDisease {
                id : idDisease7
                title: "Help"
                description: "Thông tin về bệnh lý về hô hấp.\nCó thể tùy chỉnh nội dung."
            }

            Grid {
                id: grid
                anchors.rightMargin: 20
                anchors.leftMargin: 20
                anchors.bottomMargin: 10
                anchors.topMargin: 20
                anchors.fill: parent
                spacing: 10
                rows: 2
                columns: 2

                CustomButton {
                    id: buttonA
                    buttonText: "CAP CUU HOI SUC"
                    iconSource: "qrc:/icons/HomeIcon.png"
                    defaultColor: "#b4feee"
                    hoverColor: "#6aa6f3"
                    pressedColor: "#6aa6f3"
                    defaultIconColor: "#38405F"
                    hoverIconColor: "#5A607F"
                    pressedIconColor: "#2A304F"
                    borderRec: 2
                    borderColor: "#6aa6f3"
                    heightIcon: 120
                    widthIcon: 175
                    heightImg: 50
                    widthImg: 50
                    radiusIcon: 30
                    textleftMargin: 50
                    imgleftMargin: 0
                    textSize : 12
                    isOverlay: false
                    onClicked: {
                        idDisease1.visible = true
                    }


                }

                CustomButton {
                    id: buttonB
                    x: 0
                    width: 175
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                    buttonText: "NOI KHOA"
                    widthIcon: 175
                    isOverlay: false
                    defaultColor: "#b4feee"
                    hoverColor: "#6aa6f3"
                    pressedColor: "#6aa6f3"
                    defaultIconColor: "#38405F"
                    hoverIconColor: "#5A607F"
                    pressedIconColor: "#2A304F"
                    borderRec: 2
                    borderColor: "#6aa6f3"
                    textSize: 12
                    heightIcon: 120
                    textleftMargin: 50
                    imgleftMargin: 0
                    widthImg: 50
                    iconSource: "qrc:/icons/HomeIcon.png"
                    heightImg: 50
                    radiusIcon: 30
                    onClicked: {
                        idDisease2.visible = true
                    }
                }

                CustomButton {
                    id: buttonC
                    anchors.top: parent.top
                    anchors.topMargin: 130
                    buttonText: "NGOAI KHOA"
                    widthIcon: 175
                    isOverlay: false
                    defaultColor: "#b4feee"
                    hoverColor: "#6aa6f3"
                    pressedColor: "#6aa6f3"
                    defaultIconColor: "#38405F"
                    hoverIconColor: "#5A607F"
                    pressedIconColor: "#2A304F"
                    borderRec: 2
                    borderColor: "#6aa6f3"
                    textSize: 12
                    heightIcon: 120
                    textleftMargin: 50
                    imgleftMargin: 0
                    widthImg: 50
                    iconSource: "qrc:/icons/HomeIcon.png"
                    heightImg: 50
                    radiusIcon: 30
                    onClicked: {
                        idDisease3.visible = true
                    }
                }

                CustomButton {
                    id: buttonD
                    x: 0
                    width: 175
                    anchors.top: parent.top
                    anchors.topMargin: 130
                    buttonText: "SAN - PHU KHOA"
                    defaultColor: "#b4feee"
                    hoverColor: "#6aa6f3"
                    pressedColor: "#6aa6f3"
                    defaultIconColor: "#38405F"
                    hoverIconColor: "#5A607F"
                    pressedIconColor: "#2A304F"
                    borderRec: 2
                    borderColor: "#6aa6f3"
                    heightIcon: 120
                    textleftMargin: 50
                    imgleftMargin: 0
                    anchors.right: parent.right
                    isOverlay: false
                    anchors.rightMargin: 0
                    heightImg: 50
                    widthIcon: 175
                    iconSource: "qrc:/icons/HomeIcon.png"
                    radiusIcon: 30
                    widthImg: 50
                    textSize: 12
                    onClicked: {
                        idDisease4.visible = true
                    }
                }
            }

            Rectangle {
                id: rectangle
                height: 120
                color: "#e2fff9"
                radius: 30
                border.color: "#6aa6f3"
                border.width: 3
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
            }
            // Search Area
            Rectangle {
                id: recTop1
                height: 120
                color: "#e2fff9"
                radius: 30
                border.color: "#6aa6f3"
                border.width: 3
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20

                Column {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 5

                    TextField {
                        id: searchField
                        width: parent.width
                        placeholderText: qsTr("Enter name to search ...")
                        background: Rectangle {
                            radius: 15
                            border.color: "#C9C9C9"
                            border.width: 1
                        }
                        // Enable input method hints to trigger virtual keyboard
//                        inputMethodHints: Qt.ImhNoPredictiveText
//                        focus: true // Ensure TextField can gain focus
                        onAccepted: {
                            searchResultModel.clear();
                            var doctorMatches = findName(searchField.text, sickModel, "Disease");

                            if (doctorMatches.length > 0) {
                                for (var i = 0; i < doctorMatches.length; i++) {
                                    searchResultModel.append({ "name": doctorMatches[i], "role": "Disease" });
                                }
                            }
                            if (searchResultModel.count === 0 && searchField.text !== "") {
                                searchResultModel.append({ "name": "Name not found in either list", "role": "" });
                            }
                        }
                        RoundButton {
                            onClicked: {
                                searchResultModel.clear();
                                var sickMatches = findName(searchField.text, sickModel, "Disease");

                                if (sickMatches.length > 0) {
                                    for (var i = 0; i < sickMatches.length; i++) {
                                        searchResultModel.append({ "name": sickMatches[i], "role": "Disease" });
                                    }
                                }
                                if (searchResultModel.count === 0 && searchField.text !== "") {
                                    searchResultModel.append({ "name": "Name not found in either list", "role": "" });
                                }
                                if (sickMatches.includes("Ho")){
                                    idDisease5.visible = true
                                }else if (sickMatches.includes("Sot")){
                                    idDisease6.visible = true
                                }else {
                                    idDisease7.visible = true
                                }


                            }
                            width: 30
                            height: 30
                            anchors.rightMargin: 5
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                            id: myRoundButton
                            background: Rectangle {
                                radius: myRoundButton.radius
                                color: "transparent"
                            }
                        }

                        Image {
                            width: 30
                            height: 30
                            anchors.rightMargin: 5
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                            fillMode: Image.PreserveAspectFit
                            source: "qrc:/icons/findicon.png"
                        }
                    }

                    ScrollView {
                        width: parent.width
                        height: 60
                        clip: true

                        ListView {
                            id: resultList
                            model: searchResultModel
                            delegate: Text {
                                text: role ? role + ": " + name : name
                                font.pixelSize: 14
                                width: resultList.width
                                wrapMode: Text.WordWrap
                            }
                        }

                        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
                        ScrollBar.vertical.interactive: true
                    }
                }
            }
//            // Virtual Keyboard
//            InputPanel {
//                id: inputPanel
//                z: 99 // Ensure keyboard appears above other elements
//                anchors.bottom: parent.bottom
//                anchors.left: parent.left
//                anchors.right: parent.right
//                visible: Qt.inputMethod.visible // Show when TextField is focused
//            }
        }

        Rectangle {
            id: roomZone
            width: 504
            color: "#d8fdf7"
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            radius: 40
            border.color: "#6ea3e2"
            border.width: 5

            Rectangle {
                id: mapContainer
                radius: 20
                anchors.bottomMargin: 90
                anchors.fill: parent
                Layout.fillWidth: true
                visible: true
                Layout.fillHeight: true
                clip: true

                layer.enabled: true // Bật Layer
                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: mapContainer.width
                        height: mapContainer.height
                        Rectangle {
                            anchors.fill: parent
                            width: mapContainer.adapt ? mapContainer.width : Math.min(mapContainer.width, mapContainer.height)
                            height: mapContainer.adapt ? mapContainer.height : width
                            radius: 20
                        }
                    }
                }
                Image {
                    id: roomMap
                    source: "qrc:/icons/hospitalMap.jpg"
                    anchors.fill: parent
                }
            }
            Rectangle {
                width: 504
                color: "transparent"
                radius: 20
                anchors.bottomMargin: 90
                anchors.fill: parent
                Layout.fillWidth: true
                visible: true
                Layout.fillHeight: true
                border.color: "#6ea3e2"
                border.width: 5
            }

            Row {
                id: row
                height: 100
                spacing: 10
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.left: parent.left

                CustomButton {
                    id: btnRoomA
                    y: 2
                    isOverlay: true
                    borderColor: "#6aa6f3"
                    defaultColor: "#e2fff9"
                    hoverColor: "#b4feee"
                    pressedColor: "#b4feee"
                    defaultIconColor: "#6aa6f3"
                    hoverIconColor: "#e2fff9"
                    pressedIconColor: "#6aa6f3"
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 80
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    buttonText: "Room A"
                    widthIcon: 100
                    textleftMargin: 35
                    visible: true
                    heightIcon: 60
                    imgleftMargin: 5
                    borderRec: 2
                    iconSource: "qrc:/icons/HomeIcon.png"
                    onClicked: {
                        console.log("message is sending from BtnA...")
//                        navigationSender.sendGoal(0.884733,0.28195,0,0,0,-0.989838,0.142201)
                        if (stackView !== "") {
                            stackView.push("qrc:/NaviPage/HomePage.qml", {"goal_pos": "Going to Room A"})
                        }
                    }
                }

                CustomButton {
                    id: btnRoomB
                    y: 80
                    isOverlay: true
                    borderColor: "#6aa6f3"
                    defaultColor: "#e2fff9"
                    hoverColor: "#b4feee"
                    pressedColor: "#b4feee"
                    defaultIconColor: "#6aa6f3"
                    hoverIconColor: "#e2fff9"
                    pressedIconColor: "#6aa6f3"
                    anchors.left: parent.left
                    anchors.leftMargin: 140
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 80
                    buttonText: "Room B"
                    widthIcon: 100
                    textleftMargin: 35
                    visible: true
                    heightIcon: 60
                    imgleftMargin: 5
                    iconSource: "qrc:/icons/HomeIcon.png"
                    borderRec: 2
                    onClicked: {
                        console.log("message is sending from BtnB...")
//                        navigationSender.sendGoal(0.884733,0.28195,0,0,0,-0.989838,0.142201)
                        if (stackView !== "") {
                            stackView.push("qrc:/NaviPage/HomePage.qml", {"goal_pos": "Going to Room B"})
                        }
                    }
                }

                CustomButton {
                    id: btnRoomC
                    y: 160
                    isOverlay: true
                    borderColor: "#6aa6f3"
                    defaultColor: "#e2fff9"
                    hoverColor: "#b4feee"
                    pressedColor: "#b4feee"
                    defaultIconColor: "#6aa6f3"
                    hoverIconColor: "#e2fff9"
                    pressedIconColor: "#6aa6f3"
                    anchors.left: parent.left
                    anchors.leftMargin: 260
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 80
                    buttonText: "Room C"
                    widthIcon: 100
                    textleftMargin: 35
                    visible: true
                    heightIcon: 60
                    imgleftMargin: 5
                    iconSource: "qrc:/icons/HomeIcon.png"
                    borderRec: 2
                    onClicked: {
                        console.log("message is sending from BtnC...")
//                        navigationSender.sendGoal(0.884733,0.28195,0,0,0,-0.989838,0.142201)
                        if (stackView !== "") {
                            stackView.push("qrc:/NaviPage/HomePage.qml")
                        }
                    }
                }

                CustomButton {
                    id: btnRoomD
                    y: 160
                    isOverlay: true
                    borderColor: "#6aa6f3"
                    defaultColor: "#e2fff9"
                    hoverColor: "#b4feee"
                    pressedColor: "#b4feee"
                    defaultIconColor: "#6aa6f3"
                    hoverIconColor: "#e2fff9"
                    pressedIconColor: "#6aa6f3"
                    anchors.right: parent.right
                    anchors.rightMargin: 120
                    buttonText: "Room D"
                    anchors.bottom: parent.bottom
                    widthIcon: 100
                    visible: true
                    textleftMargin: 35
                    heightIcon: 60
                    imgleftMargin: 5
                    anchors.bottomMargin: 80
                    iconSource: "qrc:/icons/HomeIcon.png"
                    borderRec: 2
                    onClicked: {
                        console.log("message is sending from BtnD...")
//                        navigationSender.sendGoal(0.884733,0.28195,0,0,0,-0.989838,0.142201)
                        if (stackView !== "") {
                            stackView.push("qrc:/NaviPage/HomePage.qml")
                        }
                    }
                }
            }
        }


    }
}

/*##^##
Designer {
    D{i:3;anchors_height:200}D{i:6;anchors_height:400;anchors_width:400;anchors_x:0;anchors_y:0}
D{i:8;anchors_height:400;anchors_width:400;anchors_x:0;anchors_y:0}D{i:9;anchors_height:400;anchors_width:400;anchors_x:0;anchors_y:0}
D{i:10;anchors_height:400;anchors_width:400;anchors_x:0;anchors_y:0}D{i:11;anchors_height:200;anchors_width:200}
D{i:7;anchors_height:400;anchors_width:400;anchors_x:0;anchors_y:0}D{i:12;anchors_height:200}
D{i:2;anchors_height:200}D{i:18;anchors_y:80}D{i:15;invisible:true}D{i:16;anchors_height:400;anchors_width:200}
D{i:17;anchors_x:2;anchors_y:2}D{i:14;anchors_height:300;anchors_width:386;anchors_x:120}
D{i:13;anchors_height:200}D{i:1;anchors_height:400;anchors_width:200;anchors_x:79;anchors_y:52}
}
##^##*/
