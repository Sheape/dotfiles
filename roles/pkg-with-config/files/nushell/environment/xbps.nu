export def --env init_env [] {
    $env.ARCH = "x86_64"
    $env.XBPS_ARCH = $env.ARCH
    $env.XBPS_TARGET_ARCH = $env.ARCH
    $env.XBPS_DISTDIR = "/opt/void-packages/"
    $env.XDEB_PKGROOT = $"($env.HOME)/.local/src/xdeb"
    $env.XDEB_OPT_DEPS = true
    $env.XDEB_OPT_WARN_CONFLICT = true
    $env.XDEB_OPT_FIX_CONFLICT = true
}
