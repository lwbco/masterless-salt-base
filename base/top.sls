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
    - sysdig
    - sysstat
    - timezone
    - wget
    - salt.minion
    - salt.base

  '*.servers.lwb.co':
    - salt.cronjob


