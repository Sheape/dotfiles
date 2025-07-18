export def --env init_env [] {
    # C/C++
    $env.CC = "clang"

    # Zsh
    $env.ZDOTDIR = ($env.XDG_CONFIG_HOME | path join zsh)
    $env.DIRSTACKFILE = ($env.XDG_CONFIG_HOME | path join zsh dirs)

    # Python/Qt
    $env.QT_QPA_PLATFORMTHEME = "qt6ct"
    $env.QUTE_QT_WRAPPER = "PyQt6"

    # Rust
    $env.RUSTUP_HOME = ($env.HOME | path join .local rustup)
    $env.CARGO_HOME = ($env.HOME | path join .local cargo)

    # Javascript
    $env.DENO_INSTALL = ($env.HOME | path join local src .deno)

    # Android
    $env.ANDROID_HOME = ($env.HOME | path join Android Sdk)
    $env.ANDROID_ADB_HOME = ($env.HOME | path join .android)
    $env.ANDROID_SDK_HOME = ($env.HOME | path join Android Sdk)

    # Go
    $env.GOPATH = ($env.HOME | path join .local share go)
}
