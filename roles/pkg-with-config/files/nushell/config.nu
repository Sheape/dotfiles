# config.nu
#
# Installed by:
# version = "0.105.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

# See https://github.com/nushell/nushell/issues/7941
open /etc/locale.conf
| lines
| parse "{name}={value}"
| str trim value --char '"'
| transpose --header-row --as-record
| load-env

use alias *
source ./environment/mod.nu
source ./theme/mod.nu
source ./integrations/mod.nu
