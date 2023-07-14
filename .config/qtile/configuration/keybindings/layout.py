from libqtile.lazy import lazy
from libqtile.config import Key

from configuration.keybindings.mod import Keys


class Layout:
    # CATEGORY: Layout
    keys = [
        Key([Keys.Modifier.mod_key],
            Keys.Modifier.space_key,
            lazy.next_layout(),
            desc="Switch to the next layout."),

        Key([Keys.Modifier.mod_key,
             Keys.Modifier.shift_key],
            Keys.Modifier.enter,
            lazy.layout.toggle_split(),
            desc="Toggle between split and unsplit sides of stack"),
    ]
