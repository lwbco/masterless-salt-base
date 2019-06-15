base:
  '*.lwb.co':
    - docker
    - fail2ban
    - git
    - groups
    - iotop
    - iptables
    - ntpd
    - python-pip
    - screen
    - ssh
    - swap
    - sysstat
    - timezone
    - wget
    - salt.minion
    - salt.base
    - users
    - users.leeward

  '*.servers.lwb.co':
    - salt.cronjob

  '*.workstations.lwb.co':
    - yubikey
    - desktop

