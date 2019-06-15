yubikey_package_repo:
  pkgrepo.managed:
    - ppa: yubico/stable
  pkg.latest:
    - name: libpam-u2f
    - refresh: True

/etc/pam.d/gdm-password:
  file.managed:
    - source: salt://yubikey/gdm-password
    - user: root
    - group: root
    - mode: 644
