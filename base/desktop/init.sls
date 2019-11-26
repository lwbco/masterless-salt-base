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

/usr/lib/browserpass:
  file.recurse:
    - source: salt://desktop/browserpass

/usr/bin/browserpass-linux64:
  file.managed:
    - source: salt://desktop/browserpass/browserpass-linux64

/etc/opt/chrome/policies/managed/com.github.browserpass.native.json:
  file.managed:
    - makedirs: true
    - source: salt://desktop/browserpass/policies/chromium/com.github.browserpass.native.json

/etc/opt/chrome/native-messaging-hosts/com.github.browserpass.native.json:
  file.managed:
    - makedirs: true
    - source: salt://desktop/browserpass/hosts/chromium/com.github.browserpass.native.json



brave-browser: pkg.latest
brave-keyring: pkg.latest
spotify-client: pkg.latest
webext-browserpass: pkg.latest

# For yubikeys
pcscd: pkg.latest
