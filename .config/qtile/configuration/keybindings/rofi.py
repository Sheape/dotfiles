from libqtile.lazy import lazy
from libqtile.config import KeyChord, Key

from configuration.keybindings.mod import Keys


class Rofi:
    keys = [
        # Keychod is like using emacs with leader key, etc. 
        KeyChord([Keys.Modifier.mod_key], 'r', [
            Key([], 'r',
                lazy.spawn("rofi -show run -display-run ' '"),
                desc = "Rofi Run"
                ),
            Key([], 'e',
                lazy.spawn("rofi -modi 'emoji:rofimoji' -show emoji"),
                desc = "Rofi Emoji"
                ),
        ])
    ]
