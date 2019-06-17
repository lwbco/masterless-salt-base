/home/linked/.config/terminator/config:
  file.managed:
    - makedirs: true
    - source: salt://leeward/terminator.conf
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

pywal:
  pip.installed:
    - name: pywal

