# nix-source-filtering-demo

This repo is for testing source filtering provided by [nix-gitignore](https://github.com/NixOS/nixpkgs/blob/aef16f9cb42290dca27588d6229a668740a79296/doc/functions/nix-gitignore.section.md).

## Usage

```console
$ test/run.sh
trace: source.filter /nix/store/7dn4wxhyqmi2j1v442ynj74k3n0gd59v-pvvbjj0hdq70sjh8c7hka4pazgdw0s36-source/.gitignore = true
trace: source.filter /nix/store/7dn4wxhyqmi2j1v442ynj74k3n0gd59v-pvvbjj0hdq70sjh8c7hka4pazgdw0s36-source/main.c = true
trace: source.filter /nix/store/7dn4wxhyqmi2j1v442ynj74k3n0gd59v-pvvbjj0hdq70sjh8c7hka4pazgdw0s36-source/test = true
trace: source.filter /nix/store/7dn4wxhyqmi2j1v442ynj74k3n0gd59v-pvvbjj0hdq70sjh8c7hka4pazgdw0s36-source/test/run.sh = true

total 16
dr-xr-xr-x      5 root  wheel       160 Jan  1  1970 .
drwxrwxr-t  46752 root  nixbld  1496064 Oct 26 21:09 ..
-r--r--r--      1 root  wheel        20 Jan  1  1970 .gitignore
-r--r--r--      1 root  wheel        44 Jan  1  1970 main.c
dr-xr-xr-x      3 root  wheel        96 Jan  1  1970 test
```

The test will create a `secret.env` file at runtime. But as you see, that file is not included in `$src`, which is what we expected.

## License

WTFPL
