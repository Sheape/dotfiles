# Collection of aliases for editors

export def --env neovide-no-config [...args] {
    $env.NVIM_APPNAME = "nvim-no-lsp"
    neovide ...$args
}

export def --env neovim-no-config [...args] {
    $env.NVIM_APPNAME = "nvim-no-lsp"
    nvim ...$args
}

export alias v   = neovide             # Neovide
export alias vn  = neovide-no-config   # Neovim
export alias vni = neovim-no-config    # Neovim
export alias vi  = nvim                # Neovim
export alias e   = emacsclient -c      # Emacs client
