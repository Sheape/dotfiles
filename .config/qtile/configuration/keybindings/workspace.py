from libqtile.lazy import lazy
from libqtile.config import Key

from configuration.keybindings.mod import Keys


class Workspace:
    keys = [
        # CATEGORY: Workspace
        Key([Keys.Modifier.mod_key],
            '1',
            lazy.group['1'].toscreen(toggle=False),
            desc="Switch to Workspace 1"),

        Key([Keys.Modifier.mod_key],
            '2',
            lazy.group['2'].toscreen(toggle=False),
            desc="Switch to Workspace 2"),

        Key([Keys.Modifier.mod_key],
            '3',
            lazy.group['3'].toscreen(toggle=False),
            desc="Switch to Workspace 3"),

        Key([Keys.Modifier.mod_key], '4', lazy.group['4'].toscreen(toggle=False),
            desc="Switch to Workspace 4"),
        Key([Keys.Modifier.mod_key], '5', lazy.group['5'].toscreen(toggle=False),
            desc="Switch to Workspace 5"),
        Key([Keys.Modifier.mod_key], '6', lazy.group['6'].toscreen(toggle=False),
            desc="Switch to Workspace 6"),
        Key([Keys.Modifier.mod_key], '7', lazy.group['7'].toscreen(toggle=False),
            desc="Switch to Workspace 7"),
        Key([Keys.Modifier.mod_key], '8', lazy.group['8'].toscreen(toggle=False),
            desc="Switch to Workspace 8"),
        Key([Keys.Modifier.mod_key], '9', lazy.group['9'].toscreen(toggle=False),
            desc="Switch to Workspace 9"),
    
        ## Sending a window to another workspace

        Key([Keys.Modifier.mod_key, Keys.Modifier.shift_key],
            '1',
            lazy.window.togroup("1", switch_group=True),
            desc="Send the focused window to Workspace 1"),
        
        Key([Keys.Modifier.mod_key, Keys.Modifier.shift_key],
            '2',
            lazy.window.togroup("2", switch_group=True),
            desc="Send the focused window to Workspace 2"),

        Key([Keys.Modifier.mod_key, Keys.Modifier.shift_key],
            '3',
            lazy.window.togroup("3", switch_group=True),
            desc="Send the focused window to Workspace 3"),

        Key([Keys.Modifier.mod_key, Keys.Modifier.shift_key],
            '4',
            lazy.window.togroup("4", switch_group=True),
            desc="Send the focused window to Workspace 4"),

        Key([Keys.Modifier.mod_key, Keys.Modifier.shift_key],
            '5',
            lazy.window.togroup("5", switch_group=True),
            desc="Send the focused window to Workspace 5"),

        Key([Keys.Modifier.mod_key, Keys.Modifier.shift_key],
            '6',
            lazy.window.togroup("6", switch_group=True),
            desc="Send the focused window to Workspace 6"),

        Key([Keys.Modifier.mod_key, Keys.Modifier.shift_key],
            '7',
            lazy.window.togroup("7", switch_group=True),
            desc="Send the focused window to Workspace 7"),

        Key([Keys.Modifier.mod_key, Keys.Modifier.shift_key],
            '8',
            lazy.window.togroup("8", switch_group=True),
            desc="Send the focused window to Workspace 8"),

        Key([Keys.Modifier.mod_key, Keys.Modifier.shift_key],
            '9',
            lazy.window.togroup("9", switch_group=True),
            desc="Send the focused window to Workspace 9")
    ]
