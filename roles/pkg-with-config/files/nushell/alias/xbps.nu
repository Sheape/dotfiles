# Collection of aliases for xbps (void package manager)

export alias query        = xbps-query -Rs           # Search for void packages and sync remote
export alias install      = sudo xbps-install -S     # Install a void package
export alias update       = sudo xbps-install -Su    # Update all void packages
export alias check-update = sudo xbps-install -Snu   # Check if there are updates in void packages
export alias remove       = sudo xbps-remove         # Remove a void package
export alias removel      = sudo xbps-remove -R      # Remove a void package recursively
