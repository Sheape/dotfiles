export def init_carapace [] {
    mkdir ($nu.data-dir | path join "vendor/autoload")
    carapace _carapace nushell | save -f ($nu.data-dir | path join "vendor/autoload/carapace.nu")
}
