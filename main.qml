import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3

ApplicationWindow {
    id:root
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    header:  ToolBar {
        Row {
            anchors {
                fill: parent
            }
            spacing: width*0.02
            Item {
                width: parent.spacing; height: parent.height
            }
            Button {
                text: "Add";
                onClicked: {
                    patternListModel.append({
                                                "top":0,
                                                "mid":0,
                                                "bot":0
                                            })
                }
            }
            Button {
                text: "Generate";
                onClicked: {
                    for(var i = 0; i < patternListModel.count; i++) {
                        var obj = patternListModel.get(i);
                        var sum = obj.topV*1 + obj.midV*4 + obj.botV*9

                        /*
                         *
                         * 0 = TOP_MID
                         * 1 = MID_BOT
                         * 2 = TOP
                         * 3 = BOT
                         * 4 = MID_1
                         * 5 = MID_2
                         * 6 = BLANK
                         *
                         */

                        switch(sum) {
                        case 0:
                            console.log("6,6,")
                            break
                        case 1:
                            console.log("2,6,")
                            break
                        case 4:
                            console.log("4,5,")
                            break
                        case 5:
                            console.log("0,5,")
                            break
                        case 9:
                            console.log("6,3,")
                            break
                        case 10:
                            console.log("2,3,")
                            break
                        case 13:
                            console.log("4,1,")
                            break
                        case 14:
                            console.log("0,1,")
                            break
                        }
                    }
                }
            }
        }
    }

    ListView {
        id:patternList
        anchors.fill: parent

        model:ListModel {
            id:patternListModel
            ListElement {
                topV:0
                midV:0
                botV:0
            }
        }

        delegate: Rectangle {
            width:parent.width; height: root.height/8
            color: Material.accent
            Row {
                height: parent.height*0.9; width: parent.width*0.9
                anchors.centerIn: parent
                spacing: parent.width*0.05
                Rectangle {
                    width: (parent.width/3) - parent.spacing
                    height: parent.height
                    color: (botV === 0) ? "White" : "Black"
                    radius: parent.width*0.03
                    MouseArea {
                        anchors.fill: parent
                        onClicked: botV = (botV === 0) ? 1 : 0;
                    }
                }
                Rectangle {
                    width: (parent.width/3) - parent.spacing
                    height: parent.height
                    color: (midV === 0) ? "White" : "Black"
                    radius: parent.width*0.03
                    MouseArea {
                        anchors.fill: parent
                        onClicked: midV = (midV === 0) ? 1 : 0;
                    }
                }
                Rectangle {
                    width: (parent.width/3) - parent.spacing
                    height: parent.height
                    color: (topV === 0) ? "White" : "Black"
                    radius: parent.width*0.03
                    MouseArea {
                        anchors.fill: parent
                        onClicked: topV = (topV === 0) ? 1 : 0;
                    }
                }
            }
        }
    }
}
