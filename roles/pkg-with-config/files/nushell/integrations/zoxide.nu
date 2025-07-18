export def init_zoxide [] {
    mkdir ($nu.data-dir | path join "vendor/autoload")
    zoxide init nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")
}
