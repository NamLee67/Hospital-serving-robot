import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQuick.Layouts 1.12

Page {
    width: 1024
    height: 600

    title: qsTr("Disease")

    // Function to search for all matching names and append to the searchResultModel
    function findName(searchName, model, role, firstMatchIndexProperty) {
        element.searchTerm = searchName.toLowerCase();
        var matches = [];
        for (var i = 0; i < model.count; i++) {
            var nameInModel = model.get(i).name.toLowerCase();
            if (nameInModel.indexOf(searchName.toLowerCase()) !== -1) {
                matches.push(model.get(i).name);
                searchResultModel.append({ "name": model.get(i).name, "role": role });
                if (element[firstMatchIndexProperty] === -1) {
                    element[firstMatchIndexProperty] = i;
                }
            }
        }
        return matches;
    }

    Item {
        id: element
        anchors.fill: parent
        anchors.bottomMargin: 170
        anchors.topMargin: 20
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        property string searchTerm: ""
        property int firstDoctorMatchIndex: -1
        property int firstNurseMatchIndex: -1


        // Define a ListModel with different names
        ListModel {
            id: doctorModel
            ListElement { name: "Le Van Nam" }
            ListElement { name: "Tran Trung Duc" }
            ListElement { name: "Le Huu Hoa" }
            ListElement { name: "Nguyen Viet Trung" }
            ListElement { name: "Tran Nguyen Duong Phat" }
            ListElement { name: "Nguyen Long Vu" }
            // Add more names as needed
        }

        ListModel {
            id: nurseModel
            ListElement { name: "Luu Nhat Anh" }
            ListElement { name: "Dam Luu Anh Ngoc" }
            ListElement { name: "Hoang Ngoc Thuy Duong" }
            ListElement { name: "Nguyen Thi Nhu Quynh" }
            ListElement { name: "Nhu Binh" }
            ListElement { name: "Tinh Tam" }
            // Add more names as needed
        }

        // ListModel to store search results
        ListModel {
            id: searchResultModel
        }

        // NURSE AREA
        Rectangle {
            id: nurseArea
            color: "#daecfe"
            border.color: "#6ea3e2"
            radius: 20
            border.width: 4
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            height: 280
            width: 482

            Column {
                height: 250
                ScrollView {
                    width: 470
                    height: 200
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    clip: true

                    ListView {
                        id: listNurse
                        spacing: 10
                        anchors.fill: parent
                        model: nurseModel
                        delegate: Item {
                            width: listNurse.width
                            height: 60
                            property bool isMatch: element.searchTerm && name.toLowerCase().indexOf(element.searchTerm) !== -1
                            Row {
                                height: 60
                                anchors.fill: parent

                                Image {
                                    width: 50
                                    anchors.leftMargin: 20
                                    anchors.bottom: parent.bottom
                                    anchors.left: parent.left
                                    anchors.top: parent.top
                                    fillMode: Image.PreserveAspectFit
                                    source: "qrc:/icons/nureseicon.png"
                                }

                                Text {
                                    width: 50
                                    text: qsTr(model.name)
                                    anchors.left: parent.left
                                    anchors.leftMargin: 80
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 18
                                    color: isMatch ? "#ff0000" : "#000000"
                                    font.bold: isMatch
                                }

                                RoundButton {
                                    width: 30
                                    height: 30
                                    background: Rectangle {
                                        color: "transparent"
                                        radius: 15
                                    }
                                    anchors.rightMargin: 30
                                    Image {
                                        fillMode: Image.PreserveAspectFit
                                        source: "qrc:/icons/callicon.png"
                                        anchors.fill: parent
                                        visible: true
                                    }
                                    anchors.right: parent.right
                                    anchors.verticalCenter: parent.verticalCenter
                                }

                                RoundButton {
                                    width: 30
                                    height: 30
                                    background: Rectangle {
                                        color: "transparent"
                                        radius: 15
                                    }
                                    anchors.rightMargin: 70
                                    Image {
                                        fillMode: Image.PreserveAspectFit
                                        source: "qrc:/icons/chaticon3.png"
                                        anchors.fill: parent
                                        visible: true
                                    }
                                    anchors.right: parent.right
                                    anchors.verticalCenter: parent.verticalCenter
                                    onClicked: {
                                        console.log("Nurse Name:", model.name)
                                        if (typeof mainWindowLauncher !== "undefined") {
                                            console.log("mainWindowLauncher is defined, launching MainWindow")
                                            mainWindowLauncher.launchChatWindow(model.name)
                                        } else {
                                            console.log("Error: mainWindowLauncher is undefined")
                                        }
                                    }
                                }

                                Text {
                                    text: qsTr("Dr")
                                    anchors.left: parent.left
                                    anchors.bottom: parent.bottom
                                    font.pixelSize: 12
                                    anchors.bottomMargin: 3
                                    anchors.leftMargin: 80
                                }
                            }
                        }
                        onContentYChanged: {
                            if (element.firstNurseMatchIndex !== -1) {
                                positionViewAtIndex(element.firstNurseMatchIndex, ListView.Beginning);
                            }
                        }
                    }

                    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                    ScrollBar.vertical.policy: ScrollBar.AlwaysOn
                    ScrollBar.horizontal.interactive: true
                    ScrollBar.vertical.interactive: true
                }

                Text {
                    id: element10
                    text: qsTr("Nurse List")
                    font.pixelSize: 22
                    anchors.top: parent.top
                    anchors.topMargin: 15
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                spacing: 5
                anchors.fill: parent
            }
        }

        // DOCTOR AREA
        Rectangle {
            id: doctorArea
            width: 482
            height: 280
            color: "#daecfe"
            border.color: "#6ea3e2"
            radius: 20
            border.width: 4
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0

            Column {
                id: column1
                height: 250
                anchors.fill: parent
                spacing: 5

                Text {
                    id: element6
                    text: qsTr("Doctor List")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 15
                    font.bold: true
                    font.pixelSize: 22
                }

                ScrollView {
                    width: 470
                    height: 200
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    clip: true

                    ListView {
                        id: listDoctor
                        spacing: 10
                        anchors.fill: parent
                        model: doctorModel
                        delegate: Item {
                            width: listDoctor.width
                            height: 60
                            property bool isMatch: element.searchTerm && name.toLowerCase().indexOf(element.searchTerm) !== -1
                            Row {
                                height: 60
                                anchors.fill: parent

                                Image {
                                    width: 50
                                    anchors.leftMargin: 20
                                    anchors.bottom: parent.bottom
                                    anchors.left: parent.left
                                    anchors.top: parent.top
                                    fillMode: Image.PreserveAspectFit
                                    source: "qrc:/icons/doctoricon2.png"
                                }

                                Text {
                                    width: 50
                                    text: qsTr(model.name)
                                    anchors.left: parent.left
                                    anchors.leftMargin: 80
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.pixelSize: 18
                                    color: isMatch ? "#ff0000" : "#000000"
                                    font.bold: isMatch
                                }

                                RoundButton {
                                    width: 30
                                    height: 30
                                    background: Rectangle {
                                        color: "transparent"
                                        radius: 15
                                    }
                                    anchors.rightMargin: 30
                                    Image {
                                        fillMode: Image.PreserveAspectFit
                                        source: "qrc:/icons/callicon.png"
                                        anchors.fill: parent
                                        visible: true
                                    }
                                    anchors.right: parent.right
                                    anchors.verticalCenter: parent.verticalCenter
                                }

                                RoundButton {
                                    width: 30
                                    height: 30
                                    background: Rectangle {
                                        color: "transparent"
                                        radius: 15
                                    }
                                    anchors.rightMargin: 70
                                    Image {
                                        fillMode: Image.PreserveAspectFit
                                        source: "qrc:/icons/chaticon3.png"
                                        anchors.fill: parent
                                        visible: true
                                    }
                                    anchors.right: parent.right
                                    anchors.verticalCenter: parent.verticalCenter
                                    onClicked: {
                                        console.log("Doctor Name:", model.name)
                                        if (typeof mainWindowLauncher !== "undefined") {
                                            console.log("mainWindowLauncher is defined, launching MainWindow")
                                            mainWindowLauncher.launchChatWindow(model.name)
                                        } else {
                                            console.log("Error: mainWindowLauncher is undefined")
                                        }
                                    }
                                }


                                Text {
                                    text: qsTr("Dr")
                                    anchors.left: parent.left
                                    anchors.bottom: parent.bottom
                                    font.pixelSize: 12
                                    anchors.bottomMargin: 3
                                    anchors.leftMargin: 80
                                }
                            }
                        }
                        onContentYChanged: {
                            if (element.firstDoctorMatchIndex !== -1) {
                                positionViewAtIndex(element.firstDoctorMatchIndex, ListView.Beginning);
                            }
                        }
                    }

                    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                    ScrollBar.vertical.policy: ScrollBar.AlwaysOn
                    ScrollBar.horizontal.interactive: true
                    ScrollBar.vertical.interactive: true
                }
            }
        }

        // Search Area
        Rectangle {
            id: recTop1
            width: 482
            height: 110
            color: "#ffffff"
            radius: 15
            border.color: "#6ea3e2"
            anchors.left: parent.left
            anchors.leftMargin: 0
            border.width: 3

            Column {
                id: column4
                anchors.bottomMargin: 5
                anchors.topMargin: 5
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
                    onAccepted: {
                        element.searchTerm = searchField.text.toLowerCase();
                        searchResultModel.clear();
                        element.firstDoctorMatchIndex = -1;
                        element.firstNurseMatchIndex = -1;
                        if (!searchField.text) {
                            searchResultModel.append({ "name": "Please enter a name", "role": "" });
                        } else {
                            var doctorMatches = findName(searchField.text, doctorModel, "Doctor", "firstDoctorMatchIndex");
                            var nurseMatches = findName(searchField.text, nurseModel, "Nurse", "firstNurseMatchIndex");
                            if (doctorMatches.length === 0 && nurseMatches.length === 0) {
                                searchResultModel.append({ "name": "Name not found in either list", "role": "" });
                            }
                        }
                        listDoctor.forceLayout();
                        listNurse.forceLayout();
                        if (element.firstDoctorMatchIndex !== -1) {
                            listDoctor.positionViewAtIndex(element.firstDoctorMatchIndex, ListView.Beginning);
                        }
                        if (element.firstNurseMatchIndex !== -1) {
                            listNurse.positionViewAtIndex(element.firstNurseMatchIndex, ListView.Beginning);
                        }
                    }

                    RoundButton {
                        onClicked: {
                            element.searchTerm = searchField.text.toLowerCase();
                            searchResultModel.clear();
                            element.firstDoctorMatchIndex = -1;
                            element.firstNurseMatchIndex = -1;
                            if (!searchField.text) {
                                searchResultModel.append({ "name": "Please enter a name", "role": "" });
                            } else {
                                var doctorMatches = findName(searchField.text, doctorModel, "Doctor", "firstDoctorMatchIndex");
                                var nurseMatches = findName(searchField.text, nurseModel, "Nurse", "firstNurseMatchIndex");
                                if (doctorMatches.length === 0 && nurseMatches.length === 0) {
                                    searchResultModel.append({ "name": "Name not found in either list", "role": "" });
                                }
                            }
                            listDoctor.forceLayout();
                            listNurse.forceLayout();
                            if (element.firstDoctorMatchIndex !== -1) {
                                listDoctor.positionViewAtIndex(element.firstDoctorMatchIndex, ListView.Beginning);
                            }
                            if (element.firstNurseMatchIndex !== -1) {
                                listNurse.positionViewAtIndex(element.firstNurseMatchIndex, ListView.Beginning);
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
                        id: image
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
                    height: 50
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
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

        Rectangle {
            id: recTop2
            width: 231
            height: 110
            color: "#ffffff"
            radius: 15
            border.color: "#6ea3e2"
            border.width: 3
            anchors.left: parent.left
            anchors.leftMargin: 502

            Column {
                id: column2
                x: 131
                width: 100
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                spacing: 50

                Text {
                    text: qsTr("+200")
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 20
                }

                Text {
                    text: qsTr("Nurse")
                    font.italic: true
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 15
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 16
                }
            }

            Image {
                width: 80
                height: 80
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                fillMode: Image.PreserveAspectFit
                source: "qrc:/icons/nurseicon2.png"
            }
        }

        Rectangle {
            id: recTop4
            width: 231
            height: 110
            color: "#ffffff"
            radius: 15
            border.color: "#6ea3e2"
            border.width: 3
            anchors.left: parent.left
            anchors.leftMargin: 753

            Column {
                id: column
                x: 131
                width: 100
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                spacing: 50

                Text {
                    id: element1
                    text: qsTr("+100")
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 20
                }

                Text {
                    id: element2
                    text: qsTr("Doctor")
                    font.italic: true
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 15
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 16
                }
            }
            Image {
                width: 80
                height: 80
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                fillMode: Image.PreserveAspectFit
                source: "qrc:/icons/doctoricon.png"
            }
        }
    }
}

/*##^##
Designer {
    D{i:3;anchors_height:400;anchors_width:135;anchors_x:25;anchors_y:19}D{i:4;anchors_height:400;anchors_width:135;anchors_x:25;anchors_y:19}
D{i:21;anchors_height:400;anchors_width:200}D{i:30;anchors_height:400;anchors_width:135;anchors_x:25;anchors_y:19}
D{i:22;anchors_height:100;anchors_width:100}D{i:20;anchors_height:400;anchors_width:200}
D{i:40;anchors_height:200;anchors_width:482}D{i:41;anchors_height:400;anchors_width:100;anchors_x:131}
D{i:43;anchors_height:400;anchors_width:100;anchors_x:131}D{i:47;anchors_height:400;anchors_width:200}
D{i:48;anchors_height:100;anchors_width:100}D{i:33;anchors_height:100;anchors_width:100}
D{i:52;anchors_height:100;anchors_width:100}
}
##^##*/
