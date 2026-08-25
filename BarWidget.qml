import QtQuick
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "soprano.quotes"

  implicitWidth: glyph.implicitWidth
  implicitHeight: glyph.implicitHeight

  function toggleSoprano() {
    if (!root.bar) return
    if (typeof root.bar.run === "function") {
      root.bar.run("omarchy-shell shell toggle soprano.quotes")
      return
    }
    if (root.bar.shell && typeof root.bar.shell.toggle === "function")
      root.bar.shell.toggle("soprano.quotes", "{}")
  }

  BarIconButton {
    id: glyph
    anchors.fill: parent
    bar: root.bar
    text: "S"
    tooltipText: "Soprano"
    onPressed: function (mouseButton) {
      root.toggleSoprano()
    }
  }
}
