#! /bin/zsh

# Format Package files, but leave the header untouched as it’s significant.
swiftformat --header ignore **/Package.swift

# Format everything apart from package files which were formatted above.
swiftformat --exclude **/Package.swift .