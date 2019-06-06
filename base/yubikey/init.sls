yubikey_package_repo:
  pkgrepo.managed:
    - ppa: yubico/stable
  pkg.latest:
    - name: libpam-u2f
    - refresh: True

/home/linked/.config/Yubico/u2f_keys:
  file.managed:
    - source: salt://users/u2f-leeward
    - user: 1133
    - group: 1133

/etc/pam.d/gdm-password:
  file.managed:
    - source: salt://yubikey/gdm-password
    - user: root
    - group: root
    - mode: 644
