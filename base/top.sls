base:
  '*.lwb.co':
    - python-pip
    - docker
    - fail2ban
    - git
    - groups
    - iotop
    - iptables
    - ntpd
    - screen
    - ssh
    - sysstat
    - timezone
    - wget
    - salt.minion
    - salt.base
    - users
    - leeward

  '*.servers.lwb.co':
    - salt.cronjob
    - k8s

  '*.workstations.lwb.co':
    - force_yubikey
    - desktop
    - leeward.desktop

