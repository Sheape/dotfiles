# Collection of aliases/short def for core utils

export alias core-ls = ls
export alias lse = eza -lah --icons # Exa with extended properties

# List the filenames, sizes, and modification times of items in a directory.
export def ls [
    --short-names (-s), # Only print the file names, and not the path
    --full-paths (-f),  # display paths as absolute paths
    --du (-d),          # Display the apparent directory size ("disk usage") in place of the directory metadata size
    --directory (-D),   # List the specified directory itself instead of its contents
    --mime-type (-m),   # Show mime-type in type column instead of 'file' (based on filenames only; files' contents are not examined)
    --threads (-t),     # Use multiple threads to list contents. Output will be non-deterministic.
    ...pattern: glob,   # The glob pattern to use.
]: [ nothing -> table ] {
    let pattern = if ($pattern | is-empty) { [ '.' ] } else { $pattern }
    (core-ls
        --all=true
        --long=true
        --short-names=$short_names
        --full-paths=$full_paths
        --du=$du
        --directory=$directory
        --mime-type=$mime_type
        --threads=$threads
        ...$pattern
    ) | sort-by type name -i | select mode name size modified
}

# Ls with extended properties
export def lsa [] {
    core-ls -alm | select mode name size modified user
}

export alias mv = mv -i # Move interactively
export alias cp = cp -i # Copy interactively
export alias rm = rm -I # Remove interactively
export alias cl = clear # Clear the terminal
