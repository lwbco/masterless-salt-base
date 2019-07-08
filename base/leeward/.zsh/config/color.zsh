# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1

if [ ! -z "$(which wal)" ] ; then
  wal -R -e -q -n && /home/linked/.config/bin/show_colors
fi
