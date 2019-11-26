terminator:
  pkg:
    - latest

gnome-tweaks: pkg.latest

brave-repo:
  pkgrepo.managed:
    - name: deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com eoan main
    - humanname: Brave Package Repository
    - key_url: https://brave-browser-apt-release.s3.brave.com/brave-core.asc
    - file: /etc/apt/sources.list.d/brave.list
    - refresh_db: True

spotify-repo:
  pkgrepo.managed:
    - name: deb http://repository.spotify.com stable non-free
    - humanname: Spotify Package Repository
    - key_url: https://download.spotify.com/debian/pubkey.gpg
    - file: /etc/apt/sources.list.d/spotify.list
    - refresh_db: True

nextcloud-ppa:
  pkgrepo.managed:
    - ppa: nextcloud-devs/client
  pkg.latest:
    - name: nextcloud-client
    - refresh: True



brave-browser: pkg.latest
brave-keyring: pkg.latest
spotify: pkg.latest

# For yubikeys
pcscd: pkg.latest
