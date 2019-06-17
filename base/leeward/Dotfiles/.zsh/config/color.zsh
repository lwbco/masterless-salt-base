# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1

# Refresh the Wal for each new terminal
wal -R -e -q -n
