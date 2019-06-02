/etc/cron.d/salt-masterless:
  file.managed:
    - source: salt://salt/config/etc/cron.d/salt-masterless
