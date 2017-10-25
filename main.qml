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
            width:parent.width; height: root.height/4
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
