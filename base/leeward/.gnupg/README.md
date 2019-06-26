Usage Notes
===========

This .gnupg directory is setup to be deployed for me using my yubikeys.

If you have your own yubikeys and want to use my setup, you should:

+ Fork this repo

+ Update public.asc with your yubikey public key (`gpg --armor --export $KEY_ID`)

+ To generate a trustdb for your yubikey: You must set your yubikey trust level to 5 so
    you can distribute the trustdb through salt; Run `gpg`, type `trust` and enter `5`
    to generate your ~/.gnupg/trustdb.gpg
