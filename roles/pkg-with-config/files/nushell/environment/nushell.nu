use ./keybindings.nu *

export def --env init_env [] {
    $env.config.buffer_editor = $env.EDITOR
    $env.config.show_banner = false
    $env.config.edit_mode = "vi"
    $env.config.keybindings ++= (get_keybindings)
    $env.config.history = {
        file_format: "sqlite"
        max_size: 5_000_000
        sync_on_enter: true
        isolation: true
    }
}
