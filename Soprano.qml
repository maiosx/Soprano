pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Controls
import qs.Commons
import qs.Ui
import "js/quotes.js" as Quotes

Item {
  id: root

  property var shell: null
  property var manifest: null
  property bool opened: false
  property string filter: "All"
  property int quoteIndex: 0
  property var current: Quotes.at(0, "All")
  property real quoteOpacity: 1
  property int pendingIndex: 0

  readonly property color bg: "#070707"
  readonly property color fg: "#efe6d2"
  readonly property color muted: "#8c8274"
  readonly property color subtle: "#5c564c"
  readonly property color surface: "#141410"
  readonly property color pill: "#efe6d2"
  readonly property color pillFg: "#070707"

  ListModel { id: characterModel }

  function rebuildCharacters() {
    characterModel.clear()
    var list = Quotes.characters()
    for (var i = 0; i < list.length; i++)
      characterModel.append({ shortName: list[i].short })
  }

  function applyQuote(index) {
    root.quoteIndex = index
    root.current = Quotes.at(index, root.filter)
    root.quoteOpacity = 1
  }

  function showNext() {
    if (swapTimer.running) return
    root.pendingIndex = Quotes.nextIndex(root.quoteIndex, root.filter)
    root.quoteOpacity = 0
    swapTimer.restart()
  }

  function setFilter(name) {
    if (root.filter === name) {
      showNext()
      return
    }
    root.filter = name
    root.pendingIndex = 0
    root.quoteOpacity = 0
    swapTimer.restart()
  }

  function open(payloadJson) {
    root.opened = true
    if (!characterModel.count) rebuildCharacters()
    Qt.callLater(function () { keyCatcher.forceActiveFocus() })
  }

  function close() { root.opened = false }

  function dismiss() {
    root.opened = false
    if (root.shell && typeof root.shell.hide === "function")
      root.shell.hide((root.manifest && root.manifest.id) || "soprano.quotes")
  }

  function toggle() {
    if (root.opened) root.dismiss()
    else root.open("{}")
  }

  Component.onCompleted: rebuildCharacters()

  Timer {
    id: swapTimer
    interval: 160
    repeat: false
    onTriggered: root.applyQuote(root.pendingIndex)
  }

  IpcHandler {
    target: "soprano"
    function toggle(): void { root.toggle() }
    function open(): void { root.open("{}") }
    function close(): void { root.dismiss() }
    function status(): string { return root.opened ? "open" : "closed" }
  }

  PanelWindow {
    id: panel
    visible: root.opened
    anchors { top: true; bottom: true; left: true; right: true }
    color: "#070707"
    exclusionMode: ExclusionMode.Ignore
    WlrLayershell.namespace: "soprano-quotes"
    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

    Item {
      id: keyCatcher
      anchors.fill: parent
      focus: true
      Keys.priority: Keys.BeforeItem
      Keys.onPressed: function (event) {
        if (event.key === Qt.Key_Escape) {
          root.dismiss()
          event.accepted = true
          return
        }
        if (event.key === Qt.Key_Space || event.key === Qt.Key_Return || event.key === Qt.Key_Right) {
          root.showNext()
          event.accepted = true
        }
      }

      Rectangle {
        anchors.fill: parent
        color: root.bg
      }

      MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: root.showNext()
      }

      Item {
        id: stage
        width: Math.min(parent.width, 640)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.bottom: tabs.top

        Text {
          anchors.horizontalCenter: parent.horizontalCenter
          anchors.verticalCenter: parent.verticalCenter
          anchors.verticalCenterOffset: -24
          text: "S"
          color: "#efe6d2"
          opacity: 0.05
          font.pixelSize: Math.min(stage.width * 0.72, 280)
          font.family: "serif"
          textFormat: Text.PlainText
        }

        Column {
          id: header
          width: parent.width
          topPadding: 22
          leftPadding: 24
          rightPadding: 24

          Item {
            width: parent.width - 48
            height: 28
            Text {
              text: "SOPRANO"
              color: root.muted
              font.pixelSize: 11
              font.letterSpacing: 3
              font.weight: Font.Medium
              textFormat: Text.PlainText
              anchors.left: parent.left
              anchors.verticalCenter: parent.verticalCenter
            }
            Text {
              text: Quotes.count(root.filter) + " lines"
              color: root.subtle
              font.pixelSize: 11
              font.letterSpacing: 1
              textFormat: Text.PlainText
              anchors.right: parent.right
              anchors.verticalCenter: parent.verticalCenter
            }
          }
        }

        Column {
          id: quoteBlock
          width: parent.width - 48
          anchors.centerIn: parent
          spacing: 28
          opacity: root.quoteOpacity
          Behavior on opacity { NumberAnimation { duration: 180; easing.type: Easing.OutCubic } }

          Text {
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            text: "“" + (root.current && root.current.text ? root.current.text : "") + "”"
            color: root.fg
            font.pixelSize: 32
            font.family: "serif"
            font.italic: true
            lineHeight: 1.25
            textFormat: Text.PlainText
          }

          Column {
            width: parent.width
            spacing: 6
            Text {
              width: parent.width
              horizontalAlignment: Text.AlignHCenter
              text: root.current && root.current.character ? root.current.character : ""
              color: root.fg
              font.pixelSize: 14
              font.weight: Font.Medium
              textFormat: Text.PlainText
            }
            Text {
              width: parent.width
              horizontalAlignment: Text.AlignHCenter
              visible: !!(root.current && root.current.episode)
              text: root.current && root.current.episode ? root.current.episode : ""
              color: root.muted
              font.pixelSize: 12
              textFormat: Text.PlainText
            }
          }
        }

        Text {
          anchors.horizontalCenter: parent.horizontalCenter
          anchors.bottom: parent.bottom
          anchors.bottomMargin: 10
          text: "Click for another · Esc to close"
          color: root.subtle
          font.pixelSize: 12
          textFormat: Text.PlainText
        }
      }

      Item {
        id: tabs
        width: parent.width
        height: 56
        anchors.bottom: parent.bottom

        MouseArea {
          anchors.fill: parent
          onClicked: function (mouse) { mouse.accepted = true }
        }

        Row {
          id: pillRow
          anchors.horizontalCenter: parent.horizontalCenter
          anchors.verticalCenter: parent.verticalCenter
          spacing: 6

          Repeater {
            model: characterModel
            delegate: Item {
              id: pillWrap
              required property string shortName
              height: 36
              width: pillBox.width

              Rectangle {
                id: pillBox
                height: 36
                width: Math.max(52, pillLabel.implicitWidth + 28)
                radius: 18
                color: root.filter === pillWrap.shortName ? root.pill : "transparent"
                anchors.verticalCenter: parent.verticalCenter

                Text {
                  id: pillLabel
                  anchors.centerIn: parent
                  text: pillWrap.shortName
                  color: root.filter === pillWrap.shortName ? root.pillFg : root.muted
                  font.pixelSize: 14
                  font.weight: Font.Medium
                  textFormat: Text.PlainText
                }
                MouseArea {
                  anchors.fill: parent
                  cursorShape: Qt.PointingHandCursor
                  onClicked: root.setFilter(pillWrap.shortName)
                }
              }
            }
          }
        }
      }
    }
  }
}
