# Gog: The Git Changelog

Gog aims to help developers to insert changelog data inside git commits.
Gog allows to create changelogs based on commit data and tagged commits.

# Syntax

They are different ways to create changelog entries:

- One line

```
%Bug fix: Fixing issue #2012
```

- One line - one word 

```
%Feature Adding a function to jobs
```

- Long

```
%%Feature: Adding pluck function to ActiveRecord 
pluck is a function allowing users to select only one column
of a given model.
%%
```

# Tags
Gog will rely on version tags:

```
1.0.0
1.0.1
1.1.0
2.0.0
```

# Changelog creation

To show standard changelog run `gog` in a git repository

```
gog
```

