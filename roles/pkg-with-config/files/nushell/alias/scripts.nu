# Collection of aliases for my scripts

export alias sl    = suckless                       # Suckless
export alias q     = qutebrowser-profile            # Qutebrowser profile
export alias cv    = img2eps                        # Convert png images to eps (use for groff/roff/neatroff)
export alias color = colorpicker --short --one-shot | xclip -sel clipboard -t UTF8_STRING # Colorpicker
export alias cf    = config                         # Config

# Find project dirs
export def --env pf [] {
    let dir = `ls` ~/code | fzf --reverse --border=rounded --header="Project"
    cd $"~/code/($dir)"
}

# Find UPB directories
export def --env cupb [] {
    let dir = `ls` ~/docs/upb | fzf --reverse --border=rounded --header="UP Baguio Directories"
    cd $"~/docs/upb/($dir)"
}

