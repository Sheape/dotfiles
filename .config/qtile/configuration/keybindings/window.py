from libqtile.lazy import lazy
from libqtile.config import Key

from configuration.keybindings.mod import Keys


class Window:
    keys = [
        # CATEGORY: Window Management
        Key([Keys.Modifier.mod_key],
            Keys.Vim.left,
            lazy.layout.left(),
            desc="Move focus to the left window"),

        Key([Keys.Modifier.mod_key],
            Keys.Vim.right,
            lazy.layout.right(),
            desc="Move focus to the right window"),

        Key([Keys.Modifier.mod_key],
            Keys.Vim.down,
            lazy.layout.down(),
            desc="Move focus to the bottom window"),

        Key([Keys.Modifier.mod_key],
            Keys.Vim.up,
            lazy.layout.up(),
            desc="Move focus to the upper window"),

        Key([Keys.Modifier.mod_key],
            Keys.Modifier.tab,
            lazy.group.next_window(),
            desc="Move focus to the next window"),

        Key([Keys.Modifier.mod_key,
             Keys.Modifier.shift_key],
            Keys.Modifier.tab,
            lazy.group.prev_window(),
            desc="Move focus to the previous window"),

        Key([Keys.Modifier.mod_key,
             Keys.Modifier.shift_key],
            Keys.Vim.left,
            lazy.layout.shuffle_left(),
            desc="Move the window to the left"),

        Key([Keys.Modifier.mod_key,
             Keys.Modifier.shift_key],
            Keys.Vim.right,
            lazy.layout.shuffle_right(),
            desc="Move the window to the right"),

        Key([Keys.Modifier.mod_key,
             Keys.Modifier.shift_key],
            Keys.Vim.down,
            lazy.layout.shuffle_down(),
            desc="Move the window down"),

        Key([Keys.Modifier.mod_key,
             Keys.Modifier.shift_key],
            Keys.Vim.up,
            lazy.layout.shuffle_up(),
            desc="Move the window up"),

        Key([Keys.Modifier.mod_key],
            'q',
            lazy.window.kill(),
            desc="Kill focused window"),

        Key([Keys.Modifier.mod_key,
             Keys.Modifier.control_key],
            Keys.Vim.left,
            lazy.layout.grow_left(),
            desc="Expand the window to the left"),

        Key([Keys.Modifier.mod_key,
             Keys.Modifier.control_key],
            Keys.Vim.right,
            lazy.layout.grow_right(),
            desc="Expand the window to the right"),

        Key([Keys.Modifier.mod_key,
             Keys.Modifier.control_key],
            Keys.Vim.down,
            lazy.layout.grow_down(),
            desc="Expand the window to bottom"),

        Key([Keys.Modifier.mod_key,
             Keys.Modifier.control_key],
            Keys.Vim.up,
            lazy.layout.grow_up(),
            desc="Expand the window to top"),

        Key([Keys.Modifier.mod_key],
            'j',
            lazy.layout.normalize(),
            desc="Reset all window sizes"),

        Key([Keys.Modifier.mod_key],
            'k',
            lazy.layout.maximize(),
            desc="Maximize the focused window"),

        Key([Keys.Modifier.mod_key, Keys.Modifier.shift_key],
            Keys.Modifier.space_key,
            lazy.layout.flip(),
            desc="Flip the layout of master and stack"),

        Key([Keys.Modifier.mod_key],
            'f',
            lazy.window.toggle_fullscreen(),
            desc="Toggle fullscreen on the focused window"),

        Key([Keys.Modifier.mod_key,
             Keys.Modifier.shift_key],
            'f',
            lazy.window.toggle_floating(),
            desc="Toggle floating mode on the focused window")
]
