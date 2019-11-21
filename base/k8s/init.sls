k8s-repo:
  pkgrepo.managed:
    - name: deb https://apt.kubernetes.io/ kubernetes-xenial main
    - humanname: k8s Package Repository
    - key_url: https://packages.cloud.google.com/apt/doc/apt-key.gpg
    - file: /etc/apt/sources.list.d/k8s.list
    - refresh_db: True

kubelet:
  pkg:
    - latest

kubeadm:
  pkg:
    - latest

kubectl:
  pkg:
    - latest

apt-mark hold kubelet kubeadm kubectl: cmd.run
