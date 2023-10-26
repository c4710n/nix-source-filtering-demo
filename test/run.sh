#!/usr/bin/env bash


echo 'A_TRUTH="This world is virtual."' > secret.env

nix build .# \
    && ls -al result/ \
    && echo "

Is "secret.env" included in above output?
+ yes - everything's fine.
+ no - something's wrong.
"
