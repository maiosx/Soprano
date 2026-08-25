# Soprano

A fullscreen Omarchy overlay of quotes from The Sopranos. Click anywhere for another line. Escape dismisses. The bar widget is an **S**.

Built from the same overlay template as Runway: `WlrLayer.Overlay`, exclusive keyboard focus, `keepLoaded`, bar-widget toggle.

## Install

```bash
omarchy plugin add https://github.com/maiosx/Soprano.git --enable --yes
```

For a local checkout:

```bash
plugin_dir="$HOME/.config/omarchy/plugins/soprano.quotes"
mkdir -p "$(dirname "$plugin_dir")"
ln -s "$PWD" "$plugin_dir"
omarchy-shell shell rescanPlugins
omarchy plugin enable soprano.quotes
```

Enable the **Soprano** bar widget from Setup → Bar if it does not appear on the right side.

## Use

- Click **S** in the bar to open or close the overlay.
- Click anywhere on the overlay — or Space / Enter / → — for a new quote.
- Tap a name along the bottom to hear only that character.
- Escape dismisses.

IPC:

```bash
omarchy-shell shell toggle soprano.quotes
omarchy-shell soprano toggle|open|close|status
```

The plugin targets Omarchy Quattro and uses only Qt Quick and Quickshell components already present in Omarchy. It does not install packages, write config, or run background executables. Quotes live in `js/quotes.js`.

## Remove

```bash
omarchy plugin disable soprano.quotes
omarchy plugin remove soprano.quotes --yes
```
