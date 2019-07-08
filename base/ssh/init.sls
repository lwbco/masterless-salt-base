openssh-server: pkg.installed

ssh:
  service:
    - running
    - enable: True

/etc/ssh/sshd_config:
  file.append:
    - text:
      - StreamLocalBindUnlink yes
