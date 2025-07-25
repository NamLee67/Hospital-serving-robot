import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import QtQuick.Extras.Private 1.0
import QtGraphicalEffects 1.0

CircularGauge {
    id: gauge
    // Define the radius and angle for the arc
    property real arcAngle: 180  // Angle in degrees
    property real arcRadius: 90

    function speedColor(value){
        if(value < 60 ){
            return "green"
        } else if(value > 60 && value < 150){
            return "yellow"
        }else{
            return "Red"
        }
    }

    style: CircularGaugeStyle {
        labelStepSize: 10
        labelInset: outerRadius / 2.2
        tickmarkInset: outerRadius / 4.2

        minorTickmarkInset: outerRadius / 4.2
        minimumValueAngle: -155
        maximumValueAngle: 155

        background:Rectangle {
            implicitHeight: gauge.height
            implicitWidth: gauge.width
            color: "#000000"
            anchors.centerIn: parent
            radius: 360

            // Create a Rotation item to move the Image along the arc
            // Image to move along the arc
            Image {
                sourceSize: Qt.size(12, 13)
                source: "qrc:/img/maxLimit.svg"

                // Translate the Image along the arc
                x: arcRadius * Math.cos(Math.PI * arcAngle / 180)
                y: arcRadius * Math.sin(Math.PI * arcAngle / 180)

                // Set the pivot to the bottom center of the Image
                anchors.bottom: circularCanva.top
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Canvas {
                id:circularCanva
                property int value: gauge.value

                anchors.fill: parent

                Component.onCompleted: requestPaint()

                function degreesToRadians(degrees) {
                    return degrees * (Math.PI / 180);
                }

                function createLinearGradient(ctx, start, end, colors) {
                    var gradient = ctx.createLinearGradient(start.x, start.y, end.x, end.y);
                    for (var i = 0; i < colors.length; i++) {
                        gradient.addColorStop(i / (colors.length - 1), colors[i]);
                    }
                    return gradient;
                }

                onPaint: {
                    var ctx = getContext("2d");
                    ctx.reset();

                    // Define the gradient colors for the filled arc
                    var gradientColors = [
                                "#AAFFFF",// Start color
                                "#AAFFFF",    // End color
                            ];

                    // Calculate the start and end angles for the filled arc
                    var startAngle = valueToAngle(gauge.minimumValue) - 90;
                    var endAngle = valueToAngle(250) - 90;

                    // Create a linear gradient
                    var gradient = createLinearGradient(ctx, { x: 0, y: 0 }, { x: outerRadius * 2, y: 0 }, gradientColors);

                    // Loop through the gradient colors and fill the arc segment with each color
                    for (var i = 0; i < gradientColors.length; i++) {
                        var gradientColor = gradientColors[i];
                        var angle = startAngle + (endAngle - startAngle) * (i / (gradientColors.length - 1));

                        ctx.beginPath();
                        ctx.lineWidth = 1.2;
                        ctx.strokeStyle = gradient;
                        ctx.arc(outerRadius,
                                outerRadius,
                                outerRadius - 45,
                                degreesToRadians(angle),
                                degreesToRadians(endAngle));
                        ctx.stroke();
                    }
                }
            }

            Canvas {
                property int value: gauge.value

                anchors.fill: parent
                Component.onCompleted: requestPaint()

                function degreesToRadians(degrees) {
                    return degrees * (Math.PI / 180);
                }

                function createLinearGradient(ctx, start, end, colors) {
                    var gradient = ctx.createLinearGradient(start.x, start.y, end.x, end.y);
                    for (var i = 0; i < colors.length; i++) {
                        gradient.addColorStop(i / (colors.length - 1), colors[i]);
                    }
                    return gradient;
                }

                onPaint: {
                    var ctx = getContext("2d");
                    ctx.reset();

                    // Define the gradient colors for the filled arc
                    var gradientColors = [
                                "#163546",// Start color
                                "#163546",    // End color
                            ];

                    // Calculate the start and end angles for the filled arc
                    var startAngle = valueToAngle(gauge.minimumValue) - 90;
                    var endAngle = valueToAngle(250) - 90;

                    // Create a linear gradient
                    var gradient = createLinearGradient(ctx, { x: 0, y: 0 }, { x: outerRadius * 2, y: 0 }, gradientColors);

                    // Loop through the gradient colors and fill the arc segment with each color
                    for (var i = 0; i < gradientColors.length; i++) {
                        var gradientColor = gradientColors[i];
                        var angle = startAngle + (endAngle - startAngle) * (i / (gradientColors.length - 1));

                        ctx.beginPath();
                        ctx.lineWidth = outerRadius * 0.12;
                        ctx.strokeStyle = gradient;
                        ctx.arc(outerRadius,
                                outerRadius,
                                outerRadius - 60,
                                degreesToRadians(angle),
                                degreesToRadians(endAngle));
                        ctx.stroke();
                    }
                }
            }


            Canvas {
                property int value: gauge.value

                anchors.fill: parent
                onValueChanged: requestPaint()

                function degreesToRadians(degrees) {
                    return degrees * (Math.PI / 180);
                }

                function createLinearGradient(ctx, start, end, colors) {
                    var gradient = ctx.createLinearGradient(start.x, start.y, end.x, end.y);
                    for (var i = 0; i < colors.length; i++) {
                        gradient.addColorStop(i / (colors.length - 1), colors[i]);
                    }
                    return gradient;
                }

                onPaint: {
                    var ctx = getContext("2d");
                    ctx.reset();

                    // Define the gradient colors for the filled arc
                    var gradientColors = [
                                "#6369FF",// Start color
                                "#63FFFF",    // End color
                                "#FFFF00",
                                "#FF0000"
                            ];

                    // Calculate the start and end angles for the filled arc
                    var startAngle = valueToAngle(gauge.minimumValue) - 90;
                    var endAngle = valueToAngle(gauge.value) - 90;

                    // Create a linear gradient
                    var gradient = createLinearGradient(ctx, { x: 0, y: 0 }, { x: outerRadius * 2, y: 0 }, gradientColors);

                    // Loop through the gradient colors and fill the arc segment with each color
                    for (var i = 0; i < gradientColors.length; i++) {
                        var gradientColor = gradientColors[i];
                        var angle = startAngle + (endAngle - startAngle) * (i / (gradientColors.length - 1));

                        ctx.beginPath();
                        ctx.lineWidth = outerRadius * 0.12;
                        ctx.strokeStyle = gradient;
                        ctx.arc(outerRadius,
                                outerRadius,
                                outerRadius - 60,
                                degreesToRadians(angle),
                                degreesToRadians(endAngle));
                        ctx.stroke();
                    }
                }
            }

        }


        needle: Item {
            y: -outerRadius * 0.70
            height: outerRadius * 0.02
            Image {
                id: needle
                source: "qrc:/img/Rectangle 4.svg"
                width: height * 0.06
                asynchronous: true
                antialiasing: true
            }

            Glow {
              anchors.fill: needle
              radius: 4
              samples: 8
              color: "white"
              source: needle
          }
        }

        foreground: Item {
            anchors.centerIn: parent
            Image{
                anchors.centerIn: parent
                source: "qrc:/img/Ellipse 1.svg"
                sourceSize: Qt.size(100,100)

                Image {
                    sourceSize: Qt.size(70,70)
                    anchors.centerIn: parent
                    source: "qrc:/img/Subtract.svg"

                    Image {
                        z:2
                        sourceSize: Qt.size(50,50)
                        anchors.centerIn: parent
                        source: "qrc:/img/Ellipse 6.svg"


//                        ColumnLayout{
//                            anchors.centerIn: parent
//                            Label{
//                                text: gauge.value.toFixed(0)
//                                font.pixelSize: 45
//                                font.family: "Inter"
//                                color: "#FFFFFF"
//                                font.bold: Font.DemiBold
//                                Layout.alignment: Qt.AlignHCenter
//                            }

//                            Label{
//                                text: "km/h"
//                                font.pixelSize: 12
//                                font.family: "Inter"
//                                color: "#FFFFFF"
//                                opacity: 0.4
//                                font.bold: Font.Normal
//                                Layout.alignment: Qt.AlignHCenter
//                            }
//                        }
                    }
                }
            }
        }

        tickmarkLabel:  Text {
            visible: false
            font.pixelSize: Math.max(6, outerRadius * 0.05)
            text: styleData.value
            color: styleData.value <= gauge.value ? "white" : "#777776"
            antialiasing: true
        }

        tickmark:Rectangle {
            implicitWidth: outerRadius * 0.008
            implicitHeight: outerRadius * 0.04

            antialiasing: true
            smooth: true
            color: styleData.value <= gauge.value ? "white" : "darkGray"
        }
        minorTickmark: Rectangle {
            implicitWidth: outerRadius * 0.008
            implicitHeight: outerRadius * 0.04

            antialiasing: true
            smooth: true
            color: styleData.value <= gauge.value ? "white" : "darkGray"
        }
    }
}
