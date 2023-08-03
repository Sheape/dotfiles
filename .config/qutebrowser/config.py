import catppuccin

config.load_autoconfig(True)

c.aliases = {
            'source': 'config-source',
            'las': 'open -t https://drive.google.com/drive/folders/1zBBg_fpdd5ETXTpz5ikK5WMUQgV1ALbX',
            'cmath': 'open -t https://classroom.google.com/c/Mzg4NTA5MzAxNzQ0',
            'cres': 'open -t https://classroom.google.com/c/MzkzMjA2Njg3MDY1',
            'ceng': 'open -t https://classroom.google.com/c/MzkyMTU5MTY1NTEx',
            'cesp': 'open -t https://classroom.google.com/c/MzkzODc5Njk5MTI4',
            'cfili': 'open -t https://classroom.google.com/c/Mzg4NTI2ODQwMTY4',
            'cap': 'open -t https://classroom.google.com/c/MzkyOTY2MDI0ODUz',
            'celec': 'open -t https://classroom.google.com/c/Mzg5NjEwMjcwODQw',
            'cmapeh': 'open -t https://classroom.google.com/c/MzkzODI4MTQyMjg1',
            'csci': 'open -t https://classroom.google.com/c/Mzg4NDg0NzMwODc5',
}

c.url.searchengines = {'DEFAULT': 'https://searx.tiekoetter.com/search?q={}',
                       'g': 'https://wiki.gentoo.org/?search={}',
                       'pkg-gentoo': 'https://packages.gentoo.org/packages/search?q={}',
                       'pkg': 'https://github.com/search?q=repo%3Avoid-linux%2Fvoid-packages%20{}&type=code',
                       'yt': 'https://youtube.com/results?search_query={}',
                       'lay': 'https://gpo.zugaina.org/Search?search={}',
                       'a': 'https://wiki.archlinux.org/?search={}',
                       'w': 'https://en.wikipedia.org/w/index.php?search={}&title=Special%3ASearch&ns0=1',
                       'gh': 'https://github.com/{}'
                       }

# Default font
monospace = "JetBrains Mono Nerd Font"

c.statusbar.position = 'top'
c.tabs.position = 'bottom'
c.statusbar.padding = { 'bottom': 4, 'left': 0, 'right': 0, 'top': 4 }


config.bind('ts', 'config-cycle -t tabs.show always never ;; config-cycle -t statusbar.show always never')

c.bindings.default = {}

# Workman-specific for following hints.
c.hints.chars = 'ashtgyneoi'

# Catppuccin colorscheme
catppuccin.setup(c, 'mocha', True)

# Workman bindings for qutebrowser
## Bindings for normal mode
config.bind("'", 'mode-enter jump_mark')
config.bind('+', 'zoom-in')
config.bind('-', 'zoom-out')
config.bind('.', 'repeat-command')
config.bind('/', 'set-cmd-text /')
config.bind(':', 'set-cmd-text :')
config.bind(';I', 'hint images tab')
config.bind(';O', 'hint links fill :open -t -r {hint-url}')
config.bind(';R', 'hint --rapid links window')
config.bind(';Y', 'hint links yank-primary')
config.bind(';b', 'hint all tab-bg')
config.bind(';d', 'hint links download')
config.bind(';f', 'hint all tab-fg')
config.bind(';h', 'hint all hover')
config.bind(';i', 'hint images')
config.bind(';o', 'hint links fill :open {hint-url}')
config.bind(';r', 'hint --rapid links tab-bg')
config.bind(';t', 'hint inputs')
config.bind(';y', 'hint links yank')
config.bind('<Alt-1>', 'tab-focus 1')
config.bind('<Alt-2>', 'tab-focus 2')
config.bind('<Alt-3>', 'tab-focus 3')
config.bind('<Alt-4>', 'tab-focus 4')
config.bind('<Alt-5>', 'tab-focus 5')
config.bind('<Alt-6>', 'tab-focus 6')
config.bind('<Alt-7>', 'tab-focus 7')
config.bind('<Alt-8>', 'tab-focus 8')
config.bind('<Alt-9>', 'tab-focus -1')
config.bind('<Alt-m>', 'tab-mute')
config.bind('<Ctrl-A>', 'navigate increment')
config.bind('<Ctrl-Alt-p>', 'print')
config.bind('<Ctrl-B>', 'scroll-page 0 -1')
config.bind('<Ctrl-D>', 'scroll-page 0 0.5')
config.bind('<Ctrl-F5>', 'reload -f')
config.bind('<Ctrl-F>', 'scroll-page 0 1')
config.bind('<Ctrl-N>', 'open -w')
config.bind('<Ctrl-PgDown>', 'tab-next')
config.bind('<Ctrl-PgUp>', 'tab-prev')
config.bind('<Ctrl-Q>', 'quit')
config.bind('<Ctrl-Return>', 'selection-follow -t')
config.bind('<Ctrl-Shift-N>', 'open -p')
config.bind('<Ctrl-Shift-T>', 'undo')
config.bind('<Ctrl-Shift-Tab>', 'nop')
config.bind('<Ctrl-Shift-W>', 'close')
config.bind('<Ctrl-T>', 'open -t')
config.bind('<Ctrl-Tab>', 'tab-focus last')
config.bind('<Ctrl-U>', 'scroll-page 0 -0.5')
config.bind('<Ctrl-V>', 'mode-enter passthrough')
config.bind('<Ctrl-W>', 'tab-close')
config.bind('<Ctrl-X>', 'navigate decrement')
config.bind('<Ctrl-^>', 'tab-focus last')
config.bind('<Ctrl-h>', 'home')
config.bind('<Ctrl-p>', 'tab-pin')
config.bind('<Ctrl-s>', 'stop')
config.bind('<Escape>', 'clear-keychain ;; search ;; fullscreen --leave')
config.bind('<F11>', 'fullscreen')
config.bind('<F5>', 'reload')
config.bind('<Return>', 'selection-follow')
config.bind('<back>', 'back')
config.bind('<forward>', 'forward')
config.bind('=', 'zoom')
config.bind('?', 'set-cmd-text ?')
config.bind('@', 'macro-run')
config.bind('B', 'set-cmd-text -s :quickmark-load -t')
config.bind('D', 'tab-close -o')
config.bind('F', 'hint all tab')
config.bind('G', 'scroll-to-perc')
config.bind('Y', 'back')
config.bind('E', 'tab-next')
config.bind('N', 'tab-prev')
config.bind('O', 'forward')
config.bind('M', 'bookmark-add')
config.bind('K', 'search-prev')
config.bind('L', 'set-cmd-text -s :open -t')
config.bind('PP', 'open -t -- {primary}')
config.bind('Pp', 'open -t -- {clipboard}')
config.bind('R', 'reload -f')
config.bind('Sb', 'bookmark-list --jump')
config.bind('Sh', 'history')
config.bind('Sq', 'bookmark-list')
config.bind('Ss', 'set')
config.bind('T', 'set-cmd-text -sr :tab-focus')
config.bind('U', 'undo -w')
config.bind('V', 'mode-enter caret ;; selection-toggle --line')
config.bind('ZQ', 'quit')
config.bind('ZZ', 'quit --save')
config.bind('[[', 'navigate prev')
config.bind(']]', 'navigate next')
config.bind('`', 'mode-enter set_mark')
config.bind('ad', 'download-cancel')
config.bind('b', 'set-cmd-text -s :quickmark-load')
config.bind('cd', 'download-clear')
config.bind('co', 'tab-only')
config.bind('d', 'tab-close')
config.bind('f', 'hint')
config.bind('g$', 'tab-focus -1')
config.bind('g0', 'tab-focus 1')
config.bind('gB', 'set-cmd-text -s :bookmark-load -t')
config.bind('gC', 'tab-clone')
config.bind('gD', 'tab-give')
config.bind('gJ', 'tab-move +')
config.bind('gK', 'tab-move -')
config.bind('gO', 'set-cmd-text :open -t -r {url:pretty}')
config.bind('gU', 'navigate up -t')
config.bind('g^', 'tab-focus 1')
config.bind('ga', 'open -t')
config.bind('gb', 'set-cmd-text -s :bookmark-load')
config.bind('gd', 'download')
config.bind('gf', 'view-source')
config.bind('gg', 'scroll-to-perc 0')
config.bind('gi', 'hint inputs --first')
config.bind('gm', 'tab-move')
config.bind('go', 'set-cmd-text :open {url:pretty}')
config.bind('gt', 'set-cmd-text -s :tab-select')
config.bind('gu', 'navigate up')
config.bind('y', 'scroll left')
config.bind('i', 'mode-enter insert')
config.bind('n', 'scroll down')
config.bind('e', 'scroll up')
config.bind('o', 'scroll right')

# Open a video in mpv
config.bind('m', 'hint links spawn -d mpv {hint-url}')


config.bind('k', 'search-next')
config.bind('l', 'set-cmd-text -s :open')
config.bind('pP', 'open -- {primary}')
config.bind('pp', 'open -- {clipboard}')
config.bind('q', 'macro-record')
config.bind('r', 'reload')
config.bind('sf', 'save')
config.bind('sk', 'set-cmd-text -s :bind')
config.bind('sl', 'set-cmd-text -s :set -t')
config.bind('ss', 'set-cmd-text -s :set')
config.bind('tCH', 'config-cycle -p -u *://*.{url:host}/* content.cookies.accept all no-3rdparty never ;; reload')
config.bind('tCh', 'config-cycle -p -u *://{url:host}/* content.cookies.accept all no-3rdparty never ;; reload')
config.bind('tCu', 'config-cycle -p -u {url} content.cookies.accept all no-3rdparty never ;; reload')
config.bind('tIH', 'config-cycle -p -u *://*.{url:host}/* content.images ;; reload')
config.bind('tIh', 'config-cycle -p -u *://{url:host}/* content.images ;; reload')
config.bind('tIu', 'config-cycle -p -u {url} content.images ;; reload')
config.bind('tPH', 'config-cycle -p -u *://*.{url:host}/* content.plugins ;; reload')
config.bind('tPh', 'config-cycle -p -u *://{url:host}/* content.plugins ;; reload')
config.bind('tPu', 'config-cycle -p -u {url} content.plugins ;; reload')
config.bind('tSH', 'config-cycle -p -u *://*.{url:host}/* content.javascript.enabled ;; reload')
config.bind('tSh', 'config-cycle -p -u *://{url:host}/* content.javascript.enabled ;; reload')
config.bind('tSu', 'config-cycle -p -u {url} content.javascript.enabled ;; reload')
config.bind('tcH', 'config-cycle -p -t -u *://*.{url:host}/* content.cookies.accept all no-3rdparty never ;; reload')
config.bind('tch', 'config-cycle -p -t -u *://{url:host}/* content.cookies.accept all no-3rdparty never ;; reload')
config.bind('tcu', 'config-cycle -p -t -u {url} content.cookies.accept all no-3rdparty never ;; reload')
config.bind('th', 'back -t')
config.bind('tiH', 'config-cycle -p -t -u *://*.{url:host}/* content.images ;; reload')
config.bind('tih', 'config-cycle -p -t -u *://{url:host}/* content.images ;; reload')
config.bind('tiu', 'config-cycle -p -t -u {url} content.images ;; reload')
config.bind('tl', 'forward -t')
config.bind('tpH', 'config-cycle -p -t -u *://*.{url:host}/* content.plugins ;; reload')
config.bind('tph', 'config-cycle -p -t -u *://{url:host}/* content.plugins ;; reload')
config.bind('tpu', 'config-cycle -p -t -u {url} content.plugins ;; reload')
config.bind('tsH', 'config-cycle -p -t -u *://*.{url:host}/* content.javascript.enabled ;; reload')
config.bind('tsh', 'config-cycle -p -t -u *://{url:host}/* content.javascript.enabled ;; reload')
config.bind('tsu', 'config-cycle -p -t -u {url} content.javascript.enabled ;; reload')
config.bind('u', 'undo')
config.bind('v', 'mode-enter caret')
config.bind('wB', 'set-cmd-text -s :bookmark-load -w')
config.bind('wIf', 'devtools-focus')
config.bind('wIh', 'devtools left')
config.bind('wIj', 'devtools bottom')
config.bind('wIk', 'devtools top')
config.bind('wIl', 'devtools right')
config.bind('wIw', 'devtools window')
config.bind('wO', 'set-cmd-text :open -w {url:pretty}')
config.bind('wP', 'open -w -- {primary}')
config.bind('wb', 'set-cmd-text -s :quickmark-load -w')
config.bind('wf', 'hint all window')
config.bind('wh', 'back -w')
config.bind('wi', 'devtools')
config.bind('wl', 'forward -w')
config.bind('wo', 'set-cmd-text -s :open -w')
config.bind('wp', 'open -w -- {clipboard}')
config.bind('xO', 'set-cmd-text :open -b -r {url:pretty}')
config.bind('xo', 'set-cmd-text -s :open -b')
config.bind('jD', 'yank domain -s')
config.bind('jM', 'yank inline [{title}]({url}) -s')
config.bind('jP', 'yank pretty-url -s')
config.bind('jT', 'yank title -s')
config.bind('jY', 'yank -s')
config.bind('jd', 'yank domain')
config.bind('jm', 'yank inline [{title}]({url})')
config.bind('jp', 'yank pretty-url')
config.bind('jt', 'yank title')
config.bind('jj', 'yank')
config.bind('{{', 'navigate prev -t')
config.bind('}}', 'navigate next -t')

## Bindings for caret mode
config.bind('$', 'move-to-end-of-line', mode='caret')
config.bind('0', 'move-to-start-of-line', mode='caret')
config.bind('<Ctrl-Space>', 'selection-drop', mode='caret')
config.bind('<Escape>', 'mode-leave', mode='caret')
config.bind('<Return>', 'yank selection', mode='caret')
config.bind('<Space>', 'selection-toggle', mode='caret')
config.bind('G', 'move-to-end-of-document', mode='caret')
config.bind('H', 'scroll left', mode='caret')
config.bind('J', 'scroll down', mode='caret')
config.bind('K', 'scroll up', mode='caret')
config.bind('L', 'scroll right', mode='caret')
config.bind('V', 'selection-toggle --line', mode='caret')
config.bind('Y', 'yank selection -s', mode='caret')
config.bind('[', 'move-to-start-of-prev-block', mode='caret')
config.bind(']', 'move-to-start-of-next-block', mode='caret')
config.bind('b', 'move-to-prev-word', mode='caret')
config.bind('c', 'mode-enter normal', mode='caret')
config.bind('e', 'move-to-end-of-word', mode='caret')
config.bind('gg', 'move-to-start-of-document', mode='caret')
config.bind('h', 'move-to-prev-char', mode='caret')
config.bind('j', 'move-to-next-line', mode='caret')
config.bind('k', 'move-to-prev-line', mode='caret')
config.bind('l', 'move-to-next-char', mode='caret')
config.bind('o', 'selection-reverse', mode='caret')
config.bind('v', 'selection-toggle', mode='caret')
config.bind('w', 'move-to-next-word', mode='caret')
config.bind('y', 'yank selection', mode='caret')
config.bind('{', 'move-to-end-of-prev-block', mode='caret')
config.bind('}', 'move-to-end-of-next-block', mode='caret')

## Bindings for command mode
config.bind('<Alt-B>', 'rl-backward-word', mode='command')
config.bind('<Alt-Backspace>', 'rl-backward-kill-word', mode='command')
config.bind('<Alt-D>', 'rl-kill-word', mode='command')
config.bind('<Alt-F>', 'rl-forward-word', mode='command')
config.bind('<Ctrl-?>', 'rl-delete-char', mode='command')
config.bind('<Ctrl-A>', 'rl-beginning-of-line', mode='command')
config.bind('<Ctrl-B>', 'rl-backward-char', mode='command')
config.bind('<Ctrl-C>', 'completion-item-yank', mode='command')
config.bind('<Ctrl-D>', 'completion-item-del', mode='command')
config.bind('<Ctrl-E>', 'rl-end-of-line', mode='command')
config.bind('<Ctrl-F>', 'rl-forward-char', mode='command')
config.bind('<Ctrl-H>', 'rl-backward-delete-char', mode='command')
config.bind('<Ctrl-K>', 'rl-kill-line', mode='command')
config.bind('<Ctrl-N>', 'command-history-next', mode='command')
config.bind('<Ctrl-P>', 'command-history-prev', mode='command')
config.bind('<Ctrl-Return>', 'command-accept --rapid', mode='command')
config.bind('<Ctrl-Shift-C>', 'completion-item-yank --sel', mode='command')
config.bind('<Ctrl-Shift-Tab>', 'completion-item-focus prev-category', mode='command')
config.bind('<Ctrl-Tab>', 'completion-item-focus next-category', mode='command')
config.bind('<Ctrl-U>', 'rl-unix-line-discard', mode='command')
config.bind('<Ctrl-W>', 'rl-unix-word-rubout', mode='command')
config.bind('<Ctrl-Y>', 'rl-yank', mode='command')
config.bind('<Down>', 'completion-item-focus --history next', mode='command')
config.bind('<Escape>', 'mode-leave', mode='command')
config.bind('<PgDown>', 'completion-item-focus next-page', mode='command')
config.bind('<PgUp>', 'completion-item-focus prev-page', mode='command')
config.bind('<Return>', 'command-accept', mode='command')
config.bind('<Shift-Delete>', 'completion-item-del', mode='command')
config.bind('<Shift-Tab>', 'completion-item-focus prev', mode='command')
config.bind('<Tab>', 'completion-item-focus next', mode='command')
config.bind('<Up>', 'completion-item-focus --history prev', mode='command')

## Bindings for hint mode
config.bind('<Ctrl-B>', 'hint all tab-bg', mode='hint')
config.bind('<Ctrl-F>', 'hint links', mode='hint')
config.bind('<Ctrl-R>', 'hint --rapid links tab-bg', mode='hint')
config.bind('<Escape>', 'mode-leave', mode='hint')
config.bind('<Return>', 'hint-follow', mode='hint')

## Bindings for insert mode
config.bind('<Ctrl-E>', 'edit-text', mode='insert')
config.bind('<Escape>', 'mode-leave', mode='insert')
config.bind('<Shift-Escape>', 'fake-key <Escape>', mode='insert')
config.bind('<Shift-Ins>', 'insert-text -- {primary}', mode='insert')

## Bindings for passthrough mode
config.bind('<Shift-Escape>', 'mode-leave', mode='passthrough')

## Bindings for prompt mode
config.bind('<Alt-B>', 'rl-backward-word', mode='prompt')
config.bind('<Alt-Backspace>', 'rl-backward-kill-word', mode='prompt')
config.bind('<Alt-D>', 'rl-kill-word', mode='prompt')
config.bind('<Alt-F>', 'rl-forward-word', mode='prompt')
config.bind('<Alt-Shift-Y>', 'prompt-yank --sel', mode='prompt')
config.bind('<Alt-Y>', 'prompt-yank', mode='prompt')
config.bind('<Ctrl-?>', 'rl-delete-char', mode='prompt')
config.bind('<Ctrl-A>', 'rl-beginning-of-line', mode='prompt')
config.bind('<Ctrl-B>', 'rl-backward-char', mode='prompt')
config.bind('<Ctrl-E>', 'rl-end-of-line', mode='prompt')
config.bind('<Ctrl-F>', 'rl-forward-char', mode='prompt')
config.bind('<Ctrl-H>', 'rl-backward-delete-char', mode='prompt')
config.bind('<Ctrl-K>', 'rl-kill-line', mode='prompt')
config.bind('<Ctrl-P>', 'prompt-open-download --pdfjs', mode='prompt')
config.bind('<Ctrl-U>', 'rl-unix-line-discard', mode='prompt')
config.bind('<Ctrl-W>', 'rl-unix-word-rubout', mode='prompt')
config.bind('<Ctrl-X>', 'prompt-open-download', mode='prompt')
config.bind('<Ctrl-Y>', 'rl-yank', mode='prompt')
config.bind('<Down>', 'prompt-item-focus next', mode='prompt')
config.bind('<Escape>', 'mode-leave', mode='prompt')
config.bind('<Return>', 'prompt-accept', mode='prompt')
config.bind('<Shift-Tab>', 'prompt-item-focus prev', mode='prompt')
config.bind('<Tab>', 'prompt-item-focus next', mode='prompt')
config.bind('<Up>', 'prompt-item-focus prev', mode='prompt')

## Bindings for register mode
config.bind('<Escape>', 'mode-leave', mode='register')

## Bindings for yesno mode
config.bind('<Alt-Shift-Y>', 'prompt-yank --sel', mode='yesno')
config.bind('<Alt-Y>', 'prompt-yank', mode='yesno')
config.bind('<Escape>', 'mode-leave', mode='yesno')
config.bind('<Return>', 'prompt-accept', mode='yesno')
config.bind('N', 'prompt-accept --save no', mode='yesno')
config.bind('Y', 'prompt-accept --save yes', mode='yesno')
config.bind('n', 'prompt-accept no', mode='yesno')
config.bind('y', 'prompt-accept yes', mode='yesno')
