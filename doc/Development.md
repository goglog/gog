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

# Gog test repo

A real git repository is necesary for testing purpose. Git submodule is not sufficient, run :

```
git clone git://github.com/goglog/gog_test_repo.git spec/gog_test_repo
```

# irb
Launch irb

alter load path
`$LOAD_PATH << "lib"`

require gog
`require './lib/gog'`
