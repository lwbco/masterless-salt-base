/home/linked/.config/terminator/config:
  file.managed:
    - makedirs: true
    - source: salt://leeward/terminator.conf
    - user: 1133
    - group: 1133

/home/linked/.Xresources:
  file.managed:
    - makedirs: true
    - source: salt://leeward/.Xresources
    - user: 1133
    - group: 1133

/home/linked/.Xdefaults:
  file.managed:
    - makedirs: true
    - source: salt://leeward/.Xdefaults
    - user: 1133
    - group: 1133

/home/linked/.urxvt-perls:
  file.recurse:
    - source: salt://leeward/.urxvt-perls
    - user: 1133
    - group: 1133

/home/linked/.config/i3-regolith/config:
  file.managed:
    - makedirs: true
    - source: salt://leeward/i3wm.conf
    - user: 1133
    - group: 1133

/home/linked/.config/gtk-3.0/gtk.css:
  file.managed:
    - makedirs: true
    - source: salt://leeward/gtk-3.0.css
    - user: 1133
    - group: 1133

/etc/xdg/compton.conf:
  file.managed:
    - makedirs: true
    - source: salt://leeward/compton.conf

/home/linked/.gitconfig:
  file.managed:
    - makedirs: true
    - source: salt://leeward/.gitconfig
    - user: 1133
    - group: 1133


/home/linked/.config/wallpaper.jpg:
  file.managed:
    - makedirs: true
    - source: salt://leeward/wallpapers/space_rockets_planets.jpg
    - user: 1133
    - group: 1133

/home/linked/.themes:
  file.recurse:
    - source: salt://leeward/gtk-themes
    - user: 1133
    - group: 1133

/home/linked/.gnupg:
  file.recurse:
    - source: salt://leeward/.gnupg
    - dir_mode: 700
    - file_mode: 600
    - user: 1133
    - group: 1133

reload_xrdb:
  cmd.run:
    - name: xrdb ~/.Xresources
    - runas: linked
    - cwd: /home/linked
    - onchanges:
      - file: /home/linked/.Xresources

load_gpg_keys:
  cmd.run:
    - name: gpg2 --import ~/.gnupg/public.asc
    - runas: linked
    - cwd: /home/linked
    - onchanges:
      - file: /home/linked/.gnupg
    - require:
      - pkg: gnupg2

pywal:
  pip.installed:
    - name: pywal
    - bin_env: /usr/bin/pip3
    - require:
      - pkg: python3-pip


rxvt-unicode: pkg.installed
gnupg2: pkg.installed
gnupg-agent: pkg.installed
scdaemon: pkg.installed
pass: pkg.installed
qtpass: pkg.installed
caffeine: pkg.installed
xdotool: pkg.installed
