from libqtile.lazy import lazy
from libqtile.config import Key

from configuration.keybindings.mod import Keys


class System:
    keys = [
        # CATEGORY: System
        Key([Keys.Modifier.mod_key,
             Keys.Modifier.control_key],
            "r",
            lazy.restart(), desc="Restart Qtile"),

        Key([Keys.Modifier.mod_key,
             Keys.Modifier.control_key],
            'q',
            lazy.shutdown(), desc="Shutdown Qtile")
    ]
