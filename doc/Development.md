# General dev help
You must require the lib folder in order to directly gog binary:

```
Ruby -Ilib bin/gog version
alias gogdev='Ruby -Ilib bin/gog'

```

# Todo :

- Give more info with --help
- Allow one line multiple words
- Allow multiline changelogs

# Test submodule

Git submodules are necesary for testing purpose run :

```
git submodule init
git submodule update
```