python3:
  pkg:
    - latest
python3-dev:
  pkg:
    - latest
python3-pip:
  pkg:
    - latest

python3.7: pkg.installed

/usr/bin/python:
  file.symlink:
    - target: /usr/bin/python3.7

/usr/local/bin/pip:
  file.symlink:
    - target: /usr/bin/pip3
    - unless:
      - ls /usr/bin/pip

pip-upgrade:
  pip.installed:
    - upgrade: True
    - bin_env: /usr/bin/pip3
    - require:
      - pkg: python3-pip
