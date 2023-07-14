from libqtile.lazy import lazy
from libqtile.config import Key, KeyChord

from configuration.keybindings.mod import Keys

class Apps:
    keys = [
            Key([Keys.Modifier.mod_key],
                'b',
                lazy.spawn('brave'),
                desc="Launch Default browser"),

            Key([Keys.Modifier.mod_key],
                'p',
                lazy.spawn('pomotroid'),
                desc="Launch pomotroid"),

            Key([Keys.Modifier.mod_key],
                'd',
                lazy.spawn('sh -c "$HOME/.bin/toggle-dashboard"'),
                desc="Toggle dashboard"),

            ## Emacs Related stuff
            KeyChord([Keys.Modifier.mod_key], 'g', [ 
               Key([], 'g',
                lazy.spawn('emacsclient -c'),
                desc="Launch emacs as a client"),

               Key([], 't',
                lazy.spawn('emacsclient -c --eval "(dired nil)"'),
                desc="Launch emacs with dired"),
               
               Key([], 'a',
                lazy.spawn('emacsclient -c --eval "(org-agenda-list)"'),
                desc="Launch emacs with org-agenda listed in week mode."),
               
               Key([], 'j',
                lazy.spawn('emacsclient -c --eval "(org-journal-new-entry 1)"'),
                desc="Launch emacs creating a new journal entry with org-journal"),
               ]),

            # Key([Keys.Modifier.mod_key],
            #     'm',
            #     lazy.spawn(),
            #     desc="Toggle music player"),

            # Key([Keys.Modifier.mod_key],
            #     'd',
            #     lazy.spawn(),
            #     desc="Toggle Date"),
            ]
