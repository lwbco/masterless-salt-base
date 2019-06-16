linked:
  group.present:
    - gid: 1133
  user.present:
    - fullname: Leeward Bound
    - uid: 1133
    - gid: 1133
    - shell: /bin/zsh
    {% if grains['os'] in ['Ubuntu', 'Raspbian'] %}
    - groups:
      - sudo
      - adm
      - dip
      - cdrom
      - plugdev
      - docker
      - dialout
    {% endif %}

leeward_ssh_keys:
  ssh_auth.present:
    - user: linked
    - names:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMOoESVQqjLvMJak/qygIGoT2832xwhIetIDyJeOlEqivgzfTRadnwL2/cnWAl3NQpPVmkJaY3Zv+Mye0c06eHmycrusCPZJgEFESkLYtSRPBILgTe+Ujd0AaZ+EtepY0kTSzJJn5F6rL1O5bPJKNE4sLis6Vyrn/OeWhbNH53BB+KwkkdadtGpsJbS0ZkiHk9NmYO95wGRomV4YDELTTtG+G2BZh61QMQPECliRq9YMlASDFYEQe//BsfL6b5gjKWn5/fm2eCj45bzG+mAPNeWBVNqe8H9teGFEuS2BCNuQdb90LjndtqEyyiOGRJOVh8dUUooBv9C1seJpH5keFB cardno:000609757438

/home/linked/.config/Yubico/u2f_keys:
  file.managed:
    - makedirs: true
    - source: salt://users/leeward/u2f-leeward
    - user: 1133
    - group: 1133

/home/linked/.config/terminator/config:
  file.managed:
    - makedirs: true
    - source: salt://users/leeward/terminator.conf
    - user: 1133
    - group: 1133

/home/linked/.config/i3-regolith/config:
  file.managed:
    - makedirs: true
    - source: salt://users/leeward/i3wm.conf
    - user: 1133
    - group: 1133

/home/linked/.config/gtk-3.0/gtk.css:
  file.managed:
    - makedirs: true
    - source: salt://users/leeward/gtk-3.0.css
    - user: 1133
    - group: 1133

