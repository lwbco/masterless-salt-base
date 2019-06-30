/srv/masterless/lwbco:
  file.directory:
    - user: root
    - group: root
    - mode: 700
    - makedirs: True

base_states:
  git.latest:
    - name: https://github.com/lwbco/masterless-salt-base.git
    - target: /srv/masterless/lwbco
    - force_reset: True
    - force_checkout: True

/usr/local/bin/salt.lwbco:
  file.managed:
    - source: salt://salt/salt.lwbco
    - mode: 700
    - user: root
    - group: root
