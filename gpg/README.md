# Setup commit signature & GitHub

> This configuration is based on MacOS Ventura

## Install

```sh
brew install gpg2 gnupg pinentry-mac
```

## Configure
```sh
mkdir ~/.gnupg
echo 'pinentry-program $(brew --prefix)/bin/pinentry-mac\nallow-loopback-pinentry' > ~/.gnupg/gpg-agent.conf
echo 'use-agent\npinentry-mode loopback' > ~/.gnupg/gpg.conf
echo 'export GPG_TTY=\$(tty)' >> ~/.zshrc  
```

## Generate the GPG key
```sh
gpg --full-gen-key

# begining output
gpg: WARNING: unsafe permissions on homedir '/Users/jcalvopina/.gnupg'
gpg (GnuPG) 2.3.8; Copyright (C) 2021 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Please select what kind of key you want:
   (1) RSA and RSA
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)
   (9) ECC (sign and encrypt) *default*
  (10) ECC (sign only)
  (14) Existing key from card
Your selection? 4 #<---- answer
RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (3072) 4096 #<---- answer
Requested keysize is 4096 bits
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0) 0 #<---- answer
Key does not expire at all
Is this correct? (y/N) y #<---- answer

GnuPG needs to construct a user ID to identify your key.

Real name: Juan Calvopina #<---- answer
Email address: juan.calvopina@gmail.com #<---- answer
Comment:  #<---- empty answer
You selected this USER-ID:
    "Juan Calvopina <juan.calvopina@gmail.com>"

Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O #<---- answer
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
gpg: directory '/Users/jcalvopina/.gnupg/openpgp-revocs.d' created
gpg: revocation certificate stored as '/Users/jcalvopina/.gnupg/openpgp-revocs.d/F548F4D36829D826A86B365B5C7EE00FE875714A.rev'
public and secret key created and signed.

Note that this key cannot be used for encryption.  You may want to use
the command "--edit-key" to generate a subkey for this purpose.
pub   rsa4096 2022-11-11 [SC]
      F548F4D36829D826A86B365B5C7EE00FE875714A
uid                      Juan Calvopina <juan.calvopina@gmail.com>
# ending output
```

## Permissions
```sh
chown -R $(whoami) ~/.gnupg/
chmod 600 ~/.gnupg/*
chmod 700 ~/.gnupg
```

## Verification
```sh
gpg -k
```

## Generate short key
```sh
gpg -K --keyid-format SHORT

# beniging output
gpg: WARNING: unsafe permissions on homedir '/Users/jcalvopina/.gnupg'
/Users/jcalvopina/.gnupg/pubring.kbx
------------------------------------
sec   rsa4096/E875714A 2022-11-11 [SC]  #<---- answer E875714A
      F548F4D36829D826A86B365B5C7EE00FE875714A
uid         [ultimate] Juan Calvopina <juan.calvopina@gmail.com>
# ending output
```

## Generate publick GPG key
```sh
gpg --armor --export E875714A #<---- use the before answer E875714A

# begining output

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQINBGNt19sBEACmfaY4fziWF1kULsfhViI0oJpvmXyXT/TzSQ7ZrFavaWNrcJnX
A6z7LJaKL4k0EDBtk3dgptJ3tgnwRH/YpA3ZWSFrE91AXQvbYjIR/l0xudDvBaxM
YXHQlg5cwGwh87vxIMYEnX4Ef05xfYiQXR+NUhG1FSwqgBh8yVLymf4D8IkSPCMG
kcs6ewlQaGg7aQ0clVC1L3HCjG6nhlNi8etgujOWEn55QJSVrhwZRuRvU9mlQvXb
T8hZQDZi5EJJSkw593SRQVGeWfHiMZbK2hXWKzizY6OE/R6BJ2nGG3lTPRckOwB5
xC6h6e8z7nlCF/sllZKzjfIjkHeYJYt0ifqlv/bAq52e9rYEv2oAK3oIfcxifrvc
kU5hguxBI/b00rqy3+Ms/nf2hy935zJjxg49QWKZHI6cLLMN6IyX7RuJRaHjKxKo
fF+g1ybbDAfaRXdixPgTOOt7KVCvyk0dhRiTuB8Kti9bVbQbqisHeg4cWJVEmFei
ERKIOD/5sFz9aPEffeo8Hu5/yw2YiSSUipqLxRdcOWaIMjAdD82ZoHYLC+W9AvxL
mAWywpMoRsjJ1nw0e4jCOcSOBAm03S3Zn5XQcmuYEVxZyR7V0VODVQBGdyQBEjkv
x0wuF4cGmFefUtzSMxTeYM07sv4BmUrAdvLltMe7XDItnaK4xD+2MOf38wARAQAB
tClKdWFuIENhbHZvcGluYSA8anVhbi5jYWx2b3BpbmFAZ21haWwuY29tPokCUQQT
AQgAOxYhBPVI9NNoKdgmqGs2W1x+4A/odXFKBQJjbdfbAhsDBQsJCAcCAiICBhUK
CQgLAgQWAgMBAh4HAheAAAoJEFx+4A/odXFKE3gP/iIdd0NxF2QXkbpf2vSzVQ0E
GU99+fkeLaqtDb5HtkKOmpRNnAA5ddIyojCM2li5pDpA3KnTk4MqvDSvHVoXcbvj
gLL+A+kRXLVkcdgZLux/my8zbGBeoytrCQrjtUBjfTagugLIK55SIdzkXwY+eD4J
EMAis+zplr3kY6Bo0httnDaPoEhcc8hJX2/SG2t2O1IDP5eKUwcHYc81+G9MwheH
GaQUkIQ8hkrJlJcIrN3j8IGz57I6Bf+YWgKFUac0VwXH93AE7NxdSXk33n7yYn7h
4b0Q4dB90E0frcTZVVU/BpUxWkHRt3NWZX5B/xrmjFGjPa+HscDT6bceAkYcxDNb
uPfXGxbk+O9nT9bI9/7DX9/5Cle4nmfDdXL/59uYxRWvkqvwOIR+yZ8AUCuINvYv
bZZJttaqgLIkG+lbNY0+14k7s52sSUIZOc8O9NbCNi9mvLT7a0APoghA3qOqFpK1
L6wzFc95ej+wMh9DpKu+JCv0MQCQppOOVCI+7GYLfNJp9ns93ECqHMFOqSbRij6w
ykO5U9HEVhpbSfo/ureI+JV8qMwigDAAQhtPwCJnyqIpB/dW+Jh27EwNF459YHJR
9XJ2nvkqTTaw64U/GPDSDyTdisrxXpuxNwf/pS1vDjMOpZsrwAAhWMKrEtx8kcS8
YKBMAxB2PWr7WoJ5UqbO
=Zjrb
-----END PGP PUBLIC KEY BLOCK-----

# ending output
```

## Configure Github

* Go to `https://github.com/settings/profile`
* Navegate to `Access `option and choose  `SSH and GPG keys`
* Navegate to `GPG keys` and choose `New GPG key`
* Insert a `title` and paste the PGP PUBLIC KEY BLOCK [official documentation](https://docs.github.com/en/authentication/managing-commit-signature-verification/adding-a-gpg-key-to-your-github-account)

## Configure Git
```sh
git config --global commit.gpgsign true
git config --global tag.gpgsign true
git config --global gpg.program $(which gpg)
git config --global user.signingkey E875714A #<---- answer E875714A
```

## Sign and verify the commit
```sh
git commit -m "My first signed commit"
# enter your password
git log --show-signature -1

# begining outout
commit 21894e90f1b614a50fb2a6a3d235a6b1a64f763a (HEAD -> master)
gpg: Signature made Fri Nov 11 00:47:40 2022 -05
gpg:                using RSA key F548F4D36829D826A86B365B5C7EE00FE875714A
gpg: Good signature from "Juan Calvopina <juan.calvopina@gmail.com>" [ultimate]
Author: Juan Calvopina <juan.calvopina@gmail.com>
Date:   Fri Nov 11 00:47:40 2022 -0500

    My first signed commit
(END)
# ending output
```


### Troubleshoting

* If you get this error:
```sh
error: gpg failed to sign the data
fatal: failed to write commit object
``` 
 
 Then run the daemon and try again
 ```sh
 killall gpg-agent && gpg-agent --daemon --use-standard-socket --pinentry-program /usr/local/bin/pinentry
```


### Resources
* [Cómo firmar y verificar tus commits con una llave GPG](https://platzi.com/blog/como-firmar-y-verificar-tus-commits-con-una-llave-gpg/)
* [gpg failed to sign the data fatal: failed to write commit object](https://stackoverflow.com/questions/39494631/gpg-failed-to-sign-the-data-fatal-failed-to-write-commit-object-git-2-10-0)
