# Hombrew initialize
eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$HOME/Library/Application Support/edgedb/bin:$PATH"

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
