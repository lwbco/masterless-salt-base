/etc/sudoers.d/sudonopasswd:
  file.managed:
    - contents: "%sudo   ALL = (ALL) NOPASSWD: ALL"
    - user: root
    - group: root
    - mode: 440

zsh:
  pkg:
    - installed

bc:
  pkg:
    - installed

neovim:
  pkg:
    - installed
