# langs.nu must be loaded first
def get_ext_path [] {
    [
        $"($env.HOME)/bin",
        $"($env.HOME)/.bin",
        $"($env.HOME)/.local/bin",
        $"($env.HOME)/.emacs.d/bin",
        $"($env.HOME)/.config/emacs/bin",
        $"($env.HOME)/.local/cargo/bin"
        $"($env.HOME)/.jbang/bin",
        $"($env.HOME)/.encore/bin",
        $"($env.HOME)/.dotnet",
        $"($env.HOME)/.local/share/pnpm",
        $"($env.DENO_INSTALL)/bin",
        $"($env.ANDROID_HOME)/emulator",
        $"($env.ANDROID_HOME)/platform-tools",
        $"($env.ANDROID_HOME)/cmdlines-tools/latest/bin",
        $"($env.GOPATH)/bin",
        "/usr/local/bin",
        "/usr/lib/ruby/gems/3.1.0/bin",
        "/usr/lib/qt6/bin",
        "/opt/texlive/2024/bin/x86_64-linux"
    ]
}

export def --env init_env [] {
    $env.PATH = ($env.PATH | append (get_ext_path))
    $env.DISTRO = "void"
    $env.DISTRO_LIST = "void:gentoo"
    $env.WAYLAND_DISPLAY = "wayland-1"
    $env.EDITOR = "neovide"
    $env.TERMINAL = "st"
    $env.BROWSER = "qutebrowser"
    $env.STARSHIP_CONFIG = ($env.XDG_CONFIG_HOME | path join starship starship.toml)
    $env.GROFF_FONT_PATH = "/usr/share/fonts/groff"
    $env.LS_COLORS = (vivid generate catppuccin-mocha)
    $env.BAT_THEME = "Catppuccin-mocha"
    $env.COOKIECUTTER_CONFIG = ($env.XDG_CONFIG_HOME | path join cookiecutter cookiecutter.yml)
}
