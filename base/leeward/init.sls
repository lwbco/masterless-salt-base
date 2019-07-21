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
    - source: salt://leeward/u2f-leeward
    - user: 1133
    - group: 1133

/home/linked/.zshrc:
  file.managed:
    - makedirs: true
    - source: salt://leeward/.zshrc
    - user: 1133
    - group: 1133

/home/linked/.config/bin:
  file.recurse:
    - source: salt://leeward/bin
    - user: 1133
    - group: 1133

chmod +x /home/linked/.config/bin/*:
  cmd.run:
    - watch:
      - /home/linked/.config/bin

/home/linked/.zsh:
  file.recurse:
    - source: salt://leeward/.zsh
    - user: 1133
    - group: 1133

/home/linked/.config/nvim:
  file.recurse:
    - source: salt://leeward/nvim
    - user: 1133
    - group: 1133

install_vim_plugins:
  cmd.run:
    - name: /usr/bin/nvim +PlugInstall +qall &>/dev/null
    - runas: linked
    - cwd: /home/linked
    - onchanges:
      - file: /home/linked/.config/nvim

ssh_keys_exist:
  cmd.run:
    - name: ssh-keygen -t rsa -b 4096
    - cwd: /home/linked
    - runas: linked
    - creates: /home/linked/.ssh/id_rsa


root_ssh_keys_exist:
  cmd.run:
    - name: cp /home/linked/.ssh/id_rsa .ssh/ && chown -R root:root .ssh
    - cwd: /root
    - creates: /root/.ssh/id_rsa

# Apps
direnv: pkg.installed
autojump: pkg.installed

tmux: pkg.installed
jq: pkg.installed
silversearcher-ag: pkg.installed
net-tools: pkg.installed
cowsay: pkg.installed

python3-venv: pkg.installed
python3-pylint-common: pkg.installed
resolvconf: pkg.installed

black:
  pip.installed:
    - name: black
    - bin_env: /usr/bin/pip3
    - require:
      - pkg: python3-pip
