apt-transport-https:
  pkg:
    - latest

ca-certificates:
  pkg:
    - latest

software-properties-common:
  pkg:
    - latest

docker-repo:
  pkgrepo.managed:
    - name: deb [arch=amd64] https://download.docker.com/linux/{{ grains["os"]|lower }} {{ grains["oscodename"].replace('eoan', 'disco') }} stable edge test
    - humanname: Docker Package Repository
    - key_url: https://download.docker.com/linux/{{grains["os"]|lower}}/gpg
    - file: /etc/apt/sources.list.d/docker.list
    - refresh_db: True

{% if grains['os'] == 'Ubuntu' %}
docker-ce:
  pkg:
    - latest
    - require:
      - pkg: git
      - pkg: ca-certificates
      - pkg: apt-transport-https
      - pkg: software-properties-common
  {% elif grains['os'] == 'Raspbian' %}
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh:
  cmd.run:
    - creates: /usr/bin/docker

  {% endif%}

docker:
  service:
    - running
    - enable: True

docker-compose:
  pip.installed:
    - name: docker-compose
    - bin_env: /usr/bin/pip3
    - require:
      - pkg: python3-pip
