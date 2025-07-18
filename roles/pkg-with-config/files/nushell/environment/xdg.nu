export def --env init_env [] {
    $env.XDG_CONFIG_HOME = ($env.HOME | path join .config)
    $env.XDG_CACHE_HOME = ($env.HOME | path join .cache)
    $env.XDG_DATA_HOME = ($env.HOME | path join .local share)
    $env.XDG_RUNTIME_DIR = "/run/user/1000"
    $env.XDG_SESSION_TYPE = "wayland"
}
