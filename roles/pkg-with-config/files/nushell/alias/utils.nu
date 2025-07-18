# Collection of aliases for 3rd party softwares

export alias se    = doasedit                             # Doasedit
export alias tf    = terraform                            # Terraform
export alias lg    = lazygit                              # Lazygit
export alias man   = batman                               # Batman
export alias grep  = grep --color=auto                    # Grep with colors
export alias diff  = diff --color=auto                    # Diff with colors
export alias empty = truncate -s 0                        # Truncate whitespace
export alias calc  = fend                                 # Fend
export alias o     = xdg-open                             # XDG-open
export alias pyact = overlay use .venv/bin/activate.nu    # Source python virtual env

# Enables yazi to follow PWD
export def --env yazicd [] {
    let tmp = (mktemp -t "yazi-cwd.XXXXX")
    yazi --cwd-file=($tmp)

    let cwd = (cat $tmp)
    if ($cwd != $env.PWD) {
        cd $cwd
    }

    `rm` -f $tmp
}
